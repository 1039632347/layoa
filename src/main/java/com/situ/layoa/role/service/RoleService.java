package com.situ.layoa.role.service;

import com.situ.layoa.role.domain.Role;

public interface RoleService {

	Role getName(String roleName);

	Long save(Role role);

	

	
}
