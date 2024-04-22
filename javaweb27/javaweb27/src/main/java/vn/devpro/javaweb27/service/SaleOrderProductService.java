package vn.devpro.javaweb27.service;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb27.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct>{
	@Override
	public Class<SaleOrderProduct> clazz(){
		return SaleOrderProduct.class;
	}
}
