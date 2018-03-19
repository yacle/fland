package com.fland.domain;


public class OrderVO {
	private int no;
	private String orderno;		// order 번호
	private String company;		// 발주처
	private String sn;			// 시리얼번호
	private String orderdate;	// 발주일자
	private String enddate;		// 마감일자
	private String fabric;		// 품명
	private int workwidth;		// 가공폭
	private int workweight;		// 가공중량
	private String color;	// 색상
	private String orderlength;	// 발주량
	private String colorbt;		// B/T
	private int price;			// 단가
	private String etc;			// 기타
	private String person;		// 발주
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
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
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getFabric() {
		return fabric;
	}
	public void setFabric(String fabric) {
		this.fabric = fabric;
	}
	public int getWorkwidth() {
		return workwidth;
	}
	public void setWorkwidth(int workwidth) {
		this.workwidth = workwidth;
	}
	public int getWorkweight() {
		return workweight;
	}
	public void setWorkweight(int workweight) {
		this.workweight = workweight;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getOrderlength() {
		return orderlength;
	}
	public void setOrderlength(String orderlength) {
		this.orderlength = orderlength;
	}
	public String getColorbt() {
		return colorbt;
	}
	public void setColorbt(String colorbt) {
		this.colorbt = colorbt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", orderno=" + orderno + ", company=" + company + ", sn=" + sn + ", orderdate="
				+ orderdate + ", enddate=" + enddate + ", fabric=" + fabric + ", workwidth=" + workwidth
				+ ", workweight=" + workweight + ", color=" + color + ", orderlength=" + orderlength + ", colorbt="
				+ colorbt + ", price=" + price +", etc=" + etc +  "]";
	}
}
