/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.fxb.jeesite.common.persistence.DataEntity;

/**
 * 考试记录Entity
 * @author 方小白
 * @version 2017-07-28
 */
public class Exam extends DataEntity<Exam> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 考试名称
	private Date time;		// 考试时间
	private String score;		// 考试得分
	private String passFlag;		// 考试结果
	private String payFlag;		// 是否交费
	private double payMoney;		// 交费金额
	private String examCount;		// 考试次数
	private String failReason;		// 失败原因
	private String sid;		// 学员外键
    private Student student;
	
	public Exam() {
		super();
	}

	public Exam(String id){
		super(id);
	}

	@Length(min=1, max=32, message="考试名称长度必须介于 1 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="考试时间不能为空")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	@Length(min=1, max=11, message="考试得分长度必须介于 1 和 11 之间")
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	@Length(min=0, max=4, message="考试结果长度必须介于 0 和 4 之间")
	public String getPassFlag() {
		return passFlag;
	}

	public void setPassFlag(String passFlag) {
		this.passFlag = passFlag;
	}
	
	@Length(min=1, max=4, message="是否交费长度必须介于 1 和 4 之间")
	public String getPayFlag() {
		return payFlag;
	}

	public void setPayFlag(String payFlag) {
		this.payFlag = payFlag;
	}
	
	public double getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(double payMoney) {
		this.payMoney = payMoney;
	}
	
	@Length(min=1, max=11, message="考试次数长度必须介于 1 和 11 之间")
	public String getExamCount() {
		return examCount;
	}

	public void setExamCount(String examCount) {
		this.examCount = examCount;
	}
	
	@Length(min=0, max=255, message="失败原因长度必须介于 0 和 255 之间")
	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	
	@Length(min=0, max=64, message="学员外键长度必须介于 0 和 64 之间")
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}


	public Student getStudent(){
	    return student;
    }

    public void setStudent(Student student){
	    this.student  =student;
    }
}