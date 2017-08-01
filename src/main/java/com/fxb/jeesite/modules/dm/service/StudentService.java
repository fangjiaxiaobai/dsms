/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fxb.jeesite.modules.dm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fxb.jeesite.common.persistence.Page;
import com.fxb.jeesite.common.service.CrudService;
import com.fxb.jeesite.modules.dm.entity.Student;
import com.fxb.jeesite.modules.dm.dao.StudentDao;

/**
 * 学员管理Service
 * @author 方小白
 * @version 2017-07-28
 */
@Service
@Transactional(readOnly = true)
public class StudentService extends CrudService<StudentDao, Student> {

	public Student get(String id) {
		return super.get(id);
	}
	
	public List<Student> findList(Student student) {
		return super.findList(student);
	}
	
	public Page<Student> findPage(Page<Student> page, Student student) {
		return super.findPage(page, student);
	}
	
	@Transactional(readOnly = false)
	public void save(Student student) {
		super.save(student);
	}
	
	@Transactional(readOnly = false)
	public void delete(Student student) {
		super.delete(student);
	}
	
}