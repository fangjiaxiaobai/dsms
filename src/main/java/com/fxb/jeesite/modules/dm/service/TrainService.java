/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fxb.jeesite.common.persistence.Page;
import com.fxb.jeesite.common.service.CrudService;
import com.fxb.jeesite.modules.dm.entity.Train;
import com.fxb.jeesite.modules.dm.dao.TrainDao;

/**
 * 练车信息Service
 * @author 方小白
 * @version 2017-07-28
 */
@Service
@Transactional(readOnly = true)
public class TrainService extends CrudService<TrainDao, Train> {

	public Train get(String id) {
		return super.get(id);
	}
	
	public List<Train> findList(Train train) {
		return super.findList(train);
	}
	
	public Page<Train> findPage(Page<Train> page, Train train) {
		return super.findPage(page, train);
	}
	
	@Transactional(readOnly = false)
	public void save(Train train) {
		super.save(train);
	}
	
	@Transactional(readOnly = false)
	public void delete(Train train) {
		super.delete(train);
	}

    public List<Train> getTodayTask(){
	    return dao.getTodayTask();
    }

    public List<Train> getTomorrowTask(){
         return  dao.getTomorrowTask();
    }
}