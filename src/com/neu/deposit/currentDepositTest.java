package com.neu.deposit;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;

public class currentDepositTest extends ActionSupport  {
	private int amount;
	private int exectlytime;
	private String jsonstr;
	private float interest;
	private float revenue;
	private float total;
	private float average;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getExectlytime() {
		return exectlytime;
	}
	public void setExectlytime(int exectlytime) {
		this.exectlytime = exectlytime;
	}
	public String getJsonstr() {
		return jsonstr;
	}
	public void setJsonstr(String jsonstr) {
		this.jsonstr = jsonstr;
	}
	public float getInterest() {
		return interest;
	}
	public void setInterest(float interest) {
		this.interest = interest;
	}
	public float getRevenue() {
		return revenue;
	}
	public void setRevenue(float revenue) {
		this.revenue = revenue;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getAverage() {
		return average;
	}
	public void setAverage(float average) {
		this.average = average;
	}
	public String DepositCount(){
		try{
			System.out.println("11111111111111");
			ApplicationContext c = new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			SessionFactory sf = (SessionFactory) c.getBean("sessionFactory");
			Session session = sf.openSession();
			Query query = session
					.createQuery("from com.neu.deposit.Deposit WHERE sign=1");
//			query.setInteger(0, time);
			List deposit = null;

			
			try {
				deposit = query.list();
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
			String str = "";
			if (deposit.isEmpty()) {

			} else {

				Iterator iter = deposit.iterator();
				Deposit cn = (Deposit) iter.next();

				System.out.println(cn.getRate());
				System.out.println(exectlytime);
				System.out.println(amount);
				
				interest=cn.getRate()*exectlytime*amount/12;
				revenue=interest*cn.getInterest();
				total=interest-revenue+amount;
				average=total/exectlytime;
				}
				
				try {
					str = "{data:[{interest:" + interest + "\"} {revenue:" + revenue + "\"} {total:" + total + "\"} {average:" + average + "\"}] }";
				} catch (Exception e) {
					e.printStackTrace();
				}

			jsonstr = str;

			System.out.println(jsonstr);
			}catch(Exception e){
				e.printStackTrace();
			}
			return SUCCESS;
		}
}
