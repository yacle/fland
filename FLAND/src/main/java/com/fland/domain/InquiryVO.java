package com.fland.domain;

public class InquiryVO {
	private int no;	
	private String divi;
	private String tran_date;	
	private String account;	
	private String method;	
	private String client;	
	private String item;	
	private String detail;
	private int begin_bal;
	private int sum;	
	private String etc;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getDivi() {
		return divi;
	}
	public void setDivi(String divi) {
		this.divi = divi;
	}
	public String getTran_date() {
		return tran_date;
	}
	public void setTran_date(String tran_date) {
		this.tran_date = tran_date;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
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
	public int getBegin_bal() {
		return begin_bal;
	}
	public void setBegin_bal(int begin_bal) {
		this.begin_bal = begin_bal;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "InquiryVO [no=" + no + ", divi=" + divi + ", tran_date=" + tran_date + ", account=" + account
				+ ", method=" + method + ", client=" + client + ", item=" + item + ", detail=" + detail + ", begin_bal="
				+ begin_bal + ", sum=" + sum + ", etc=" + etc + "]";
	}
}
