package com.example.jpademo;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.jpademo.entity.Course;
import com.example.jpademo.repository.CourseRepo;

@SpringBootApplication
public class JpademoApplication implements CommandLineRunner  {

	
	 @Autowired 
	 CourseRepo courseRepo;
	 
	Logger  logger = Logger.getLogger(JpademoApplication.class.getName());
	public static void main(String[] args) {
		SpringApplication.run(JpademoApplication.class, args);
		//CourseRepo courseRepo = new CourseRepo();
		//Course  c=courseRepo.findById(1);
		//System.out.println(c);
		
	}

	
	  @Override public void run(String... args) throws Exception { // TODO
	    //Auto-generated method stub
	   Course c= courseRepo.findById(2);
	    logger.info(c.toString()); 
	  try {
	   String s = courseRepo.deleteById(1);
	   logger.info(s);
	  }
	  catch (Exception e) {
	     logger.log(Level.SEVERE, "exceptio "+e);
	}
		  
		  //courseRepo.save(new Course(java with micro"));
	  }
	 
   
}
