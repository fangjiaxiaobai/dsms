/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.dm.entity.Exam;
import com.thinkgem.jeesite.modules.dm.dao.ExamDao;

/**
 * 考试记录Service
 * @author 方小白
 * @version 2017-07-28
 */
@Service
@Transactional(readOnly = true)
public class ExamService extends CrudService<ExamDao, Exam> {

	public Exam get(String id) {
		return super.get(id);
	}
	
	public List<Exam> findList(Exam exam) {
		return super.findList(exam);
	}
	
	public Page<Exam> findPage(Page<Exam> page, Exam exam) {
		return super.findPage(page, exam);
	}
	
	@Transactional(readOnly = false)
	public void save(Exam exam) {
		super.save(exam);
	}
	
	@Transactional(readOnly = false)
	public void delete(Exam exam) {
		super.delete(exam);
	}

    public int findStudentExamCounts(Exam exam){
	    return dao.findStudentExamCounts(exam);
    }
}