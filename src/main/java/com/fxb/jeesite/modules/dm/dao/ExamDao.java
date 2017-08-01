/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.dao;

import com.fxb.jeesite.common.persistence.CrudDao;
import com.fxb.jeesite.common.persistence.annotation.MyBatisDao;
import com.fxb.jeesite.modules.dm.entity.Exam;

import java.util.List;

/**
 * 考试记录DAO接口
 * @author 方小白
 * @version 2017-07-28
 */
@MyBatisDao
public interface ExamDao extends CrudDao<Exam> {

    int findStudentExamCounts(Exam exam);

    Exam findExamById(Exam exam);

    List<Exam> getTodayTask();

    List<Exam> getTomorrowTask();
}