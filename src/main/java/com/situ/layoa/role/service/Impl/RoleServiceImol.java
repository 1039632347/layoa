package com.situ.layoa.role.service.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;




@Service
public class RoleServiceImol  implements Serializable,RoleService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 @Autowired
		private RoleDao roleDao;
	@Override
	public Role getName(String roleName) {
	
		
		return roleDao.get(roleName);
	}
	@Override
	public Long save(Role role) {
	 role.setActiveFlag(1);
		role.setCreateBy("admin");
		role.setCreateDate(new Date());
		return roleDao.save(role);
	}
	@Override
	public List<Role> finAllRole() {
		return roleDao.findAll();
	}
	@Override
	public Integer getCount() {
		
		return roleDao.getCount();
	}
	@Override
	public Long doDeleteRole(Long rowId) {
		return roleDao.delete(rowId);
	}
	@Override
	public Role findRoleById(Long rowId) {
		return roleDao.findRoleById(rowId);
	}
	@Override
	public Long doUpdate(Role role) {
		role.setUpdateBy("admin");
		role.setUpdateDate(new Date());
		return roleDao.update(role);
	}

}
