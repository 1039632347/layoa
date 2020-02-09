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
	
	  Role	role =roleService.getName(roleName);
		Integer result=1;
	String roleName1 =	role.getRoleName();
		if(roleName1!=null) {
			result=0;
		}
		return result;
	}
	

	@GetMapping("/{page}/{limit}")
	public LayResult findAllRole(@PathVariable("page")Integer page,@PathVariable("limit") Integer Limit) {
		
		List<Role> rolelist =  roleService.finAllRole();
		
		Integer count = roleService.getCount();
		
		return new LayResult(0,"",count,rolelist);
	
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
	   public ModelAndView goUpdate(@PathVariable("rowId") Long rowId,ModelAndView modelAndView) {		
			modelAndView.addObject("role", roleService.findRoleById(rowId));
			modelAndView.setViewName(ROLE_ADD);
			return modelAndView;
		}
	
	@PutMapping
	public Long doUpdateRole(Role role) {
		return this.roleService.doUpdate(role);
	}
	
	
	
}
