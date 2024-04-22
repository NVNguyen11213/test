package vn.devpro.javaweb27.controller.backend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.model.User;
import vn.devpro.javaweb27.service.CategoryService;
import vn.devpro.javaweb27.service.ProductService;
import vn.devpro.javaweb27.service.UserService;

@Controller
@RequestMapping("admin/user")
public class UserController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list (final Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		return "backend/user-list";
	}
}
