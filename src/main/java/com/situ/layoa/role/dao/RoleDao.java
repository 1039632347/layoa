package com.situ.layoa.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.layoa.commons.Pagination;
import com.situ.layoa.role.domain.Role;

@Repository
public interface RoleDao {

	Role get(String roleName);

	Long save(Role role);

	List<Role> findAll();

	Integer getCount(@Param("searchParam")Role searchParam);

	Long delete(Long rowId);

	Role findRoleById(Long rowId);

	Long update(Role role);

	List<Role> findByPage(@Param("pagination")Pagination pagination,@Param("searchParam") Role searchParam);

}
