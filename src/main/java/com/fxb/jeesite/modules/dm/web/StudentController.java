/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.jeesite.modules.dm.entity.Introducer;
import com.fxb.jeesite.modules.dm.service.IntroducerService;
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
import com.fxb.jeesite.modules.dm.entity.Student;
import com.fxb.jeesite.modules.dm.service.StudentService;

import java.util.List;

/**
 * 学员管理Controller
 * @author 方小白
 * @version 2017-07-28
 */
@Controller
@RequestMapping(value = "${adminPath}/dm/student")
public class StudentController extends BaseController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private IntroducerService introducerService;
	
	@ModelAttribute
	public Student get(@RequestParam(required=false) String id) {
		Student entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = studentService.get(id);
		}
		if (entity == null){
			entity = new Student();
		}
		return entity;
	}
	
	@RequiresPermissions("dm:student:view")
	@RequestMapping(value = {"list", ""})
	public String list(Student student, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Student> page = studentService.findPage(new Page<Student>(request, response), student); 
		model.addAttribute("page", page);
		return "modules/dm/studentList";
	}

	@RequiresPermissions("dm:student:view")
	@RequestMapping(value = "form")
	public String form(Student student, Model model) {
	    Introducer introducer = new Introducer();
	    List<Introducer> introducerList = this.introducerService.findList(introducer);
        model.addAttribute("introducerList",introducerList);
		return "modules/dm/studentForm";
	}

	@RequiresPermissions("dm:student:view")
	@RequestMapping(value = "save")
	public String save(Student student, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, student)){
			return form(student, model);
		}
		studentService.save(student);
		addMessage(redirectAttributes, "保存学员成功");
		return "redirect:"+Global.getAdminPath()+"/dm/student/?repage";
	}
	
	@RequiresPermissions("dm:student:view")
	@RequestMapping(value = "delete")
	public String delete(Student student, RedirectAttributes redirectAttributes) {
		studentService.delete(student);
		addMessage(redirectAttributes, "删除学员成功");
		return "redirect:"+Global.getAdminPath()+"/dm/student/?repage";
	}

}