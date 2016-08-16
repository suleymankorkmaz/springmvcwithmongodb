package com.sk.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sk.dao.PersonDao;
import com.sk.model.Person;


public class PersonServiceImpl implements PersonService {

	@Autowired
    PersonDao personDao;

	@Override
	public List<Person> getPersonList() {
		
		return personDao.getPersonList();
	}

	@Override
	public void deletePerson(String id) {
	personDao.delete(id);
		
	}

	@Override
	public void insertData(Person person) {
		 personDao.insertData(person);
	}

	@Override
	public void updatePerson(Person person) {
		personDao.updatePerson(person);
		
	}

	@Override
	public Person getPerson(String id) {
		return personDao.getPerson(id);
	}




	
	


}
