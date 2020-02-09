package com.situ.layoa.role.service;

import java.util.List;

import com.situ.layoa.role.domain.Role;

public interface RoleService {

	Role getName(String roleName);

	Long save(Role role);

	List<Role> finAllRole();

	Integer getCount();

	Long doDeleteRole(Long rowId);

	Role findRoleById(Long rowId);

	Long doUpdate(Role role);

	

	
}
