package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.commons.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
import com.situ.layoa.student.domain.Student;

@RestController
@RequestMapping("/role")
public class RoleController  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final String ROLE_INDEX = "role/role_index";
	private static final String ROLE_ADD = "role/role_add";
	
	@Autowired
	private RoleService roleService;
	
	@GetMapping
	public ModelAndView goindex(ModelAndView modelAndView) {
		modelAndView.setViewName(ROLE_INDEX);
		return modelAndView;	
	}
	
	@PostMapping
	public Long save(Role role) {
		
		return roleService.save(role);
		
	}
	
	@GetMapping("/checkname")
	public Integer checkusername(String roleName) {
	
		return  roleService.getName(roleName);
		
	}
	

	@GetMapping("/{page}/{limit}")
	public LayResult findAllRole(@PathVariable Integer page,@PathVariable  Integer limit ,Role searchRole) {
		
		return  roleService.finAllRole(page,limit,searchRole);
}
	
	@GetMapping("/goadd")
	public ModelAndView goadd(ModelAndView modelAndView) {
	
		modelAndView.setViewName(ROLE_ADD);
		return modelAndView;	
	}
	
	
	@DeleteMapping("/{rowId}")	
	public Long doDelete(@PathVariable("rowId")Long rowId) {		
	return this.roleService.doDeleteRole(rowId);		
	}
	
	
	@GetMapping("/{rowId}")
	   public Role goUpdate(@PathVariable("rowId") Long rowId) {		
	    	return roleService.findRoleById(rowId);	
		}
	
	@PutMapping
	public Long doUpdateRole(Role role) {
		return this.roleService.doUpdate(role);
	}
	
	
	
}
