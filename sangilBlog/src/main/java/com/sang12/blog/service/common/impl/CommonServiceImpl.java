package com.sang12.blog.service.common.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rometools.rome.feed.rss.Channel;
import com.rometools.rome.feed.rss.Description;
import com.rometools.rome.feed.rss.Item;
import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.domain.board.BoardReplyEntity;
import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.domain.common.JoinCountEntity;
import com.sang12.blog.repository.common.BoardDao;
import com.sang12.blog.repository.common.CategoryDao;
import com.sang12.blog.repository.common.CategoryRepository;
import com.sang12.blog.repository.common.JoinCountRepository;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.utils.DateUtil;
import com.sang12.blog.utils.ObjectUtils;
import com.sang12.blog.vo.front.MainPageVo;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private JoinCountRepository joinCountRep;
	
	@Autowired
	private CategoryRepository categoryRep;
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public void checkAndCount() {
	    JoinCountEntity jc = joinCountRep.findOne(DateUtil.addDayGetString(0));
	    if (jc == null){
			jc = new JoinCountEntity();
			jc.setJoinDate(DateUtil.addDayGetString(0));
			jc.setJoinCount(1);
			this.joinCountRep.save(jc);
	    }else{
			jc.count();
			this.joinCountRep.save(jc);
	    }
	}

	@Override
	public List<JoinCountEntity> getJoinCount(String fromDate, String toDate) {
		return joinCountRep.findByJoinDateBetween(fromDate, toDate);
	}
	
	@Override
	public Map<String, Object> getJoinCountTotalList() {
		Map<String, Object> returnMap = new HashMap<String, Object>(); 
		returnMap.put("joinCountWeekList", joinCountRep.findByJoinDateBetween(DateUtil.addDayGetString(-7), DateUtil.addDayGetString(0)));
		returnMap.put("joinCountTotalSum", joinCountRep.findByJoinDateSum());
		returnMap.put("joinCountOfToday", joinCountRep.findByTodayCount(DateUtil.addDayGetString(0)));
		return returnMap;
	}

	@Override
	public List<CategoryEntity> getCategoryList(int CategoryNumber) {
		return categoryRep.findByParentIdOrderBySortNumber(CategoryNumber);
	}

	@Override
	public Map<String, Object> getMainData(MainPageVo vo) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		vo.setTotalCount(boardDao.getMainArticleCount(vo));
		returnData.put("paging", vo);
		//메인 게시물
		List<BoardEntity> boardList = boardDao.getMainArticle(vo);
		returnData.put("articleList", boardList);
		
		//다른 게시물 리스트 가져오기
		for(BoardEntity board : boardList) {
			board.setRelateBoardTitleList(boardDao.getRelateBoardTitleList(board));
			board.setBoardReplyEntity(sortReplyList(boardDao.getReplyList(board)));
		}
		
		//왼쪽 공간 메뉴 리스트 
		returnData.put("upCategoryList", categoryDao.getLargeCategoryList());
		returnData.put("childCategoryList", categoryRep.findChildCategory());
		return returnData;
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
	public Channel getRssList() {
		List<BoardEntity> boardList = boardDao.getRssArticleList();
		
		Channel channel = new Channel();
		channel.setFeedType("rss_2.0");
		channel.setTitle("Sang12 Blog");
		channel.setDescription("Sangil's Blog");
		channel.setLink("http://sang12.co.kr");
		channel.setGenerator("Sang12 Blog");
		
		Date postDate = new Date();
		channel.setPubDate(postDate);
		
		List<Item> itemList = new ArrayList<Item>();
		
		for(BoardEntity board : boardList) {
			Item item = new Item();
			//category.set
			
			item.setAuthor("sang12");
			//네이버웹마스터 도구에서 rss등록이안되서 수정처리
			//item.setLink("http://sang12.co.kr/" + board.getBoardId() + "/" + board.getTitle().replaceAll(" ","-").replaceAll("/", ""));
			item.setLink("http://sang12.co.kr/" + board.getBoardId());
			item.setTitle(board.getTitle());
			
			/*
			item.setComments("https://howtodoinjava.com/spring5/webmvc/spring-mvc-cors-configuration/#respond");
			*/
			
			Description descr = new Description();
			descr.setValue(board.getContent());
			item.setDescription(descr);
			if(board.getKeyword() != null) {
				item.setCategories(ObjectUtils.getCategory(board.getKeyword(), ","));
			}
			
			item.setPubDate(board.getFinalChangeDate());
			
			itemList.add(item);
		}
		channel.setItems(itemList);
		return channel;
	}

	@Override
	public Map<String, Object> searchKeyword(String keyword) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<BoardEntity> boardList = boardDao.saerchKeyword(keyword);
		
		returnData.put("mainTitle", keyword + " 검색결과");
		returnData.put("keyword", keyword);
		returnData.put("articleList", boardList);
		return returnData;
	}

}
