<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#body{
	 background-image: url("../resources_css/background01.jpg");
}
</style>
<!-- nav -->
<nav class="navbar navbar-inverse" style="margin-bottom:0px;">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">HOME</a></li>
			<li><a href="/intro">회사소개</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" onclick="login()">관리자페이지</a></li>
		</ul>
	</div>
</nav>
<div id="body">

</div>
 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding:35px 50px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
				<form role="form">
					<div class="form-group">
						<label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
						<input type="text" class="form-control" id="usrname" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
						<input type="text" class="form-control" id="psw" placeholder="Enter password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox" id="keep" >Remember me</label>
					</div>
					<button type="button" id="loginBtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
			</div>
		</div>
	</div>
</div>
<script>
function login(){
	$.ajax({
		"url":"/keep",
		success:function(obj){
			if(obj=="remember"){
				window.location.href="/home";			
			}else{
				$("#myModal").modal();
			}
		}
	})
}

$("#loginBtn").click(function(){
	var keep = $("#keep").is(':checked') ? 'on':'off';
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/login",
		"data":{
			"usrname":$("#usrname").val(),
			"psw":$("#psw").val(),
			"keep": keep
		},
		success:function(obj){
			if(obj=="ok"){
				window.location.href="/home";
			}else if(obj=="idmissing"){
				window.alert("ID를 확인하십시요");
			}else if(obj=="pwmissing"){
				window.alert("PassWord를 확인하십시요");
			}
		}
	})
})


</script>