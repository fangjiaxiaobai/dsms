/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dm.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 介绍人信息的管理Entity
 * @author 方小白
 * @version 2017-07-28
 */
public class Introducer extends DataEntity<Introducer> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private String sex;		// 性别
	private String idcard;		// 身份证号
	private String tel;		// 联系电话
	
	public Introducer() {
		super();
	}

	public Introducer(String id){
		super(id);
	}

	@Length(min=1, max=32, message="姓名长度必须介于 1 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=8, message="性别长度必须介于 1 和 8 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=1, max=18, message="身份证号长度必须介于 1 和 18 之间")
	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	@Length(min=1, max=16, message="联系电话长度必须介于 1 和 16 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}