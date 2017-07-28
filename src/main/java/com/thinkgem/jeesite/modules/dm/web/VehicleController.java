/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.dm.entity.Vehicle;
import com.thinkgem.jeesite.modules.dm.service.VehicleService;

/**
 * 车辆信息的管理Controller
 * @author 方小白
 * @version 2017-07-28
 */
@Controller
@RequestMapping(value = "${adminPath}/dm/vehicle")
public class VehicleController extends BaseController {

	@Autowired
	private VehicleService vehicleService;
	
	@ModelAttribute
	public Vehicle get(@RequestParam(required=false) String id) {
		Vehicle entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = vehicleService.get(id);
		}
		if (entity == null){
			entity = new Vehicle();
		}
		return entity;
	}
	
	@RequiresPermissions("dm:vehicle:view")
	@RequestMapping(value = {"list", ""})
	public String list(Vehicle vehicle, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Vehicle> page = vehicleService.findPage(new Page<Vehicle>(request, response), vehicle); 
		model.addAttribute("page", page);
		return "modules/dm/vehicleList";
	}

	@RequiresPermissions("dm:vehicle:view")
	@RequestMapping(value = "form")
	public String form(Vehicle vehicle, Model model) {
		model.addAttribute("vehicle", vehicle);
		return "modules/dm/vehicleForm";
	}

	@RequiresPermissions("dm:vehicle:veiw")
	@RequestMapping(value = "save")
	public String save(Vehicle vehicle, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, vehicle)){
			return form(vehicle, model);
		}
		vehicleService.save(vehicle);
		addMessage(redirectAttributes, "保存车辆成功");
		return "redirect:"+Global.getAdminPath()+"/dm/vehicle/?repage";
	}
	
	@RequiresPermissions("dm:vehicle:view")
	@RequestMapping(value = "delete")
	public String delete(Vehicle vehicle, RedirectAttributes redirectAttributes) {
		vehicleService.delete(vehicle);
		addMessage(redirectAttributes, "删除车辆成功");
		return "redirect:"+Global.getAdminPath()+"/dm/vehicle/?repage";
	}

}