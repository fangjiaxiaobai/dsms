/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.entity;

import org.hibernate.validator.constraints.Length;

import com.fxb.jeesite.common.persistence.DataEntity;

/**
 * 车辆信息的管理Entity
 * @author 方小白
 * @version 2017-07-28
 */
public class Vehicle extends DataEntity<Vehicle> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// type
	private String plate;		// plate
	
	public Vehicle() {
		super();
	}

	public Vehicle(String id){
		super(id);
	}

	@Length(min=1, max=255, message="type长度必须介于 1 和 255 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=255, message="plate长度必须介于 1 和 255 之间")
	public String getPlate() {
		return plate;
	}

	public void setPlate(String plate) {
		this.plate = plate;
	}

	public String getPlantANdType(){
        return type + "_" + plate;
    }
	
}