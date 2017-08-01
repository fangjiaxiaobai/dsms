/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.web;

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

import com.fxb.jeesite.common.config.Global;
import com.fxb.jeesite.common.persistence.Page;
import com.fxb.jeesite.common.web.BaseController;
import com.fxb.jeesite.common.utils.StringUtils;
import com.fxb.jeesite.modules.dm.entity.Coach;
import com.fxb.jeesite.modules.dm.service.CoachService;

/**
 * 考试记录Controller
 * @author 方小白
 * @version 2017-07-28
 */
@Controller
@RequestMapping(value = "${adminPath}/dm/coach")
public class CoachController extends BaseController {

	@Autowired
	private CoachService coachService;
	
	@ModelAttribute
	public Coach get(@RequestParam(required=false) String id) {
		Coach entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = coachService.get(id);
		}
		if (entity == null){
			entity = new Coach();
		}
		return entity;
	}
	
	@RequiresPermissions("dm:coach:view")
	@RequestMapping(value = {"list", ""})
	public String list(Coach coach, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Coach> page = coachService.findPage(new Page<Coach>(request, response), coach); 
		model.addAttribute("page", page);
		return "modules/dm/coachList";
	}

	@RequiresPermissions("dm:coach:view")
	@RequestMapping(value = "form")
	public String form(Coach coach, Model model) {
		model.addAttribute("coach", coach);
		return "modules/dm/coachForm";
	}

	@RequiresPermissions("dm:coach:view")
	@RequestMapping(value = "save")
	public String save(Coach coach, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, coach)){
			return form(coach, model);
		}
		coachService.save(coach);
		addMessage(redirectAttributes, "保存开始记录成功");
		return "redirect:"+Global.getAdminPath()+"/dm/coach/?repage";
	}
	
	@RequiresPermissions("dm:coach:view")
	@RequestMapping(value = "delete")
	public String delete(Coach coach, RedirectAttributes redirectAttributes) {
		coachService.delete(coach);
		addMessage(redirectAttributes, "删除开始记录成功");
		return "redirect:"+Global.getAdminPath()+"/dm/coach/?repage";
	}

}