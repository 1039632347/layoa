package com.situ.layoa.role.controller;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

	private static final String ROLE_ADD = "role/role_add";
	
	@Autowired
	private RoleService roleService;
	
	@GetMapping
	public ModelAndView goroleadd(ModelAndView modelAndView) {
		modelAndView.setViewName(ROLE_ADD);
		return modelAndView;	
	}
	
	@PostMapping
	public Long save(Role role) {
		
		return roleService.save(role);
		
	}
	
	@GetMapping("/checkname")
	public Integer checkusername(String roleName) {
	
	  Role	role =roleService.getName(roleName);
		Integer result=1;
	String roleName1 =	role.getRoleName();
		if(roleName1!=null) {
			result=0;
		}
		return result;
	}
	
	
	
	
	
}
