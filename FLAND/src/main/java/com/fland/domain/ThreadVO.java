package com.fland.domain;

public class ThreadVO {
	private int threadno;
	private String orderno;
	private String company;
	private String delivery;
	private String knitloss;
	private String threadweight;
	private String btno;
	private String threadetc;
	public int getThreadno() {
		return threadno;
	}
	public void setThreadno(int threadno) {
		this.threadno = threadno;
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
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getKnitloss() {
		return knitloss;
	}
	public void setKnitloss(String knitloss) {
		this.knitloss = knitloss;
	}
	public String getThreadweight() {
		return threadweight;
	}
	public void setThreadweight(String threadweight) {
		this.threadweight = threadweight;
	}
	public String getBtno() {
		return btno;
	}
	public void setBtno(String btno) {
		this.btno = btno;
	}
	public String getThreadetc() {
		return threadetc;
	}
	public void setThreadetc(String threadetc) {
		this.threadetc = threadetc;
	}
	@Override
	public String toString() {
		return "ThreadVO [threadno=" + threadno + ", orderno=" + orderno + ", company=" + company + ", delivery="
				+ delivery + ", knitloss=" + knitloss + ", threadweight=" + threadweight + ", btno=" + btno
				+ ", threadetc=" + threadetc + "]";
	}
	
}
