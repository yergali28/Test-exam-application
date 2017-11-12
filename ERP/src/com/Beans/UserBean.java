package com.Beans;

import java.sql.Date;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.security.auth.spi.Users.User;

import com.Entities.Courses;
import com.Entities.Groups;
import com.Entities.User_data;
import com.Entities.Users;

/**
 * Session Bean implementation class UserBean
 */
@Stateless
@LocalBean
public class UserBean implements UserBeanLocal {
	
	@PersistenceContext(unitName="erpPU")
	private EntityManager em;
    /**
     * Default constructor. 
     */
    public UserBean() {
        // TODO Auto-generated constructor stub
    }
    
	@Override
	public Users getUserByLoginAndPassword(String login, String password) {
		Users u = null;
		
		u = (Users)em.createQuery("SELECT u FROM Users u WHERE u.login=:log AND u.password =:pass AND u.active = 1")
		.setParameter("log", login)
		.setParameter("pass", password).getSingleResult();
		
		return u;
	}
	
	@Override
	public Users getUserById(Long id) {
		Users u = null;
		
		u = (Users)em.createQuery("SELECT u FROM Users u WHERE u.id=:id AND u.active = 1")
		.setParameter("id", id)
		.getSingleResult();
		
		return u;
	}
	
	@Override
	public List<Users> getAllUsers() {
		List<Users> allusers = null;
		
		allusers = (List<Users>)em.createQuery("SELECT u FROM Users u WHERE u.active = 1 ")
		.getResultList();
		for(Users user: allusers){
			System.out.println(user.getUserData().getName() + " " + user.getUserData().getSurname());
		}
		return allusers;
	}
	
	@Override
	public void editAdminProfile(Long id, String name, String surname, String login, String password) {
		em.createQuery("UPDATE Users u SET u.login =:login, u.password =:password WHERE u.id ="+id)
		.setParameter("login", login)
		.setParameter("password", password)
		.executeUpdate();
		
		em.createQuery("UPDATE User_data ud SET ud.name =:name, ud.surname =:surname WHERE ud.id ="+id)
		.setParameter("name", name)
		.setParameter("surname", surname)
		.executeUpdate();
	}

	@Override
	public void editUserProfile(Long id, String password) {
		em.createQuery("UPDATE Users u SET u.password =:password WHERE u.id ="+id)
		.setParameter("password", password)
		.executeUpdate();
	}

	@Override
	public List<Users> getUserGroupmates(Long id, Long user_id) {
		List<Users> groupmates = null;
		groupmates = (List<Users>)em.createQuery("SELECT u FROM Users u WHERE u.group ="+id+" AND u.id !="+user_id).getResultList();
		for(Users group: groupmates){
			System.out.println(group.getLogin() + " " + group.getUserData().getName() + " " + group.getUserData().getSurname() + " " + group.getGroup().getName());
		}
		return groupmates;
	}
	
	@Override
	public void deleteUser(Long userID) {

		try {
			Users u = em.find(Users.class, userID);
			u.setActive(0);;
			em.merge(u);
			em.flush();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void editUser(Long id, String name, String surname, String login, String password, String role, int active,
			Long groupId) {
		// TODO Auto-generated method stub
		Long role_id;
		if(role.trim().equals("admin")){
			role_id = new Long(1);
		}else{
			role_id = new Long(2);
		}

		em.createNativeQuery("UPDATE Users SET login ='"+login+"', password ='"+password+"', role_id ="+role_id+", group_id ="+groupId+", active = "+active
				+" WHERE id ="+id)
		.executeUpdate();
		
		em.createQuery("UPDATE User_data SET name ='"+name+"', surname ='"+surname+"' WHERE id ="+id)
		.executeUpdate();
	}

	@Override
	public void addNewUser(String name, String surname, String login, String password, String role, String birth,
			String group) {
		
		em.createNativeQuery("INSERT INTO user_data(name, surname, birth_date) VALUES('"+name+"', '"+surname+"', '"+birth+"') ")
		.executeUpdate();
		
		User_data u = getUserDataByNameAndSurname(name, surname);
		
		if(role.trim().equals("user")){
			em.createNativeQuery("INSERT INTO users(login, password, role_id, user_data_id, group_id,active) VALUES('"+login+"', '"+password+"', "+2+", "
					+u.getId()+", '"+group+"', "+1+")")
					.executeUpdate();
		}else if(role.trim().equals("admin")){
			em.createNativeQuery("INSERT INTO users(login, password, role_id, user_data_id, group_id,active) VALUES('"+login+"', '"+password+"', "+1+", "
					+u.getId()+", "+null+", "+1+")")
					.executeUpdate();
		}
		
		
	}

	@Override
	public User_data getUserDataByNameAndSurname(String name, String surname) {
		
		User_data u = null;
		
		u = (User_data)em.createQuery("SELECT u FROM User_data u WHERE u.name=:name AND u.surname =:surname")
		.setParameter("name", name)
		.setParameter("surname", surname)
		.getSingleResult();
		
		return u;
	}
	
	

}
