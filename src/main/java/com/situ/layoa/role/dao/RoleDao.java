package com.situ.layoa.role.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.layoa.role.domain.Role;

@Repository
public interface RoleDao {

	Role get(String roleName);

	Long save(Role role);

	List<Role> findAll();

	Integer getCount();

	Long delete(Long rowId);

	Role findRoleById(Long rowId);

	Long update(Role role);

}
