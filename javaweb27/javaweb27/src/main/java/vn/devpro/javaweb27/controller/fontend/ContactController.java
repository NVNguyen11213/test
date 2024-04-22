package vn.devpro.javaweb27.controller.fontend;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.dto.Contact;
import vn.devpro.javaweb27.dto.Jw27Constant;

@Controller
public class ContactController extends BaseController implements Jw27Constant{
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		return "frontend/contact/contact";
	}
	@RequestMapping(value = "/contact-send", method = RequestMethod.POST)
	public String contactSend(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		Contact contact = new Contact();
		// Lấy dữ liệu từ form
		contact.setName(request.getParameter("txtName"));// name của input
		System.out.println("Name :" + contact.getName());
		contact.setMobile(request.getParameter("txtMobile"));// name của input
		System.out.println("Name :" + contact.getMobile());
		
		return "frontend/contact/contact";
	}
	
	@RequestMapping(value = "/contact-edit", method = RequestMethod.GET)
	public String contactEdit(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		Contact contact = new Contact("Tiểu Vũ","vutieu@gmail.com","09564654645","HaiPhong","Chuyển kiếp cấp độ kim tiên");
		model.addAttribute("contact", contact);
		return "frontend/contact/contact-edit";
	}
	@RequestMapping(value = "/contact-edit-save", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactEditSave(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestBody Contact contact  // lay du lieu tu ham ajax
			) throws IOException{
		System.out.println(contact.getName());
		// Sau khi lưu dữ liệu vào db
		Map<String, Object> jsonResult = new HashMap<String,Object>();//Gửi lại view
		jsonResult.put("code", 200);
		jsonResult.put("message", "Cảm ơn" + contact.getName() + "đã gửi thông tin phản hồi");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/contact-sf", method = RequestMethod.GET)
	public String contactSf(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		model.addAttribute("contact", new Contact());
		return "frontend/contact/contact-sf";
	}
	
	@RequestMapping(value = "/contact-sf-save", method = RequestMethod.POST)
	public String contactSfSave(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("contact") Contact contact ,// get data form
			@RequestParam("contactFile") MultipartFile contactFile
			) throws IOException{
		System.out.println(contact.getName());
		System.out.println(contact.getMobile());
		// Lưu file vào thư mục và lưu đường dẫn vào DB
		// Kiểm tra người dùng có upload file không
		if(contactFile != null && !contactFile.getOriginalFilename().isEmpty()) {
			// Có upload
			String path = FOLDER_UPLOAD + "Contacts/" + contactFile.getOriginalFilename();
			File file = new File(path);
			contactFile.transferTo(file);
		}
		
		
		return "frontend/contact/contact-sf";
	}
	

	@RequestMapping(value = "/contact-sf-edit", method = RequestMethod.GET)
	public String contactSfEdit(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		Contact contact = new Contact("Tiểu Vũ","vutieu@gmail.com","09564654645","HaiPhong","Chuyển kiếp cấp độ kim tiên");
		model.addAttribute("contact", contact);
		return "frontend/contact/contact-sf-edit";
	}
}
