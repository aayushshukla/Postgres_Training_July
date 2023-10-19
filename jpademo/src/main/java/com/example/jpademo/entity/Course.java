package com.example.jpademo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Course {
	@Id
    @GeneratedValue
	private int cid;
	private String cname;
	
	public Course() {
		// TODO Auto-generated constructor stub
	}
	public Course(String cname) {
		// TODO Auto-generated constructor stub
		this.cname =cname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public int getCid() {
		return cid;
	}
	@Override
	public String toString() {
		return "Course [cid=" + cid + ", cname=" + cname + "]";
	}
	
}
