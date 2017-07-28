/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.dm.entity.Introducer;
import com.thinkgem.jeesite.modules.dm.dao.IntroducerDao;

/**
 * 介绍人信息的管理Service
 * @author 方小白
 * @version 2017-07-28
 */
@Service
@Transactional(readOnly = true)
public class IntroducerService extends CrudService<IntroducerDao, Introducer> {

	public Introducer get(String id) {
		return super.get(id);
	}
	
	public List<Introducer> findList(Introducer introducer) {
		return super.findList(introducer);
	}
	
	public Page<Introducer> findPage(Page<Introducer> page, Introducer introducer) {
		return super.findPage(page, introducer);
	}
	
	@Transactional(readOnly = false)
	public void save(Introducer introducer) {
		super.save(introducer);
	}
	
	@Transactional(readOnly = false)
	public void delete(Introducer introducer) {
		super.delete(introducer);
	}
	
}