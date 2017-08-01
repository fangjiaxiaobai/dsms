/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.web;

import com.fxb.jeesite.common.config.Global;
import com.fxb.jeesite.common.persistence.Page;
import com.fxb.jeesite.common.utils.StringUtils;
import com.fxb.jeesite.common.web.BaseController;
import com.fxb.jeesite.modules.dm.entity.Exam;
import com.fxb.jeesite.modules.dm.entity.Student;
import com.fxb.jeesite.modules.dm.service.ExamService;
import com.fxb.jeesite.modules.dm.service.StudentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.List;

/**
 * 考试记录Controller
 *
 * @author 方小白
 * @version 2017-07-28
 */
@Controller
@RequestMapping(value="${adminPath}/dm/exam")
public class ExamController extends BaseController {

    @Autowired
    private ExamService examService;

    @Autowired
    private StudentService studentService;


    @ModelAttribute
    public Exam get(@RequestParam(required=false) String id){
        Exam entity=null;
        if (StringUtils.isNotBlank(id)) {
            entity=examService.get(id);
        }
        if (entity == null) {
            entity=new Exam();
        }
        return entity;
    }

    @RequiresPermissions("dm:exam:view")
    @RequestMapping(value={"list", ""})
    public String list(Exam exam, HttpServletRequest request, HttpServletResponse response, Model model){
        Page <Exam> page=examService.findPage(new Page <Exam>(request, response), exam);
        model.addAttribute("page", page);
        return "modules/dm/examList";
    }

    @RequiresPermissions("dm:exam:view")
    @RequestMapping(value="form")
    public String form(Exam exam, Model model){
        model.addAttribute("exam", exam);
        return "modules/dm/examForm";
    }

    @RequiresPermissions("dm:exam:view")
    @RequestMapping(value="save")
    public String save(Exam exam, Model model, RedirectAttributes redirectAttributes){
        if (!beanValidator(model, exam)) {
            return form(exam, model);
        }
        if(exam.getPassFlag()==null){
            exam.setPassFlag(""+4);
        }

        examService.save(exam);
        addMessage(redirectAttributes, "保存考试记录成功");
        return "redirect:" + Global.getAdminPath() + "/dm/exam/?repage";
    }

    @RequiresPermissions("dm:exam:view")
    @RequestMapping(value="delete")
    public String delete(Exam exam, RedirectAttributes redirectAttributes){
        examService.delete(exam);
        addMessage(redirectAttributes, "删除考试记录成功");
        return "redirect:" + Global.getAdminPath() + "/dm/exam/?repage";
    }

    /**
     * @return
     * @title 跳转到预约考试页面
     * @author 方小白
     */
    @RequiresPermissions("dm:exam:view")
    @RequestMapping("orderExam")
    public String orderExam(Student student, Model model){
        List <Student> students=this.studentService.findList(student);
        model.addAttribute("students", students);
        return "modules/dm/orderExam";
    }


    /**
     * 通过ajax异步的方式，统计本次考试是学院第几次参加本科目考试。
     * @param response
     * @param exam
     */
    @RequestMapping("getStudentExamCount")
    @RequiresPermissions("dm:exam:view")
    public void getStudentExamCount(HttpServletResponse response, Exam exam){
        int counts=this.examService.findStudentExamCounts(exam)+1;
        try {
            Writer writer=response.getWriter();
            //注意:一定要写成counts+"",counts写过去的话的是，写的一个字符的ascii码。
            writer.write(counts + "");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 跳转到录入结果的页面
     * @param model
     * @param exam
     * @return
     */
    @RequestMapping("preAddResult")
    @RequiresPermissions("dm:exam:view")
    public String preAddResult(Model model, Exam exam){
        Exam findExam = this.examService.findExamById(exam);
        model.addAttribute(findExam);
        return "modules/dm/addResult";
    }




}