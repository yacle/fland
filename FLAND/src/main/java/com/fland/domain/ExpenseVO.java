package com.fland.domain;

public class ExpenseVO {
	private String EXPENSE_DATE;	// ��������
	private String ACCOUNT;			// ���¸�
	private String METHOD;			// ����
	private String EMPLOYEE;		// �����
	private String ITEM;			// ���
	private String DETAIL;			// ����
	private String SUM;				// ����ݾ�
	private String ETC;				// ��Ÿ
	public String getEXPENSE_DATE() {
		return EXPENSE_DATE;
	}
	public void setEXPENSE_DATE(String eXPENSE_DATE) {
		EXPENSE_DATE = eXPENSE_DATE;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public String getEMPLOYEE() {
		return EMPLOYEE;
	}
	public void setEMPLOYEE(String eMPLOYEE) {
		EMPLOYEE = eMPLOYEE;
	}
	public String getMETHOD() {
		return METHOD;
	}
	public void setMETHOD(String mETHOD) {
		METHOD = mETHOD;
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
		return "ExpenseVO [EXPENSE_DATE=" + EXPENSE_DATE + ", ACCOUNT=" + ACCOUNT + ", EMPLOYEE=" + EMPLOYEE
				+ ", METHOD=" + METHOD + ", ITEM=" + ITEM + ", DETAIL=" + DETAIL + ", SUM=" + SUM + ", ETC=" + ETC
				+ "]";
	}
	
	
	
}
