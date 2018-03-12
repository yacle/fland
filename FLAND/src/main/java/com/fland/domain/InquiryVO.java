package com.fland.domain;

public class InquiryVO {
	private int NO;	
	private String div;
	private String TRAN_DATE;	
	private String ACCOUNT;	
	private String METHOD;	
	private String CLIENT;	
	private String ITEM;	
	private String DETAIL;
	private int BEGIN_BAL;
	private int SUM;	
	private String ETC;
	public int getNO() {
		return NO;
	}
	public void setNO(int nO) {
		NO = nO;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getTRAN_DATE() {
		return TRAN_DATE;
	}
	public void setTRAN_DATE(String tRAN_DATE) {
		TRAN_DATE = tRAN_DATE;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public String getMETHOD() {
		return METHOD;
	}
	public void setMETHOD(String mETHOD) {
		METHOD = mETHOD;
	}
	public String getCLIENT() {
		return CLIENT;
	}
	public void setCLIENT(String cLIENT) {
		CLIENT = cLIENT;
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
	public int getBEGIN_BAL() {
		return BEGIN_BAL;
	}
	public void setBEGIN_BAL(int bEGIN_BAL) {
		BEGIN_BAL = bEGIN_BAL;
	}
	@Override
	public String toString() {
		return "InquiryVO [NO=" + NO + ", div=" + div + ", TRAN_DATE=" + TRAN_DATE + ", ACCOUNT=" + ACCOUNT
				+ ", METHOD=" + METHOD + ", CLIENT=" + CLIENT + ", ITEM=" + ITEM + ", DETAIL=" + DETAIL + ", BEGIN_BAL="
				+ BEGIN_BAL + ", SUM=" + SUM + ", ETC=" + ETC + "]";
	}
}
