package com.fxb.jeesite.modules.dm.web;

import com.drew.metadata.exif.DataFormat;
import com.fxb.jeesite.modules.dm.entity.Exam;
import com.fxb.jeesite.modules.dm.entity.Train;
import com.fxb.jeesite.modules.dm.service.ExamService;
import com.fxb.jeesite.modules.dm.service.TrainService;
import freemarker.template.SimpleDate;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @create by: wangxiyue on 2017/7/31 18:14.
 * @ClassName: AffairsController
 * @userfor: 统计今天，明天的Affairs控制类
 * @description: 封装Affairs VO
 */
@Controller
@RequestMapping("${adminPath}/dm/affairs/")
public class AffairsController {

    @Autowired
    private TrainService trainService;

    @Autowired
    private ExamService examService;



    @RequestMapping({"list",""})
    @RequiresPermissions("dm:affairs:view")
    public String list(Model model){
        //查询今日练车
        Train train = new Train();
        List<Train> trains_today = this.trainService.getTodayTask();
        model.addAttribute("trains_today",trains_today);

        //明日练车
        List<Train> trains_tomorrow = this.trainService.getTomorrowTask();
        model.addAttribute("trains_tomorrow",trains_tomorrow);

        //今日考试

        List<Exam> exams_today = this.examService.getTodayTask();
        model.addAttribute("exams_today",exams_today);

        //明日考试
        List<Exam> exams_tomorrow = this.examService.getTomorrowTask();
        model.addAttribute("exams_tomorrow",exams_tomorrow);

        return "modules/dm/affairsList";
    }



}
