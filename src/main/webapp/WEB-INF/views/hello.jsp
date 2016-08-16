<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>

    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>


<title>Contact List Screen</title>

<nav class="navbar navbar-default">
 <p style ="font-size:18px; padding-top: 15px; text-align:center "> Contact List </p>
</nav>
	<div align="center">


<script type ="text/javascript">


$(document).ready(function(){
	

	$("#add-number").keypress(function (e) {
		  
	     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {  
	         return false;
	              
	    }
	   });
	
	$("#add-name,#add-surname").keypress(function (e) {
		  
		 if(e.which < 97|| e.which > 122 )  {  
	               return false;
	    }
	   });
	
	
	
	function validateEmail(email) {
	    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    if (filter.test(email)) {
	        return true;
	    }
	    else {
	        return false;
	    }
	}
	
	
	$("#hellojs").submit(function() {
		
			
			
		var name = $("#add-name").val();
		var surname = $("#add-surname").val();
		var email = $("#add-email").val();
		var number = $("#add-number").val();
		
		if(name== ""  || surname==""){
			event.preventDefault();
			
			swal(
					
					  'Error!',
					  'Please fill in all areas!',
					  'error'
					
					)
			
		}
		
		else if(email==""|| number==""){
			
	event.preventDefault();
			
			swal(
					
					  'Error!',
					  'Please fill in all areas!',
					  'error'
					
					)
			
		}
		else if(validateEmail(email) == false) {
			  
			event.preventDefault();
			
			swal(
					
					  'Error!',
					  'Please enter valid email address',
					  'error'
					
					)
		}
		else{
		swal(
					  'Good job!',
					  'You added a contact!',
					  'success'
				)
				    
			event.preventDefault();
		
		setTimeout( function () { 
        hellojs.submit();
    }, 2000);}
		
	
})


	
	yes_js_login = function(id) {
       
		
		swal({
			  title: "Are you sure?",
			  text: "You will not be able to recover it!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "Yes, delete it!",
			  cancelButtonText: "No, cancel!",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm) {
			  if (isConfirm) {
			    swal("Deleted!", "Successfully deleted.", "success");
			    setTimeout(function () {
			    	window.location='person/delete?id='+id;
			     }, 2000); 
			    
			  } else {
			    swal("Cancelled", "Successfully cancelled", "error");
			    setTimeout(function () {
				    window.location.href = "person";
			     }, 2000); 
			  }
			});

			
			return false;
			
			
   }


});


</script>


</head>
<body>

<div class="container" style="border:1px solid#000; padding-bottom: 20px;">
<div  align = center style="padding-top: 20px;">


	    <form:form action="person" id="hellojs" method="post" commandName="personForm" class="form-inline" >
                    	
	
	                    <div class="form-group"><form:input class="form-control" id="add-name" type="text" placeholder="Name" path="name" /></div>     
	                    <div class="form-group"><form:input class="form-control" id="add-surname" type="text"  placeholder=" Surname" path="surname"></form:input></div>
	                    <div class="form-group"><form:input class="form-control" id="add-email" type="text" placeholder=" Email" path="email"></form:input></div>
	                    <div class="form-group"><form:input class="form-control" id="add-number" type="text" placeholder="Phone Number" path="phoneNumber"></form:input></div>
	                    <input class="btn btn-default" type="submit" value="Add"  >
                    
                </form:form>
                 


    <c:if test="${!empty listPerson}">
        <table class="table table-bordered">

	            <tr>
	                <th>First Name</th>
	                <th>Surname</th>
	                <th>Email</th>
	                <th>Phone Number</th>
	                <th></th>
	                <th></th>
	            </tr>
            <c:forEach items="${listPerson}" var="person" >
                <tr id="${person.personId}">
             
                    <td id="Name"  >${person.name}</td>
                    <td id="Surname">${person.surname}</td>
                    <td id="Address">${person.email}</td>
                    <td id="PhoneNumber">${person.phoneNumber}</td>
                    <td>
						<a href="#" name=${person.personId} class="delete" onclick="return yes_js_login('${person.personId}');" >Delete</a> 
					</td>
					 <td>
					<a href="person/edit?id=${person.personId}">Edit</a>
				
					</td>
                </tr>

            </c:forEach>
            <tr>
            </tr>
        </table>
    </c:if>
</div>
   

          
            
</body>
</html>