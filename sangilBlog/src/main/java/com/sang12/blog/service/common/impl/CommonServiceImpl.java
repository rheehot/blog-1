package com.sang12.blog.service.common.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang12.blog.domain.common.JoinCount;
import com.sang12.blog.repository.common.JoinCountRepository;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.utils.DateUtil;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private JoinCountRepository joinCountRep;
	
	@Override
	public void checkAndCount() {
	    JoinCount jc = joinCountRep.findOne(DateUtil.addDayGetString(0));
	    if (jc == null){
			jc = new JoinCount();
			jc.setJoinDate(DateUtil.addDayGetString(0));
			jc.setJoinCount(1);
			this.joinCountRep.save(jc);
	    }else{
			jc.count();
			this.joinCountRep.save(jc);
	    }
	}

	@Override
	public List<JoinCount> getJoinCount(String fromDate, String toDate) {
		return joinCountRep.findByJoinDateBetween(fromDate, toDate);
	}

}
