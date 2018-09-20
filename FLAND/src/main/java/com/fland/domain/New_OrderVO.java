package com.fland.domain;

public class New_OrderVO {
	private String ORDER_NO;			// order 번호
	private String ORDER_COM;			// 발주처
	private String ORDER_DATE;			// 발주일자
	private String FABRIC_NAME;		// 품명
	private String COLOR;					// 색상
	private String ORDER_PRICE;		// 단가
	private String ORDER_QUANTITY; // 발주량
	
	public String getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(String oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public String getORDER_COM() {
		return ORDER_COM;
	}
	public void setORDER_COM(String oRDER_COM) {
		ORDER_COM = oRDER_COM;
	}
	public String getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(String oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public String getFABRIC_NAME() {
		return FABRIC_NAME;
	}
	public void setFABRIC_NAME(String fABRIC_NAME) {
		FABRIC_NAME = fABRIC_NAME;
	}
	public String getCOLOR() {
		return COLOR;
	}
	public void setCOLOR(String cOLOR) {
		COLOR = cOLOR;
	}
	public String getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(String oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
	public String getORDER_QUANTITY() {
		return ORDER_QUANTITY;
	}
	public void setORDER_QUANTITY(String oRDER_QUANTITY) {
		ORDER_QUANTITY = oRDER_QUANTITY;
	}
}
