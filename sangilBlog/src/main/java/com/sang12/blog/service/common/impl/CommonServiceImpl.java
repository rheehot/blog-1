package com.sang12.blog.service.common.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.domain.common.JoinCountEntity;
import com.sang12.blog.repository.common.CategoryRepository;
import com.sang12.blog.repository.common.JoinCountRepository;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.utils.DateUtil;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private JoinCountRepository joinCountRep;
	
	@Autowired
	private CategoryRepository categoryRep;
	
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
		return categoryRep.findByParentId(CategoryNumber);
	}

}
