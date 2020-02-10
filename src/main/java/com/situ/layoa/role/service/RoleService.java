package com.situ.layoa.role.service;

import com.situ.layoa.commons.LayResult;
import com.situ.layoa.role.domain.Role;

public interface RoleService {

	Integer getName(String roleName);

	Long save(Role role);

	

	Long doDeleteRole(Long rowId);

	Role findRoleById(Long rowId);

	Long doUpdate(Role role);

	LayResult finAllRole(Integer page, Integer limit, Role searchRole);

	

	
}
