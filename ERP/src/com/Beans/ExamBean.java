package com.Beans;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.Entities.Exam;

@SuppressWarnings("unchecked")
@Stateless
@LocalBean
public class ExamBean implements ExamBeanLocal {
	
	@PersistenceContext(unitName = "erpPU")
	private EntityManager entityManager;

	@Override
	public Long createExam(Exam exam) {
		entityManager.persist(exam);
		entityManager.flush();
		
		return exam.getId();
	}

	@Override
	public Exam getExamById(Long id) {
		List<Exam> foundExams = (List<Exam>) entityManager
				.createQuery("SELECT e FROM Exam e WHERE e.id = :eid")
				.setParameter("eid", id)
				.getResultList();
		 
		return foundExams.isEmpty() ? null : foundExams.get(0);
	}
	
	@Override
	public List<Exam> getUserExamsById(Long id) {
		List<Exam> foundExams = (List<Exam>) entityManager
				.createQuery("SELECT e FROM Exam e WHERE e.user_id = :eid ORDER BY e.id DESC")
				.setParameter("eid", id)
				.getResultList();
		
		System.out.println("This is size of foundExams " + foundExams.size());
		return foundExams.isEmpty() ? null : foundExams;
	}
}
