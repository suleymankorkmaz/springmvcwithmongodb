package com.sk.dao;

import java.util.List;

import com.sk.model.Person;



public interface PersonDao {

	
    public List<Person> getPersonList();
    public void delete(String id);
    public void insertData(Person person);
    public void updatePerson(Person person);
    public Person getPerson(String id);

}
