package com.Beans;

import java.util.List;

import javax.ejb.Local;

import com.Entities.Courses;
import com.Entities.Courses_users;
import com.Entities.Groups;

@Local
public interface CourseBeanLocal {
	
	public List<Courses> getAllCourses();
	
	public List<Courses_users> getCoursesByUserId(Long id);
	
	public void deleteCourse(Long courseID);
	
	public void editCourse(Long courseID, String courseName, String courseDescription);
	
	public void addCourse(String courseName, String courseDescription);
	
	public void assignCourse(Long user_id, Long course_id);
}
