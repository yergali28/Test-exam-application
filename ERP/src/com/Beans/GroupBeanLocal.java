package com.Beans;

import java.util.List;

import javax.ejb.Local;

import com.Entities.Groups;

@Local
public interface GroupBeanLocal {
	
	public void addGroup(String groupName);
	
	public void deleteGroup(Long groupID);
	
	public void editGroup(Long groupID, String groupName);
	
	public List<Groups> getAllGroups();
}
