/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.fxb.jeesite.common.persistence.DataEntity;

/**
 * 学员管理Entity
 * @author 方小白
 * @version 2017-07-28
 */
public class Student extends DataEntity<Student> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 学员姓名
	private String sex;		// 性别
	private String idcard;		// 身份证号
	private Date birthday;		// 出生日期
	private String presentAddress;		// 现居地
	private String otherContacts;		// 其他联系方式
	private Date registrationTime;		// 报名时间
	private Date endTime;		// 拿证时间
	private String countHours;		// 总计时
	private String useHours;		// 已用计时
	private int flag;		// 是否拿证
	private String type;		// 学车类型
	private float money;		// 交费金额
	private String introducerId;		// 介绍人
	
	public Student() {
		super();
	}

	public Student(String id){
		super(id);
	}

	@Length(min=1, max=32, message="学员姓名长度必须介于 1 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=4, message="性别长度必须介于 1 和 4 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=1, max=21, message="身份证号长度必须介于 1 和 21 之间")
	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=0, max=255, message="现居地长度必须介于 0 和 255 之间")
	public String getPresentAddress() {
		return presentAddress;
	}

	public void setPresentAddress(String presentAddress) {
		this.presentAddress = presentAddress;
	}
	
	@Length(min=0, max=255, message="其他联系方式长度必须介于 0 和 255 之间")
	public String getOtherContacts() {
		return otherContacts;
	}

	public void setOtherContacts(String otherContacts) {
		this.otherContacts = otherContacts;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(Date registrationTime) {
		this.registrationTime = registrationTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public String getCountHours() {
		return countHours;
	}

	public void setCountHours(String countHours) {
		this.countHours = countHours;
	}
	
	public String getUseHours() {
		return useHours;
	}

	public void setUseHours(String useHours) {
		this.useHours = useHours;
	}
	
	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	@Length(min=1, max=64, message="学车类型长度必须介于 1 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}
	
	@Length(min=0, max=64, message="介绍人长度必须介于 0 和 64 之间")
	public String getIntroducerId() {
		return introducerId;
	}

	public void setIntroducerId(String introducerId) {
		this.introducerId = introducerId;
	}
	
}