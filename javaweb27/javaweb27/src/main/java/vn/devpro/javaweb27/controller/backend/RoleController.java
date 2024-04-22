package vn.devpro.javaweb27.controller.backend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb27.model.Role;
import vn.devpro.javaweb27.service.RoleService;

@Controller
@RequestMapping("admin/role/")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String list(final Model model) {
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		return "backend/role-list";
	}
}
