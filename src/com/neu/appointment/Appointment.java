package com.neu.appointment;

import java.sql.Timestamp;

/**
 * Appointment entity. @author MyEclipse Persistence Tools
 */
public class Appointment{
	private String appointid;
	private String clientid;
	private String amount;
	private String date;
	private String websiteid;

	
	public String getAppointid() {
		return appointid;
	}
	public void setAppointid(String appointid) {
		this.appointid = appointid;
	}


	public String getClientid() {
		return clientid;
	}
	public void setClientid(String clientid) {
		this.clientid = clientid;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWebsiteid() {
		return websiteid;
	}
	public void setWebsiteid(String websiteid) {
		this.websiteid = websiteid;
	}
	
	
}
