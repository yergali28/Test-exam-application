package com.Beans;

import java.util.List;
import java.util.function.LongFunction;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.Entities.Courses;
import com.Entities.Courses_users;
import com.Entities.Groups;

import sun.print.resources.serviceui;

/**
 * Session Bean implementation class CourseBean
 */
@Stateless
@LocalBean
public class CourseBean implements CourseBeanLocal {
	
	@PersistenceContext(unitName="erpPU")
	private EntityManager em;
    /**
     * Default constructor. 
     */
    public CourseBean() {
        // TODO Auto-generated constructor stub
    }
    
	@Override
	public List<Courses> getAllCourses() {

		List<Courses> allcourses = null;
		allcourses = (List<Courses>)em.createQuery("SELECT c FROM Courses c WHERE c.active=1 ORDER BY c.id DESC").getResultList();
		for(Courses course: allcourses){
			System.out.println(course.getName() + " " + course.getDescription());
		}	
		return allcourses;
		
	}

	@Override
	public List<Courses_users> getCoursesByUserId(Long id) {
		
		List<Courses_users> mycourses = null;
		mycourses = (List<Courses_users>)em.createQuery("SELECT c FROM Courses_users c WHERE c.user_id ="+id).getResultList();
		for(Courses_users course: mycourses){
			System.out.println(course.getCourse_id().getName() + " " + course.getCourse_id().getDescription());
		}	
		return mycourses;
	}

	@Override
	public void addCourse(String courseName, String courseDescription) {
		
		Courses c = new Courses();
		c.setName(courseName);
		c.setDescription(courseDescription);
		c.setActive(1);
		em.persist(c);
	}

	@Override
	public void assignCourse(Long user_id, Long course_id) {
		
		em.createNativeQuery("INSERT INTO courses_users(id, user_id, course_id) VALUES(null, "+user_id+", "+ course_id+")").executeUpdate();
	}

	@Override
	public void deleteCourse(Long courseID) {

		try {
			Courses c = em.find(Courses.class, courseID);
			c.setActive(0);;
			em.merge(c);
			em.flush();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public void editCourse(Long courseID, String courseName, String courseDescription) {
		
		try {
			Courses c = em.find(Courses.class, courseID);
			c.setName(courseName);
			c.setDescription(courseDescription);
			em.merge(c);
			em.flush();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}

}
