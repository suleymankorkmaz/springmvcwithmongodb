package com.sk.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import com.sk.model.Person;



@Repository
public class PersonDaoImp implements PersonDao{
	
		@Autowired
		MongoTemplate mongoTemplate;

		
	@Override
	public List<Person> getPersonList() {
		List<Person> personList=mongoTemplate.findAll(Person.class,"contactdb");
	        return personList;
	}


	@Override
	public void delete(String id) {
		
		 for(Person person:getPersonList()){
	            if(person.getPersonId().equals(id)) {
	                mongoTemplate.remove(person,"contactdb");

	                break;
	            }
	        }
		
	}


	@Override
	public void insertData(Person person) {
		
	        if(!mongoTemplate.collectionExists(Person.class)){
	            mongoTemplate.createCollection(Person.class);
	        }
	        mongoTemplate.insert(person,"contactdb");

	}


	
	@Override
	public void updatePerson(Person person) {
		
			mongoTemplate.save(person,"contactdb");
		
		
	}


	@Override
	public Person getPerson(String id) {
		 Person customer=null;
		for(Person person:getPersonList()){
            if(person.getPersonId().equals(id)) {
            	 	Query query=new Query(Criteria.where("_id").is(person.getPersonId()));
            	 	customer=mongoTemplate.findOne(query,Person.class,"contactdb");
            	 	customer.setName(person.getName());
            	 	customer.setSurname(person.getSurname());
            	 	customer.setEmail(person.getEmail());
            	 	customer.setPhoneNumber(person.getPhoneNumber());
                    mongoTemplate.save(customer,"contactdb");
                    return customer;
            }
            
        }
		return customer;
	}
	
}
