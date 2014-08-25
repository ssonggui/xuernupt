package com.springmvc.t.model;

import java.util.ArrayList;
import java.util.List;

public class UserList {
	private List<UserInfo> users = new ArrayList<UserInfo>();

	public List<UserInfo> getUsers() {
		return users;
	}

	public void setUsers(List<UserInfo> users) {
		this.users = users;
	}
	
}
