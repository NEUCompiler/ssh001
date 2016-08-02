package com.neu.deposit;

/**
 * Deposit entity. @author MyEclipse Persistence Tools
 */
public class Deposit {
	private int key;
	private float rate;
	private float interest;
	private int time;
	private int sign;
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public float getInterest() {
		return interest;
	}
	public void setInterest(float interest) {
		this.interest = interest;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getSign() {
		return sign;
	}
	public void setSign(int sign) {
		this.sign = sign;
	}
	
	

}
