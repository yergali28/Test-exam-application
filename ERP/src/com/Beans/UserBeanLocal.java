package com.Beans;

import java.sql.Date;
import java.util.List;

import javax.ejb.Local;

import com.Entities.Groups;
import com.Entities.Users;
import com.Entities.User_data;

@Local
public interface UserBeanLocal {

	public Users getUserByLoginAndPassword(String login, String password);
	
	public Users getUserById(Long id);
	
	public User_data getUserDataByNameAndSurname(String name, String surname);
	
	public List<Users> getAllUsers();
	
	public void deleteUser(Long userID);
	
	public void editUser(Long id, String name, String surname, String login, String password, String role, int active, Long groupId);
	
	public void addNewUser(String name, String surname, String login, String password, String role, String birth, String group);
	
	public void editAdminProfile(Long id, String name, String surname, String login, String password);
	
	public void editUserProfile(Long id, String password);
	
	public List<Users> getUserGroupmates(Long id, Long user_id);
	
}
