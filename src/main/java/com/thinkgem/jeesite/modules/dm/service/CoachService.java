/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.dm.entity.Coach;
import com.thinkgem.jeesite.modules.dm.dao.CoachDao;

/**
 * 考试记录Service
 * @author 方小白
 * @version 2017-07-28
 */
@Service
@Transactional(readOnly = true)
public class CoachService extends CrudService<CoachDao, Coach> {

	public Coach get(String id) {
		return super.get(id);
	}
	
	public List<Coach> findList(Coach coach) {
		return super.findList(coach);
	}
	
	public Page<Coach> findPage(Page<Coach> page, Coach coach) {
		return super.findPage(page, coach);
	}
	
	@Transactional(readOnly = false)
	public void save(Coach coach) {
		super.save(coach);
	}
	
	@Transactional(readOnly = false)
	public void delete(Coach coach) {
		super.delete(coach);
	}
	
}