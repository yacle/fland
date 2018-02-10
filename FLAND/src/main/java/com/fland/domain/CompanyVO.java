package com.fland.domain;

public class CompanyVO {
	private String NAME;
	private Integer LICENSE_NUM;
	private String CEO;	
	private String ADDRESS;	
	private String BUSINESS;
	private String EVENT;	
	private Integer FAX;	
	private Integer TEL;	
	private String OPERATOR;
	private String ITEM;
	private String ETC;
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public Integer getLICENSE_NUM() {
		return LICENSE_NUM;
	}
	public void setLICENSE_NUM(Integer lICENSE_NUM) {
		LICENSE_NUM = lICENSE_NUM;
	}
	public String getCEO() {
		return CEO;
	}
	public void setCEO(String cEO) {
		CEO = cEO;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getBUSINESS() {
		return BUSINESS;
	}
	public void setBUSINESS(String bUSINESS) {
		BUSINESS = bUSINESS;
	}
	public String getEVENT() {
		return EVENT;
	}
	public void setEVENT(String eVENT) {
		EVENT = eVENT;
	}
	public Integer getFAX() {
		return FAX;
	}
	public void setFAX(Integer fAX) {
		FAX = fAX;
	}
	public Integer getTEL() {
		return TEL;
	}
	public void setTEL(Integer tEL) {
		TEL = tEL;
	}
	public String getOPERATOR() {
		return OPERATOR;
	}
	public void setOPERATOR(String oPERATOR) {
		OPERATOR = oPERATOR;
	}
	public String getITEM() {
		return ITEM;
	}
	public void setITEM(String iTEM) {
		ITEM = iTEM;
	}
	public String getETC() {
		return ETC;
	}
	public void setETC(String eTC) {
		ETC = eTC;
	}
	@Override
	public String toString() {
		return "CompanyVO [NAME=" + NAME + ", LICENSE_NUM=" + LICENSE_NUM + ", CEO=" + CEO + ", ADDRESS=" + ADDRESS
				+ ", BUSINESS=" + BUSINESS + ", EVENT=" + EVENT + ", FAX=" + FAX + ", TEL=" + TEL + ", OPERATOR="
				+ OPERATOR + ", ITEM=" + ITEM + ", ETC=" + ETC + "]";
	}
}
