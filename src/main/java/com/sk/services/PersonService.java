package com.sk.services;

import java.util.List;

import com.sk.model.Person;



public interface PersonService {

	// List<Person> getPersonList();
	
	  
    public List<Person> getPersonList();
    public void deletePerson(String id);
    public void insertData(Person person);
    public void updatePerson(Person person);
    public Person getPerson(String id);
    

}
