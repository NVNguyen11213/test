package vn.devpro.javaweb27.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javaweb27.dto.Jw27Constant;
import vn.devpro.javaweb27.dto.SearchModel;
import vn.devpro.javaweb27.model.Product;
import vn.devpro.javaweb27.model.ProductImage;

@Service
public class ProductService extends BaseService<Product>  implements Jw27Constant{
	@Override
	public Class<Product> clazz(){
		return Product.class;
	}
	public List<Product> findAllActive(){
		return super.executeNativeSql("Select * From tbl_product WHERE status = 1");
	}
	public boolean isUploadFile(MultipartFile file) {
		if(file == null || file.getOriginalFilename().isEmpty()) {
			return false;
		}
		return true;
	}
	public boolean isUploadFiles(MultipartFile[] files) {
		if(files == null || files.length == 0) {
			return false;
		}
		return true;
	}
	// ==================Save new product to database=============
	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException {
			if(isUploadFile(avatarFile)){
				String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
				File file = new File(path);
				avatarFile.transferTo(file);
				product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
			}
			if(isUploadFiles(imageFiles)) {
				for(MultipartFile imageFile : imageFiles) {
					if(isUploadFile(imageFile)) {
						String path = FOLDER_UPLOAD +"Product/Image/" + imageFile.getOriginalFilename();
						File file = new File(path);
						imageFile.transferTo(file);
						
						ProductImage productImage = new ProductImage();
						productImage.setTitle(imageFile.getOriginalFilename());
						productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
						productImage.setStatus(Boolean.TRUE);
						productImage.setCreateDate(new Date());
						
						product.addRelationalProductImage(productImage);
					}
				}
			}
		return super.saveOrUpdate(product);
	}
	// ==================Save edit product to database=============
		@Transactional
		public Product saveEditProduct(Product product, MultipartFile avatarFile,
				MultipartFile[] imageFiles) throws IOException {
			Product dbProduct = super.getById(product.getId());
				if(isUploadFile(avatarFile)){
					String path = FOLDER_UPLOAD + "Product/Avatar/" + dbProduct.getAvatar();
					File file = new File(path);
					file.delete();
					
					path = FOLDER_UPLOAD + "Product/Avatar/" +avatarFile.getOriginalFilename();
					file = new File(path);
					avatarFile.transferTo(file);
					product.setAvatar("Product/Avatar/" +avatarFile.getOriginalFilename());
				}else {
					product.setAvatar(dbProduct.getAvatar());
				}
				if(isUploadFiles(imageFiles)) {
					for(MultipartFile imageFile : imageFiles) {
						if(isUploadFile(imageFile)) {
							String path = FOLDER_UPLOAD +"Product/Image/" + imageFile.getOriginalFilename();
							File file = new File(path);
							imageFile.transferTo(file);
							
							ProductImage productImage = new ProductImage();
							productImage.setTitle(imageFile.getOriginalFilename());
							productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
							productImage.setStatus(Boolean.TRUE);
							productImage.setCreateDate(new Date());
							
							product.addRelationalProductImage(productImage);
						}
					}
				}
			return super.saveOrUpdate(product);
		}
		// Delete product
		@Autowired
		private ProductImageService productImageService;
		@Transactional
		public void deleteProduct(Product product) {
			String sql = "SELECT * from tbl_product_image WHERE product_id =" +product.getId();
			List<ProductImage> productImages = productImageService.executeNativeSql(sql);
			
			for(ProductImage productImage : productImages) {
				String path = FOLDER_UPLOAD +productImage.getPath();
				File file = new File(path);
				file.delete();
			}
			String path = FOLDER_UPLOAD + product.getAvatar();
			File file = new File(path);
			file.delete();
			super.delete(product);
		}
		
		//-----------------Search product ------------------
		public List<Product> searchProduct(SearchModel productSearch){
			String sql = "SELECT * from tbl_product p WHERE 1=1";
			
			//Tim kiem voi tieu chi status
			if(productSearch.getStatus() != 2) {
				sql += " AND p.status = " + productSearch.getStatus();
			}
			//Tim kiemvoi tieu chi category
			if(productSearch.getCategoryId() != 0) {
				sql += " AND p.category_id = " + productSearch.getCategoryId();
			}
			
			//Tim kiem voi keyword
			if (!StringUtils.isEmpty(productSearch.getKeyword())) {
				String keyword = productSearch.getKeyword().toLowerCase();
				
				sql += " AND (LOWER(p.name) like '%" + keyword + "%'" +
						" OR LOWER(p.short_description) like '%" + keyword + "%'" +
						" OR LOWER(p.seo) like '%" + keyword + "%')";
			}
			//Tím kiếm theo ngày tháng
			if(!StringUtils.isEmpty(productSearch.getBeginDate()) && !StringUtils.isEmpty(productSearch.getEndDate())){
					String beginDate = productSearch.getBeginDate();
					String endDate = productSearch.getEndDate();
					sql += " AND p.create_date BETWEEN '" + beginDate + "'AND'" + endDate +"'";
			}
			return super.executeNativeSql(sql);
			
		}
}
