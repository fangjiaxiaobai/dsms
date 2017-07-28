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
import com.thinkgem.jeesite.modules.dm.entity.Introducer;
import com.thinkgem.jeesite.modules.dm.service.IntroducerService;

/**
 * 介绍人信息的管理Controller
 * @author 方小白
 * @version 2017-07-28
 */
@Controller
@RequestMapping(value = "${adminPath}/dm/introducer")
public class IntroducerController extends BaseController {

	@Autowired
	private IntroducerService introducerService;
	
	@ModelAttribute
	public Introducer get(@RequestParam(required=false) String id) {
		Introducer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = introducerService.get(id);
		}
		if (entity == null){
			entity = new Introducer();
		}
		return entity;
	}
	
	@RequiresPermissions("dm:introducer:view")
	@RequestMapping(value = {"list", ""})
	public String list(Introducer introducer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Introducer> page = introducerService.findPage(new Page<Introducer>(request, response), introducer); 
		model.addAttribute("page", page);
		return "modules/dm/introducerList";
	}

	@RequiresPermissions("dm:introducer:view")
	@RequestMapping(value = "form")
	public String form(Introducer introducer, Model model) {
		model.addAttribute("introducer", introducer);
		return "modules/dm/introducerForm";
	}

	@RequiresPermissions("dm:introducer:view")
	@RequestMapping(value = "save")
	public String save(Introducer introducer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, introducer)){
			return form(introducer, model);
		}
		introducerService.save(introducer);
		addMessage(redirectAttributes, "保存介绍人成功");
		return "redirect:"+Global.getAdminPath()+"/dm/introducer/?repage";
	}
	@RequiresPermissions("dm:introducer:view")
	@RequestMapping(value = "delete")
	public String delete(Introducer introducer, RedirectAttributes redirectAttributes) {
		introducerService.delete(introducer);
		addMessage(redirectAttributes, "删除介绍人成功");
		return "redirect:"+Global.getAdminPath()+"/dm/introducer/?repage";
	}

}