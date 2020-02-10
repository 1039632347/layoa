package com.situ.layoa.role.service.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.Util.DAOUtils;
import com.situ.layoa.commons.LayResult;
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
	public Integer getName(String roleName) {
	    Role role =	roleDao.get(roleName);
	
		return role!=null? 0 : 1;
	}
	@Override
	public Long save(Role role) {
	 role.setActiveFlag(1);
		role.setCreateBy("admin");
		role.setCreateDate(new Date());
		return roleDao.save(role);
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
	@Override
	public LayResult finAllRole(Integer page, Integer limit, Role searchRole) {
		
		Role searchParam = DAOUtils.buildSearchParam(searchRole);
		
		Integer dataCount = roleDao.getCount(searchParam);
		
		List<Role> roleList = roleDao.findByPage(DAOUtils.buildPagination(page, limit),searchParam);

		return new LayResult(0,"",dataCount,roleList) ;
	}

}
