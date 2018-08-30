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
import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.domain.common.JoinCountEntity;
import com.sang12.blog.repository.common.BoardDao;
import com.sang12.blog.repository.common.CategoryDao;
import com.sang12.blog.repository.common.CategoryRepository;
import com.sang12.blog.repository.common.JoinCountRepository;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.utils.DateUtil;
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
		returnData.put("articleList", boardDao.getMainArticle(vo));
		returnData.put("upCategoryList", categoryDao.getLargeCategoryList());
		returnData.put("childCategoryList", categoryRep.findChildCategory());
		return returnData;
	}
	
	@Override
	public Map<String, Object> getArticle(int boardId) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<BoardEntity> boardList = boardDao.getMainArticleByBoardId(boardId);
		BoardEntity board = boardList.get(0);
		returnData.put("articleList", boardList);
		returnData.put("mainTitle", board.getTitle());
		returnData.put("upCategoryList", categoryDao.getLargeCategoryList());
		returnData.put("childCategoryList", categoryRep.findChildCategory());
		return returnData;
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
			
			item.setAuthor("sang12");
			item.setLink("http://sang12.co.kr/" + board.getBoardId());
			item.setTitle(board.getTitle());
			
			/*
			item.setComments("https://howtodoinjava.com/spring5/webmvc/spring-mvc-cors-configuration/#respond");
			com.rometools.rome.feed.rss.Category category = new com.rometools.rome.feed.rss.Category();
			category.setValue("CORS");
			item.setCategories(Collections.singletonList(category));
			*/
			
			Description descr = new Description();
			descr.setValue(board.getContent());
			item.setDescription(descr);
			item.setPubDate(board.getFinalChangeDate());
			
			itemList.add(item);
		}
		channel.setItems(itemList);
		return channel;
	}

}
