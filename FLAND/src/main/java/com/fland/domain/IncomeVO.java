package com.fland.domain;

public class IncomeVO {
	private String INCOME_DATE;	// 입금일자
	private String ACCOUNT;		// 계좌명
	private String COMPANY;		// 거래처명
	private String ITEM;		// 비목
	private String DETAIL;		// 내용
	private String SUM;			// 입금금액
	private String ETC;			// 기타
	
	public String getINCOME_DATE() {
		return INCOME_DATE;
	}
	public void setINCOME_DATE(String iNCOME_DATE) {
		INCOME_DATE = iNCOME_DATE;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public String getITEM() {
		return ITEM;
	}
	public void setITEM(String iTEM) {
		ITEM = iTEM;
	}
	public String getDETAIL() {
		return DETAIL;
	}
	public void setDETAIL(String dETAIL) {
		DETAIL = dETAIL;
	}
	public String getSUM() {
		return SUM;
	}
	public void setSUM(String sUM) {
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
		return "IncomeVO [INCOME_DATE=" + INCOME_DATE + ", ACCOUNT=" + ACCOUNT + ", COMPANY=" + COMPANY + ", ITEM="
				+ ITEM + ", DETAIL=" + DETAIL + ", SUM=" + SUM + ", ETC=" + ETC + "]";
	}
}
