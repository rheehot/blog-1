package com.sang12.blog.service.common.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.domain.board.BoardReplyEntity;
import com.sang12.blog.repository.common.BoardDao;
import com.sang12.blog.repository.common.BoardRepository;
import com.sang12.blog.repository.common.CategoryDao;
import com.sang12.blog.repository.common.CategoryRepository;
import com.sang12.blog.service.common.BoardService;
import com.sang12.blog.vo.admin.boardVo;

/**
 * com.sang12.blog.service.common.impl
 * BoardServiceImpl.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 25.
 * @Description : board 서비스 구현체 
 */

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardRepository boardRep;
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private CategoryRepository categoryRep;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Value("${security.mail.id}")
	String mailId;
	
	@Value("${security.mail.pw}")
	String mailPw;
	
	@Override
	public void articleSave(BoardEntity board) {
		board.setRegisterDate(new Date());
		board.setFinalChangeDate(new Date());
		boardRep.save(board);
	}
	
	@Override
	public void articleUpdate(BoardEntity board) {
		BoardEntity boardToUpdate = boardRep.getOne(board.getBoardId()); 
		
		boardToUpdate.setTitle(board.getTitle());
		boardToUpdate.setContent(board.getContent());
		boardToUpdate.setLargeCategory(board.getLargeCategory());
		boardToUpdate.setMiddleCategory(board.getMiddleCategory());
		boardToUpdate.setContent(board.getContent());
		boardToUpdate.setKeyword(board.getKeyword());
		boardToUpdate.setDisplayYn(board.getDisplayYn());
		boardToUpdate.setFinalChangeDate(new Date());
		
		//추후 세션아디디로 변경해야함
		boardToUpdate.setFinalChangeId("sang12");
		boardRep.save(boardToUpdate);
	}

	@Override
	public Page<BoardEntity> getMainArticleList(Pageable pageable) {
		Page<BoardEntity> board = boardRep.findAll(pageable);
		return board;
	}

	@Override
	public Map<String, Object> getAdminArticleList(boardVo vo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("param::" + vo);
		int cnt = boardDao.getAdminArticleListCount(vo);
		resultMap.put("data",  boardDao.getAdminArticleList(vo));
		resultMap.put("recordsTotal",  cnt);
		resultMap.put("recordsFiltered",  cnt);
		System.out.println("rwsultMap:: "+resultMap);
		return resultMap;
	}

	@Override
	public BoardEntity getArticleDetail(int boardId) {
		return boardDao.getArticleDetail(boardId);
	}
	
	@Override
	public Map<String, Object> getArticle(int boardId) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<BoardEntity> boardList = boardDao.getMainArticleByBoardId(boardId);
		BoardEntity board = boardList.get(0);
		returnData.put("articleList", boardList);
		//다른 게시물 리스트 가져오기
		for(BoardEntity boardDetail : boardList) {
			boardDetail.setRelateBoardTitleList(boardDao.getRelateBoardTitleList(board));
			board.setBoardReplyEntity(sortReplyList(boardDao.getReplyList(board)));
		}
		returnData.put("mainTitle", board.getTitle());
		returnData.put("upCategoryList", categoryDao.getLargeCategoryList());
		returnData.put("childCategoryList", categoryRep.findChildCategory());
		return returnData;
	}
	
	@Override
	public Boolean addReply(BoardReplyEntity boardReply) {
		boardDao.addReply(boardReply);
		return true;
	}
	
	@Async
	public void sendReplyMail(BoardReplyEntity boardReply) {
		if(!"".equals(mailId)) {
			Properties props = System.getProperties();
			props.put("mail.smtp.host", "smtp.naver.com");
			props.put("mail.smtp.port", "25");
			props.put("defaultEncoding", "utf-8");
			props.put("mail.smtp.auth", "true");
			
			System.out.println("매일 보내기 " + mailId + mailPw);
			
			try {
				String sender = mailId + "@naver.com"; 
				String subject = "[블로그 댓글] 게시글 번호: " + boardReply.getBoard_id(); 
				String body = "http://sang12.co.kr/" + boardReply.getBoard_id() + "\n" +boardReply.getReply_content();
				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(mailId, mailPw);
					}
				});
				
				session.setDebug(false); //Debug 모드 설정.
				Message mimeMessage = new MimeMessage(session);
				mimeMessage.setFrom(new InternetAddress(sender)); 
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress("sang12@kakao.com") ); //수신자 셋팅
				mimeMessage.setSubject(subject); //제목 세팅
				mimeMessage.setText(body); //본문 세팅
				Transport.send(mimeMessage);
			} catch (Exception e) {
				System.out.println("메일보내기 오류 : "+ e.getMessage());
			}
		}
	}

	@Override
	public List<BoardReplyEntity> getBoardReplyList(BoardEntity board) {
		return sortReplyList(boardDao.getReplyList(board));
	}
	
	 /**
	  * 게시판 댓글 자식과 부모리를 소팅한다.
	 * @param boardReplyList
	 * @return
	 */
	public List<BoardReplyEntity> sortReplyList(List<BoardReplyEntity> boardReplyList) {
       List<BoardReplyEntity> boardReplyListParent = new ArrayList<BoardReplyEntity>();
       List<BoardReplyEntity> boardReplyListChild = new ArrayList<BoardReplyEntity>();
       List<BoardReplyEntity> newBoardReplyList = new ArrayList<BoardReplyEntity>();

       //1.부모와 자식 분리
       for(BoardReplyEntity boardReply: boardReplyList){
           if(boardReply.getDepth().equals("0")){
               boardReplyListParent.add(boardReply);
           }else{
               boardReplyListChild.add(boardReply);
           }
       }

       //2.부모를 돌린다.
       for(BoardReplyEntity boardReplyParent: boardReplyListParent){
           //2-1. 부모는 무조건 넣는다.
           newBoardReplyList.add(boardReplyParent);
           //3.자식을 돌린다.
           for(BoardReplyEntity boardReplyChild: boardReplyListChild){
               //3-1. 부모의 자식인 것들만 넣는다.
               if(boardReplyParent.getReply_id().equals(boardReplyChild.getParent_id())){
                   newBoardReplyList.add(boardReplyChild);
               }
           }
       }
       //정리한 list return
       return newBoardReplyList;
	 }

	@Override
	public Boolean deleteBoardReply(BoardReplyEntity boardReply) {
		try {
			int count = boardDao.deleteBoardReply(boardReply);
			if(count == 1) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
