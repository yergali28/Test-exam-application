package com.Beans;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.Entities.Groups;

/**
 * Session Bean implementation class GroupBean
 */
@Stateless
@LocalBean
public class GroupBean implements GroupBeanLocal {
	
	@PersistenceContext(unitName="erpPU")
	private EntityManager em;
    /**
     * Default constructor. 
     */
    public GroupBean() {
        // TODO Auto-generated constructor stub
    }
    
	@Override
	public void addGroup(String groupName) {
		
		Groups g = new Groups();
		g.setName(groupName);
		g.setActive(1);
		em.persist(g);
	}

	@Override
	public void deleteGroup(Long groupID) {
		
		try {
			Groups g = em.find(Groups.class, groupID);
			g.setActive(0);
			em.merge(g);
			em.flush();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<Groups> getAllGroups() {
		List<Groups> allgroups = null;
		allgroups = (List<Groups>)em.createQuery("SELECT g FROM Groups g WHERE g.active=1 ").getResultList();
		for(Groups group: allgroups){
			System.out.println(group.getId() + " " + group.getName());
		}	
		return allgroups;
	}

	@Override
	public void editGroup(Long groupID, String groupName) {
		
		try {
			Groups g = em.find(Groups.class, groupID);
			g.setName(groupName);
			em.merge(g);
			em.flush();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}

}
