package com.web.utils;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class MySessionCounter implements HttpSessionListener 
{
	static Set<String> al=new HashSet<String>();// Contains active user's id
	static int sessioncounter=0;//Initializing active session counter 
	
    public void sessionCreated(HttpSessionEvent se) //Increments session counter during session creation
    {
	
      System.out.println("sessioncreated");
      sessioncounter++;
      
    }
 
	public void sessionDestroyed(HttpSessionEvent arg0) //Decrements session counter during session destruction
	{
		      
		System.out.println("sessiondestroyed");
 		sessioncounter--;
 	
		
	}
	
	public static int getActiveSessions() {  //Returns session counter
		return sessioncounter;
	}
	
	public static void setUserDetails(String user) {//Sets active user id
		
		al.add(user);
		
	}
	
	public static String getUserDetails() {//Gets entire active user's id
				
		return al.toString();		
		
		
	}
	
	public static void removeUserDetails(String user) { //removes user's id from the set
		
		al.remove(user);
	}
 	

}