package com.fland.domain;

public class SearchVO {
	private String startDate;
	private String endDate;
	private String condition;
	private String detail;
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
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "SearchVO [startDate=" + startDate + ", endDate=" + endDate + ", condition="
				+ condition + ", detail=" + detail + "]";
	}
	
}
