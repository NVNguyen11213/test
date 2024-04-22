package vn.devpro.javaweb27.controller.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.model.Category;
import vn.devpro.javaweb27.model.User;
import vn.devpro.javaweb27.service.CategoryService;
import vn.devpro.javaweb27.service.UserService;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/category/")
public class CategoryController extends BaseController{
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;
	
	@RequestMapping (value = "list", method = RequestMethod.GET)
	public String list(final Model model) {
		List<Category> categories = categoryService.findAll();
//		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		return "backend/category-list";
	}
	@RequestMapping (value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		Category category = new Category();
		category.setCreateDate(new Date());
		model.addAttribute("category", category);
		return "backend/category-add";
	}
	
	@RequestMapping (value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model,
			@ModelAttribute("category") Category category) {

		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/add";
	}
	
	@RequestMapping (value = "edit/{categoryId}", method = RequestMethod.GET)
	public String edit(final Model model, 
				@PathVariable("categoryId") int categoryId) {
		List<User> users = userService.findAllACtive();
		model.addAttribute("users", users);
		// Layas category trong DB bằng id
		Category category = categoryService.getById(categoryId);
		
		
		model.addAttribute("category", category);
		return "backend/category-edit";
	}
	
	@RequestMapping (value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
			@ModelAttribute("category") Category category) {

		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/list";
	}
	
//	@RequestMapping (value = "delete/{categoryId}", method = RequestMethod.GET)
//	public String delete(final Model model, 
//				@PathVariable("categoryId") int categoryId) {
//
//			categoryService.deleteCategoryById(categoryId);
//		return "redirect:/admin/category/list";
//	}
	@RequestMapping (value = "delete/{categoryId}", method = RequestMethod.GET)
	public String delete(final Model model, 
				@PathVariable("categoryId") int categoryId) {

		Category category = categoryService.getById(categoryId);
		category.setStatus(false);
		categoryService.inactiveCategory(category);
		
		return "redirect:/admin/category/list";
	}
}
