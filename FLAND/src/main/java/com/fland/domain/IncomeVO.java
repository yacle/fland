package com.fland.domain;

public class IncomeVO {
	private String INCOME_DATE;	// �Ա�����
	private String ACCOUNT;		// ���¸�
	private String COMPANY;		// �ŷ�ó��
	private String ITEM;		// ���
	private String DETAIL;		// ����
	private String SUM;			// �Աݱݾ�
	private String ETC;			// ��Ÿ
	
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
