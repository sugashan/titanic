<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../../../layouts/taglib.jsp" %>
<%@ include file="../../common/commonModals.jsp" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-employee" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-success" value = "Add New"/>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Employee</h3>
       		 	 <c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="employeeTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Role</th>
							<th>Branch</th>
							<th>Address</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${employee}" var="emp">
							<tr>
								<td><a class="btn" href='<spring:url value="employee-detail/${emp.user.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteEmployee/${emp.user.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> <c:out value="${emp.user.userName}"/></td>
								<td><a class="btn" href='<spring:url value="employee-detail/${emp.user.id}.do" />'><c:out value="${emp.user.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="employee-detail/${emp.user.id}.do" />'><c:out value="${emp.user.mobile}"/></a></td>
								<td><a class="btn" href='<spring:url value="employee-detail/${emp.user.id}.do" />'><c:out value="${emp.user.role.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="employee-detail/${emp.user.id}.do" />'><c:out value="${emp.branch.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="employee-detail/${emp.user.id}.do" />'><c:out value="${emp.user.address}"/></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Role</th>
							<th>Branch</th>
							<th>Address</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</div>

<!-- Employee Add modal -->
  <div class="modal fade" id="add-employee" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      	<div class="modal-header">
        	<h4 class="modal-title">Add New Employee</h4>
     	 </div>
        <div class="modal-body">
    		 <form:form modelAttribute="newEmployee" enctype="application/x-www-form-urlencoded" method="post" >
				  <div class="row">
				    <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Name :</label>
				    	 <form:input path="user.name" cssClass="form-control"/>
				    	  <span style="color:red;"><form:errors path="user.name"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Role :</label>
				     	<form:select path="user.roleId" cssClass="form-control" >
				     	   <c:forEach items="${roles}" var ="role">
				     	   		<form:option label="${role.name}" value="${role.id}"/>
				     	   </c:forEach>
						</form:select>
						 <span style="color:red;"><form:errors path="user.roleId"/></span>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">User Name :</label>
				    	 <form:input path="user.userName" cssClass="form-control" disabled="true"/>
				    	 <span style="color:red;"><form:errors path="user.userName"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Mobile :</label>
				     	<form:input path="user.mobile" cssClass="form-control" type="number"/>
				     	<span style="color:red;"><form:errors path="user.mobile"/></span>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">NIC Number :</label>
				     <form:input path="nic" cssClass="form-control" />
				      <span style="color:red;"><form:errors path="nic"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Email :</label>
				     	<form:input path="user.email" cssClass="form-control" />
				     	   <span style="color:red;"><form:errors path="user.email"/></span>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Contact :</label>
				     <form:input path="contact" cssClass="form-control" type="number" />
				     <span style="color:red;"><form:errors path="contact"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Date of Birth :</label>
	 			      <form:input path = "dob" type = "date" cssClass="form-control"/> 
	 			       <span style="color:red;"><form:errors path="dob"/></span>
	 			    </div> 
				  </div> 
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Address :</label>
				  		<form:textarea path = "user.address" cssClass="form-control" />
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	<div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Password :</label>
				       <form:password path="user.password" cssClass="form-control" id="empPassword" />
				       <span style="color:red;"><form:errors path="user.password"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Confirm Password :</label>
				     	<input class="form-control" id="empConfirmPassword" data-rule-equalTo="#empPassword" type="text" placeholder="Confirm Password"/>
				   		<span id="confirmPasswordError" style="color:red;"></span>
				    </div>
		 		 </div>
				  
			  	<br/>
			     <div class = "row">
				 	 <div class="form-group col-md-4">
			     	    <button type="button" class="btn btn-lg btn-block btn-warning" data-dismiss="modal">
			     	     <i class="fa fa-close"></i> Cancel</button>
				 	  </div>
				    	<div class="form-group col-md-4">
				     	 <button type="button" class="btn btn-lg btn-block btn-secondary" type="reset">
			     	   <i class="fa fa-repeat"></i> Reset</button>
				 	</div>
				 	<div class="form-group col-md-4">
				     	 <button type="submit" id="submitBtn" class="btn btn-lg btn-block btn-success">
				        <i class="fa fa-floppy-o"></i> Submit</button>
				  	  </div>
				 </div>
			</form:form>
        </div>
      </div>
    </div>
  </div>


  <script>
  	$(document).ready(function(){  		
    	 $('#employeeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 
    	 $("#confModalText").html("Are you want to delete this Employee?");
    	 $(".triggerRemove").click(function(e){
    		e.preventDefault();
    		 $("#confModalbtn").attr("href", $(this).attr("href")); 
    		$("#confirmModal").modal("show");
    	 });
    	 
  	});
  	
  	$('#empPassword, #empConfirmPassword').on('keyup', function () {
  	  if ($('#empPassword').val() == $('#empConfirmPassword').val()) {
  	  } else 
  		 $('#confirmPasswordError').html('Password Mis-Matching!');
  	});
  	</script>