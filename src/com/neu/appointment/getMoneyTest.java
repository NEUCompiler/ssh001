package com.neu.appointment;

import java.sql.Date;
import java.util.Iterator;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neu.register1.Client;
import com.opensymphony.xwork2.ActionContext;

public class getMoneyTest {

	
private String money;
private String date;
private String website;
	



	public String getMoney() {
	return money;
}




public void setMoney(String money) {
	this.money = money;
}




public String getDate() {
	return date;
}




public void setDate(String date) {
	this.date = date;
}




public String getWebsite() {
	return website;
}




public void setWebsite(String website) {
	this.website = website;
}




	public String GetMoney(){
		ApplicationContext c1 = new ClassPathXmlApplicationContext("applicationContext.xml");  
		SessionFactory sf1 = (SessionFactory) c1.getBean("sessionFactory");
		Session session1 = sf1.openSession();
		
		String user = ActionContext.getContext().getSession().get("user")+"";
		
		Query query =  session1.createQuery("from Client WHERE username = ?");
		query.setString(0, user+"");
		java.util.List client;
		try{
			client = query.list();
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	
    	Iterator iter = client.iterator();
		
	    Appointment s= new Appointment();
	    if(client.isEmpty()){
    		return "fail";
    	}else{
    		Client cn = (Client)iter.next();
    		String str = UUID.randomUUID().toString();
    	   /* s.setAppointid(str);			
			s.setClientid(cn.getClientid());
			s.setAmount(money);
			s.setWebsiteid(website);
			s.setDate(date);*/
			
			String sql = "insert into hibernate.appointment (appointid, clientid, amount, date, websiteid) values (?,?,?,str_to_date(?, '%m/%d/%Y'),?)";

			//	s=getCurrentSession();
  			    Query q=session1.createSQLQuery(sql);
				q.setString(0,str);
				q.setString(1,cn.getClientid());
				q.setString(2,money);
				q.setString(3,date);
				q.setString(4,website);
			    session1.beginTransaction();
				q.executeUpdate();
				session1.getTransaction().commit();	
				return "success"; 
			/*
			session1.beginTransaction();
			session1.save(s);
			session1.getTransaction().commit();
			session1.close();
			sf1.close(); 
			return "success";  */
    	}
	}
}
