package com.fland.domain;

public class New_YarnVO {
	private String ORDER_NO;
	private String YARN;								// order 번호
	private String YARN_COM;						// 발주처
	private String YARN_PRICE;						// 발주일자
	private String YARN_ORDER_DATE;			// 품명
	private String YARN_ORDER_QUANTITY;	// 색상
	
	public String getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(String oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public String getYARN() {
		return YARN;
	}
	public void setYARN(String yARN) {
		YARN = yARN;
	}
	public String getYARN_COM() {
		return YARN_COM;
	}
	public void setYARN_COM(String yARN_COM) {
		YARN_COM = yARN_COM;
	}
	public String getYARN_PRICE() {
		return YARN_PRICE;
	}
	public void setYARN_PRICE(String yARN_PRICE) {
		YARN_PRICE = yARN_PRICE;
	}
	public String getYARN_ORDER_DATE() {
		return YARN_ORDER_DATE;
	}
	public void setYARN_ORDER_DATE(String yARN_ORDER_DATE) {
		YARN_ORDER_DATE = yARN_ORDER_DATE;
	}
	public String getYARN_ORDER_QUANTITY() {
		return YARN_ORDER_QUANTITY;
	}
	public void setYARN_ORDER_QUANTITY(String yARN_ORDER_QUANTITY) {
		YARN_ORDER_QUANTITY = yARN_ORDER_QUANTITY;
	}
}