package vn.devpro.javaweb27.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb27.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{
	@Override
	public Class<SaleOrder> clazz(){
		return SaleOrder.class;
	}
	@Transactional
	public SaleOrder saveOrder(SaleOrder saleOrder) {
		return super.saveOrUpdate(saleOrder);
	}
}
