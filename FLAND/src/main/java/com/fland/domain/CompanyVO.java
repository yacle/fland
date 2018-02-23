package com.fland.domain;

public class CompanyVO {
	private String DIV;
	private String NAME;
	private String ITEM;
	private String CLAS;
	private String PERSON;
	private String EMAIL;
	private String PHONE_CELL;
	private String PHONE_COM;
	private String FAX;
	private String ADDRESS;
	private String BANK;
	private String ACCOUNT_NUM;
	private String ACCOUNT_NAME;
	private String LICENSE_NUM;
	private String TYPE1;
	private String TYPE2;
	private String CEO;
	public String getDIV() {
		return DIV;
	}
	public void setDIV(String dIV) {
		DIV = dIV;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getITEM() {
		return ITEM;
	}
	public void setITEM(String iTEM) {
		ITEM = iTEM;
	}
	public String getCLASS() {
		return CLAS;
	}
	public void setCLASS(String cLAS) {
		CLAS = cLAS;
	}
	public String getPERSON() {
		return PERSON;
	}
	public void setPERSON(String pERSON) {
		PERSON = pERSON;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONE_CELL() {
		return PHONE_CELL;
	}
	public void setPHONE_CELL(String pHONE_CELL) {
		PHONE_CELL = pHONE_CELL;
	}
	public String getPHONE_COM() {
		return PHONE_COM;
	}
	public void setPHONE_COM(String pHONE_COM) {
		PHONE_COM = pHONE_COM;
	}
	public String getFAX() {
		return FAX;
	}
	public void setFAX(String fAX) {
		FAX = fAX;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getBANK() {
		return BANK;
	}
	public void setBANK(String bANK) {
		BANK = bANK;
	}
	public String getACCOUNT_NUM() {
		return ACCOUNT_NUM;
	}
	public void setACCOUNT_NUM(String aCCOUNT_NUM) {
		ACCOUNT_NUM = aCCOUNT_NUM;
	}
	public String getACCOUNT_NAME() {
		return ACCOUNT_NAME;
	}
	public void setACCOUNT_NAME(String aCCOUNT_NAME) {
		ACCOUNT_NAME = aCCOUNT_NAME;
	}
	public String getLICENSE_NUM() {
		return LICENSE_NUM;
	}
	public void setLICENSE_NUM(String lICENSE_NUM) {
		LICENSE_NUM = lICENSE_NUM;
	}
	public String getTYPE1() {
		return TYPE1;
	}
	public void setTYPE1(String tYPE1) {
		TYPE1 = tYPE1;
	}
	public String getTYPE2() {
		return TYPE2;
	}
	public void setTYPE2(String tYPE2) {
		TYPE2 = tYPE2;
	}
	public String getCEO() {
		return CEO;
	}
	public void setCEO(String cEO) {
		CEO = cEO;
	}
	@Override
	public String toString() {
		return "CustomerVO [DIV=" + DIV + ", NAME=" + NAME + ", ITEM=" + ITEM + ", PERSON=" + PERSON + ", EMAIL="
				+ EMAIL + ", PHONE_CELL=" + PHONE_CELL + ", PHONE_COM=" + PHONE_COM + ", FAX=" + FAX + ", ADDRESS="
				+ ADDRESS + ", BANK=" + BANK + ", ACCOUNT_NUM=" + ACCOUNT_NUM + ", ACCOUNT_NAME=" + ACCOUNT_NAME
				+ ", LICENSE_NUM=" + LICENSE_NUM + ", TYPE1=" + TYPE1 + ", TYPE2=" + TYPE2 + ", CEO=" + CEO + "]";
	}
}
