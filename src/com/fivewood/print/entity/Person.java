package com.fivewood.print.entity;


import java.util.*;

public class Person {
	private Long id;
	private int age;
	private String firstname;
	private String lastname;
	
	private Set events = new HashSet();
	
	private Set emailAddresses = new HashSet();
	
	

	public Set getEmailAddresses() {
		return emailAddresses;
	}

	public void setEmailAddresses(Set emailAddresses) {
		this.emailAddresses = emailAddresses;
	}

	public Set getEvents() {
		return events;
	}

	public void setEvents(Set events) {
		this.events = events;
	}

	public Person() {
	}

	public Long getId() {
		return id;
	}

	private void setId(Long id) {
		this.id = id;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	// Accessor methods for all properties, private setter for 'id'
	
}