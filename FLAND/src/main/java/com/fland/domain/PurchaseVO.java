package com.fland.domain;

public class PurchaseVO {
	private String no;
	private String purchase_date;
	private String order_no;
	private String category;
	private String company;
	private String detail;
	private String sum;
	private String quantity;
	private String stock_in_date;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getStock_in_date() {
		return stock_in_date;
	}
	public void setStock_in_date(String stock_in_date) {
		this.stock_in_date = stock_in_date;
	}
	@Override
	public String toString() {
		return "PurchaseVO [no=" + no + ", purchase_date=" + purchase_date + ", order_no=" + order_no + ", category="
				+ category + ", company=" + company + ", detail=" + detail + ", sum=" + sum + ", quantity=" + quantity
				+ ", stock_in_date=" + stock_in_date + "]";
	}

}
