<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
<!-- 	<input type = "button" data-target="#add-employee" data-toggle="modal" class="btn btn-success" value = "Add New"/> -->
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Customer</h3>
				<div class="" id="main-res-msg"	style="margin-top: 5px; display: none;">
					<strong></strong>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="customerTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Branch</th>
							<th>Address</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${customer}" var="cust">
							<tr>
								<td><a class="btn" href='<spring:url value="/singleCustomer/${cust.user.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger"
									href='<spring:url value="/deleteCustomer/${cust.user.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> ${emp.user.id}</td>
								<td><a class="btn" href='<spring:url value="/singleCustomer/${cust.user.id}.do" />'>${emp.user.name}</a></td>
								<td><a class="btn" href='<spring:url value="/singleCustomer/${cust.user.id}.do" />'>${emp.user.mobile}</a></td>
								<td><a class="btn" href='<spring:url value="/singleCustomer/${cust.user.id}.do" />'>${emp.branch.name}</a></td>
								<td><a class="btn" href='<spring:url value="/singleCustomer/${cust.user.id}.do" />'>${emp.user.address}</a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
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

  <script>
  	$(document).ready(function(){  		
    	 $('#customerTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
  	});
  	</script>