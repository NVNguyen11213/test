package vn.devpro.javaweb27.controller.fontend;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.dto.Cart;
import vn.devpro.javaweb27.dto.Customer;
import vn.devpro.javaweb27.dto.Jw27Constant;
import vn.devpro.javaweb27.dto.ProductCart;
import vn.devpro.javaweb27.model.Product;
import vn.devpro.javaweb27.model.SaleOrder;
import vn.devpro.javaweb27.model.SaleOrderProduct;
import vn.devpro.javaweb27.model.User;
import vn.devpro.javaweb27.service.ProductImageService;
import vn.devpro.javaweb27.service.ProductService;
import vn.devpro.javaweb27.service.SaleOrderService;

@Controller
public class CartController extends BaseController implements Jw27Constant{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	// Thêm một sản phẩm vào giỏ hàng
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model,
			final HttpServletRequest request,
			@RequestBody ProductCart addProduct) throws IOException{
		
		HttpSession session = request.getSession();
		Cart cart = null;
		// Lay gio hang trong Session
		// Kiem tra xem gio hang da duoc tao trong Session chua
		if(session.getAttribute("cart") != null) { // da co gio hang
			cart = (Cart)session.getAttribute("cart");
			
		}else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		// Laay sna pham trong co so du lieu
		Product dbProduct = productService.getById(addProduct.getProductId());
		
		// Kiem tra san phamdat mua co torng gio hang chua
		int index = cart.findProductById(dbProduct.getId());
		if(index != -1) {// San pham da co trong gio hang
			cart.getProductCarts().get(index).setQuantity(cart.getProductCarts().get(index).getQuantity().add(addProduct.getQuantity()));
		}else {
			addProduct.setProductName(dbProduct.getName());
			addProduct.setAvatar(dbProduct.getAvatar());
			addProduct.setPrice(dbProduct.getPrice());
			
			cart.getProductCarts().add(addProduct);
		}
		
		// Thiet lap lai gio hang trong session
		session.setAttribute("cart", cart);
		// Tra ve du lieu cho view
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		jsonResult.put("message","Da them san pham" + addProduct.getProductName() + " vao gio hang ");
		
		return ResponseEntity.ok(jsonResult);
	}
	// Hiển thị giỏ hàng
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
			String message = "Co tong cong" + cart.totalCartProduct() + "trong gio hang";
			model.addAttribute("message", message);
		}else {
			String errorMessage = "khong co san pham nao trong gio hang";
			model.addAttribute("errorMessage", errorMessage);
		}
		return "frontend/cart-view";
	}
	// Them/bot so luong san pham trong gio hang
		@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)

		public ResponseEntity<Map<String, Object>> updateProductQuantity(final HttpServletRequest request,
				@RequestBody ProductCart productCart) throws IOException {
			HttpSession session = request.getSession();
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			if (session.getAttribute("cart") != null) {
				Cart cart = (Cart) session.getAttribute("cart");
				// Cap nhat so luong
				int index = cart.findProductById(productCart.getProductId());
				BigInteger oldQuantity = cart.getProductCarts().get(index).getQuantity();
				BigInteger newQuantity = oldQuantity.add(productCart.getQuantity()); // -/+
				if (newQuantity.intValue() < 1) {
					newQuantity = BigInteger.ONE;
				}
				cart.getProductCarts().get(index).setQuantity(newQuantity);
				jsonResult.put("newQuantity", newQuantity);
				jsonResult.put("productId", productCart.getProductId());

			}	
			// Tra ve du lieu cho view
			return ResponseEntity.ok(jsonResult);
		}
		// Them/bot so luong san pham trong gio hang
		@RequestMapping(value = "/place-order", method = RequestMethod.POST)

		public ResponseEntity<Map<String, Object>> placeOrder(final HttpServletRequest request,
				@RequestBody Customer customer) throws IOException {
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			
			//Kiểm tra thông tin customer bắt buộc
			if(StringUtils.isEmpty(customer.getTxtName())) {
				jsonResult.put("message", "Bạn chưa nhập họ tên");
			}
			else if(StringUtils.isEmpty(customer.getTxtMobile())) {
				jsonResult.put("message", "Bạn chưa nhập số điện thoại");
			}
			else {
				HttpSession session = request.getSession();
				if(session.getAttribute("cart") == null) {
					jsonResult.put("message", "Ban chua co gio hang");
				}else {
					Cart cart = (Cart) session.getAttribute("cart");
					// Lưu các sản phẩm tỏng giỏ hàng vào bảng tbl_sale_order_product
					SaleOrder saleOrder = new SaleOrder();
					for(ProductCart productCart: cart.getProductCarts()) {
						SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
						Product dbProduct = productService.getById(productCart.getProductId());
						saleOrderProduct.setProduct(dbProduct);
						saleOrderProduct.setQuantity(productCart.getQuantity().intValue());
						saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
					}
					//Lưu đơn hàng vào tbl_sale_order 
					Calendar cal = Calendar.getInstance();
					String code = customer.getTxtMobile() + cal.get(Calendar.YEAR) + cal.get(Calendar.MONTH)+ 
							cal.get(Calendar.DAY_OF_MONTH);
					saleOrder.setCode(code);
					User user = new User();
					user.setId(1);
					saleOrder.setUser(user);
					
					saleOrder.setCustomer_name(customer.getTxtName());
					saleOrder.setCusromer_mobile(customer.getTxtMobile());
					saleOrder.setCustomer_email(customer.getTxtEmail());
					saleOrder.setCustomer_address(customer.getTxtAddress());
					saleOrder.setTotal(cart.totalCartPrice());
					
					saleOrderService.saveOrder(saleOrder);
					jsonResult.put("message", "Bạn đã đặt hàng thành công");
					// Xóa giỏ hàng sau khi đã đặt hàng
					cart = new Cart();
					session.setAttribute("cart", cart);
				}
			}
			return ResponseEntity.ok(jsonResult);
		}
}
