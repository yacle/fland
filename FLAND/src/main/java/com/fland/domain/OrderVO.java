package com.fland.domain;


public class OrderVO {
	private int no;
	private String orderNo;		// order ��ȣ
	private String company;		// ����ó
	private String sn;			// �ø����ȣ
	private String orderDate;	// ��������
	private String endDate;		// ��������
	private String fabric;		// ǰ��
	private int workWidth;		// ������
	private int workWeight;		// �����߷�
	private String color;	// ����
	private String orderLength;	// ���ַ�
	private String colorBt;		// B/T
	private int price;			// �ܰ�
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFabric() {
		return fabric;
	}
	public void setFabric(String fabric) {
		this.fabric = fabric;
	}
	public int getWorkWidth() {
		return workWidth;
	}
	public void setWorkWidth(int workWidth) {
		this.workWidth = workWidth;
	}
	public int getWorkWeight() {
		return workWeight;
	}
	public void setWorkWeight(int workWeight) {
		this.workWeight = workWeight;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getOrderLength() {
		return orderLength;
	}
	public void setOrderLength(String orderLength) {
		this.orderLength = orderLength;
	}
	public String getColorBt() {
		return colorBt;
	}
	public void setColorBt(String colorBt) {
		this.colorBt = colorBt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", orderNo=" + orderNo + ", company=" + company + ", sn=" + sn + ", orderDate="
				+ orderDate + ", endDate=" + endDate + ", fabric=" + fabric + ", workWidth=" + workWidth
				+ ", workWeight=" + workWeight + ", color=" + color + ", orderLength=" + orderLength + ", colorBt="
				+ colorBt + ", price=" + price + "]";
	}
}
