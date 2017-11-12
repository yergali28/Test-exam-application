package com.DButil;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.Entities.ExamQuestion;

@Stateless
@LocalBean
public class DBUtil implements DBUtilLocal {
	
	@PersistenceContext(unitName = "erpPU")
	private EntityManager entityManager;

	@Override
	public void addExamQuestion(ExamQuestion examQuestion) {
		entityManager.persist(examQuestion);
	}

}
