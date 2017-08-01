/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.dao;

import com.fxb.jeesite.common.persistence.CrudDao;
import com.fxb.jeesite.common.persistence.annotation.MyBatisDao;
import com.fxb.jeesite.modules.dm.entity.Introducer;

/**
 * 介绍人信息的管理DAO接口
 * @author 方小白
 * @version 2017-07-28
 */
@MyBatisDao
public interface IntroducerDao extends CrudDao<Introducer> {
	
}