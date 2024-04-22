package vn.devpro.javaweb27.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sale_order")
public class SaleOrder extends BaseModel{
	@Column(name ="code", length = 60, nullable = false)
	private String code;
	
	@Column(name = "total", nullable = true)
	private BigDecimal total;
	
	@Column(name = "customer_name", length = 300, nullable = false)
	private String customer_name;
	
	@Column(name = "customer_mobile", length = 120, nullable = true)
	private String cusromer_mobile;
	
	@Column(name ="customer_email", length = 120, nullable = true)
	private String customer_email;
	
	@Column(name = "customer_address", length = 300, nullable = true)
	private String customer_address;
	
//---------Mapping Many-to-one : tbl_sale_order-to-tbl_user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="user_id")
	private User user;

//---------Mapping One-to-Many : tbl_sale_order-to-tbl_sale_order_product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleorder")
	private Set<SaleOrderProduct> SaleOrderProducts = new HashSet<SaleOrderProduct>();
	
	public void addRelationalSaleOrderProduct(SaleOrderProduct saleorderproduct) {
		SaleOrderProducts.add(saleorderproduct);
		saleorderproduct.setSaleorder(this);
	}
	public void removeRelationalSaleOrderProduct(SaleOrderProduct saleorderproduct) {
		SaleOrderProducts.remove(saleorderproduct);
		saleorderproduct.setSaleorder(this);
	}
	public SaleOrder() {
		super();
	}
	public SaleOrder(Integer id, Date createDate, Date updateDate, Boolean status, String code, BigDecimal total,
			String customer_name, String cusromer_mobile, String customer_email, String customer_address, User user,
			Set<SaleOrderProduct> saleOrderProducts) {
		super(id, createDate, updateDate, status);
		this.code = code;
		this.total = total;
		this.customer_name = customer_name;
		this.cusromer_mobile = cusromer_mobile;
		this.customer_email = customer_email;
		this.customer_address = customer_address;
		this.user = user;
		SaleOrderProducts = saleOrderProducts;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCusromer_mobile() {
		return cusromer_mobile;
	}
	public void setCusromer_mobile(String cusromer_mobile) {
		this.cusromer_mobile = cusromer_mobile;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return SaleOrderProducts;
	}
	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		SaleOrderProducts = saleOrderProducts;
	}

}
