package vn.devpro.javaweb27.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb27.model.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage>{
	@Override
	public Class<ProductImage> clazz(){
		return ProductImage.class;
	}
	
	public List<ProductImage> getProductImageByProductId(int productId) {
		String sql = "Select * from tbl_product_image Where product_id = " + productId;
		return super.executeNativeSql(sql);
	}
}
