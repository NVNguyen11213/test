package vn.devpro.javaweb27.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_sale_order_product")
public class SaleOrderProduct extends BaseModel{
	@Column(name = "quantity", nullable = true)
	private int quantity;
	
	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
//-------Mapping Many-to-one: tbl_sale_order_product-to-tbl_product
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;
//-------Mapping Many-to-one: tbl_sale_order_product-to-tbl_sale_order
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sale_order_id")
	private SaleOrder saleorder;
	
	
	public SaleOrderProduct() {
		super();
	}


	public SaleOrderProduct(Integer id, Date createDate, Date updateDate, Boolean status, int quantity,
			String description, Product product, SaleOrder saleorder) {
		super(id, createDate, updateDate, status);
		this.quantity = quantity;
		this.description = description;
		this.product = product;
		this.saleorder = saleorder;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public SaleOrder getSaleorder() {
		return saleorder;
	}


	public void setSaleorder(SaleOrder saleorder) {
		this.saleorder = saleorder;
	}
	
	
}
