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
import com.thinkgem.jeesite.modules.dm.entity.Train;
import com.thinkgem.jeesite.modules.dm.service.TrainService;

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
		model.addAttribute("page", page);
		return "modules/dm/trainList";
	}

	@RequiresPermissions("dm:train:view")
	@RequestMapping(value = "form")
	public String form(Train train, Model model) {
		model.addAttribute("train", train);
		return "modules/dm/trainForm";
	}

	@RequiresPermissions("dm:train:edit")
	@RequestMapping(value = "save")
	public String save(Train train, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, train)){
			return form(train, model);
		}
		trainService.save(train);
		addMessage(redirectAttributes, "保存练车成功");
		return "redirect:"+Global.getAdminPath()+"/dm/train/?repage";
	}
	
	@RequiresPermissions("dm:train:edit")
	@RequestMapping(value = "delete")
	public String delete(Train train, RedirectAttributes redirectAttributes) {
		trainService.delete(train);
		addMessage(redirectAttributes, "删除练车成功");
		return "redirect:"+Global.getAdminPath()+"/dm/train/?repage";
	}

}