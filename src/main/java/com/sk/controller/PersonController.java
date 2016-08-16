package com.sk.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sk.model.Person;
import com.sk.services.PersonService;




@Controller
@RequestMapping("/person")
public class PersonController {
	
		@Autowired
	    PersonService personService;
	
		
		@RequestMapping(method = RequestMethod.GET)
		public String printWelcome(Map<String,Object> model) {
	      
	        
		    Person person=new Person();
	        model.put("personForm",person);
	        model.put("listPerson", personService.getPersonList());

	     
			return "hello";
		}
		
	

		 @RequestMapping(value = "/delete", method = RequestMethod.GET)
		    public String delete(@RequestParam String id) {
		        personService.deletePerson(id);	
		        
		        
		        return "redirect:/person";
		        
		    }
		 
		 @RequestMapping(value = "/update", method = RequestMethod.POST)
		    public String update(@ModelAttribute("personForm") Person person) {	 
			 personService.updatePerson(person);	        
		        return "redirect:/person";		        
		    }
		 
		
		 
		 @RequestMapping(method = RequestMethod.POST)
		    public String save(@ModelAttribute("personForm") Person person,Model model){
			 	personService.insertData(person);
		        return "redirect:person";
		    }
		 

		  @RequestMapping(value = "/edit")
		    public ModelAndView editPerson(@RequestParam String id){
			  	ModelAndView model = new ModelAndView("edit");
		        Person person = personService.getPerson(id);
		        model.addObject("listPerson", personService.getPersonList());
		        model.addObject("personForm", person);
		        return model;
		    }
		  
		  
	


}
