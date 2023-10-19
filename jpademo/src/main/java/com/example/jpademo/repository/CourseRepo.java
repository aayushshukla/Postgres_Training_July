package com.example.jpademo.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.jpademo.entity.Course;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceUnit;
@Repository
public class CourseRepo  {
 
	
	  @Autowired EntityManager em;
	 
	 EntityManagerFactory emf;
	/*
	 * EntityManagerFactory emf; public CourseRepo() { emf =
	 * Persistence.createEntityManagerFactory(CourseRepo.class.getName());
	 */
//}
	
	 @PersistenceUnit 
	 public void setEntityManagerFactory(EntityManagerFactory
	 emf) { 
		 this.emf= emf; 
		 }
	 
   public Course findById(int id)
   {
	 // EntityManager em = emf.createEntityManager();
	  return  em.find(Course.class,id);
	  
	  
   }
   
   public String deleteById(int id)
   {
	 EntityManager em = emf.createEntityManager();
	   em.getTransaction().begin(); 
	   Course c = em.find(Course.class,id);
	   System.out.println(c.toString());
	   em.remove(c);
	  
	  em.getTransaction().commit();
	   em.close();
	   return "data is delted";
		 
   }
   
   public Course save(Course c)
   {
	   EntityManager em = emf.createEntityManager();
	   em.getTransaction().begin(); 
		   em.persist(c);
		   em.getTransaction().commit(); 
		   em.close();
	   return c;
   }
	
}
