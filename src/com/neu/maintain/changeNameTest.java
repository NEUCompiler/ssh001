package com.neu.maintain;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neu.register1.Client;
import com.opensymphony.xwork2.ActionContext;

public class changeNameTest {
	private String changevariable;
	
	
	HttpServletRequest request=ServletActionContext.getRequest();	

	public String getChangevariable() {
		return changevariable;
	}
	public void setChangevariable(String changevariable) {
		this.changevariable = changevariable;
	}




	public String change(){
		
		ApplicationContext c2 = new ClassPathXmlApplicationContext("applicationContext.xml");  
		SessionFactory sf2 = (SessionFactory) c2.getBean("sessionFactory");
		Session session2 = sf2.openSession();

		ApplicationContext c = new ClassPathXmlApplicationContext("applicationContext.xml");  
		SessionFactory sf = (SessionFactory) c.getBean("sessionFactory");
		Session session = sf.openSession();		

		String user = ActionContext.getContext().getSession().get("user")+"";
//		String user = String.valueOf(ActionContext.getContext().getSession().get("user")+"");
//		int password = Integer.valueOf(ActionContext.getContext().getSession().get("password")+"");

		Query query =  session2.createQuery("from Client WHERE username = ?");
		query.setString(0, user+"");
		System.out.println(user);    
		System.out.println(changevariable);
		java.util.List client;
		try{
			client = query.list();
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	
			
		Query query1 =  session2.createQuery("from Client WHERE username = ?");
		query1.setString(0, changevariable+"");
		System.out.println(changevariable);    
		System.out.println(changevariable);
		java.util.List client1;
		try{
			client1 = query1.list();
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
		
		
    	Iterator iter = client.iterator();
    	
    	if(client1.isEmpty()){
        	if(client.isEmpty()){
        		return "fail";
        	}else{
        			Client cn = (Client)iter.next();
    				session2.beginTransaction();
    				cn.setUsername(changevariable);
    				session2.update(cn);	
    				
    				ActionContext.getContext().getSession().put("user", changevariable);
    				
    				session2.getTransaction().commit();							
    	    		return "success";
    	    	}
    	}
    	else{
			request.setAttribute("info", "此用户名以及存在");
			return "fail";
    		
    	}
    }
}
