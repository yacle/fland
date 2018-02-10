package com.fland.domain;

import java.util.Date;

public class AccountVO {
	private String NAME;	
	private String ACCOUNT_NUM;
	private int  BEGIN_BALANCE;
	private String INCOME_DATE;
	private int SUM;
	private String ETC;
	public String getINCOME_DATE() {
		return INCOME_DATE;
	}
	public void setINCOME_DATE(String income_date2) {
		INCOME_DATE = income_date2;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getACCOUNT_NUM() {
		return ACCOUNT_NUM;
	}
	public void setACCOUNT_NUM(String aCCOUNT_NUM) {
		ACCOUNT_NUM = aCCOUNT_NUM;
	}
	public int getBEGIN_BALANCE() {
		return BEGIN_BALANCE;
	}
	public void setBEGIN_BALANCE(int bEGIN_BALANCE) {
		BEGIN_BALANCE = bEGIN_BALANCE;
	}
	public int getSUM() {
		return SUM;
	}
	public void setSUM(int sUM) {
		SUM = sUM;
	}
	public String getETC() {
		return ETC;
	}
	public void setETC(String eTC) {
		ETC = eTC;
	}
	@Override
	public String toString() {
		return "AccountVO [INCOME_DATE=" + INCOME_DATE + ", NAME=" + NAME + ", ACCOUNT_NUM=" + ACCOUNT_NUM
				+ ", BEGIN_BALANCE=" + BEGIN_BALANCE + ", SUM=" + SUM + ", ETC=" + ETC
				+ "]";
	}
	
}