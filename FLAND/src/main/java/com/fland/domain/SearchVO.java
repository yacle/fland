package com.fland.domain;

public class SearchVO {
	private String div;
	private String startDate;
	private String endDate;
	private String item;
	private String detail;
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "SearchVO [div=" + div + ", startDate=" + startDate + ", endDate=" + endDate + ", item=" + item
				+ ", detail=" + detail + "]";
	}
	
}
