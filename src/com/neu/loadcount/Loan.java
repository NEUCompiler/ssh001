package com.neu.loadcount;

/**
 * Loan entity. @author MyEclipse Persistence Tools
 */
public class Loan {
	private String key;
	private String type;
	private int time;
	private float rate;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}

}
