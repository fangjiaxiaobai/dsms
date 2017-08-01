/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.jeesite.modules.dm.entity.Coach;
import com.fxb.jeesite.modules.dm.entity.Student;
import com.fxb.jeesite.modules.dm.entity.Vehicle;
import com.fxb.jeesite.modules.dm.service.CoachService;
import com.fxb.jeesite.modules.dm.service.StudentService;
import com.fxb.jeesite.modules.dm.service.VehicleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fxb.jeesite.common.config.Global;
import com.fxb.jeesite.common.persistence.Page;
import com.fxb.jeesite.common.web.BaseController;
import com.fxb.jeesite.common.utils.StringUtils;
import com.fxb.jeesite.modules.dm.entity.Train;
import com.fxb.jeesite.modules.dm.service.TrainService;

import java.util.List;

/**
 * 练车信息Controller
 * @author 方小白
 * @version 2017-07-28
 */
@Controller
@RequestMapping(value = "${adminPath}/dm/train")
public class TrainController extends BaseController {

	@Autowired
	private TrainService trainService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private CoachService coachService;

	@Autowired
	private VehicleService vehicleService;

	
	@ModelAttribute
	public Train get(@RequestParam(required=false) String id) {
		Train entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = trainService.get(id);
		}
		if (entity == null){
			entity = new Train();
		}
		return entity;
	}
	
	@RequiresPermissions("dm:train:view")
	@RequestMapping(value = {"list", ""})
	public String list(Train train, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Train> page = trainService.findPage(new Page<Train>(request, response), train);
		List<Vehicle> vehicles = this.vehicleService.findList(new Vehicle());
		model.addAttribute("vehicles",vehicles);
		List<Student> students = this.studentService.findList(new Student());
		model.addAttribute("students",students);
		List<Coach> coaches = this.coachService.findList(new Coach());
		model.addAttribute("coaches",coaches);
		model.addAttribute("page", page);
		return "modules/dm/trainList";
	}

	@RequiresPermissions("dm:train:view")
	@RequestMapping(value = "form")
	public String form(Train train, Model model,Student student,Coach coach, Vehicle vehicle){

        List<Student> students = this.studentService.findList(student);
        List<Coach> coachs = this.coachService.findList(coach);
        List<Vehicle> vehicles = this.vehicleService.findList(vehicle);
        model.addAttribute("students",students);
        model.addAttribute("coachs",coachs);
        model.addAttribute("vehicles",vehicles);
		model.addAttribute("train", train);
		return "modules/dm/trainForm";
	}

	@RequiresPermissions("dm:train:view")
	@RequestMapping(value = "save")
	public String save(Train train, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, train)){
			return form(train, model,new Student(),new Coach(),new Vehicle());
		}
		trainService.save(train);
		addMessage(redirectAttributes, "保存练车成功");
		return "redirect:"+Global.getAdminPath()+"/dm/train/?repage";
	}
	
	@RequiresPermissions("dm:train:view")
	@RequestMapping(value = "delete")
	public String delete(Train train, RedirectAttributes redirectAttributes) {
		trainService.delete(train);
		addMessage(redirectAttributes, "删除练车成功");
		return "redirect:"+Global.getAdminPath()+"/dm/train/?repage";
	}

}