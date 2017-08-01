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
 * 练车信息Entity
 * @author 方小白
 * @version 2017-07-28
 */
public class Train extends DataEntity<Train> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private Date startDate;		// 开始时间
	private String countTime;		// 总计时
	private String payFlag;		// 是否缴费
	private String payMoney;		// 缴费金额
	private String sId;		// 学员姓名
    private Student student;
	private String cId;		// 教练姓名
    private Coach coach;
	private String vId;		// 车辆名称
	private Vehicle vehicle;

	public Train() {
		super();
	}

	public Train(String id){
		super(id);
	}

	@Length(min=1, max=64, message="姓名长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="开始时间不能为空")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getCountTime() {
		return countTime;
	}

	public void setCountTime(String countTime) {
		this.countTime = countTime;
	}
	
	@Length(min=0, max=4, message="是否缴费长度必须介于 0 和 4 之间")
	public String getPayFlag() {
		return payFlag;
	}

	public void setPayFlag(String payFlag) {
		this.payFlag = payFlag;
	}
	
	public String getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}
	
	@Length(min=0, max=64, message="学员姓名长度必须介于 0 和 64 之间")
	public String getSId() {
		return sId;
	}

	public void setSId(String sId) {
		this.sId = sId;
	}
	
	@Length(min=0, max=64, message="教练姓名长度必须介于 0 和 64 之间")
	public String getCId() {
		return cId;
	}

	public void setCId(String cId) {
		this.cId = cId;
		this.coach.setId(cId);
	}
	
	@Length(min=0, max=64, message="车辆名称长度必须介于 0 和 64 之间")
	public String getVId() {
		return vId;
	}

	public void setVId(String vId) {
		this.vId = vId;
		this.vehicle.setId(vId);
	}

	public void setStudent(Student student){
	    this.student = student;
    }

    public void setVehicle(Vehicle vehicle){
	    this.vehicle = vehicle;
    }

    public void setCoach(Coach coach){
        this.coach = coach;
    }

    public Student getStudent(){
        return student;
    }

    public Vehicle getVehicle(){
        return vehicle;
    }

    public Coach getCoach(){
        return coach;
    }
	
}