<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<style>
	button{
		width:300px;
		height:180px;
	}
	.btn{
	width:400px;
	height:180px;
	border: 1px solid black;
	text-decoration: none;
	font-size:5rem;
	font-weight: bold;
	color: navy ;
	padding:50px 80px 50px 80px;
	margin:20px;
	display:inline-block;
	border-radius: 10px;
	font-family:  "Times New Roman", "맑은 고딕", serif;
	background-color: #ddd;
    }
</style>
	<div class="row" style="margin-top: 100px">
		<div class="col-lg-2"></div>
		<div class="col-lg-4" align="center">
			<a class="btn" href="/input">입 력</a>
		</div>
		<div class="col-lg-4" align="center">
			<a class="btn" id="daily" href="">조 회</a>
		</div>
	</div>
	<div class="row"></div>
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-4" align="center">
			<a class="btn" href="">계 좌</a>
		</div>
		<div class="col-lg-4" align="center">
			<a class="btn" href="">거래처</a>
		</div>
	</div>
<script>
	var date=new Date();
	var yy=date.getFullYear();
	var mm=date.getMonth()+1;
	if(mm<10){
		mm = '0'+mm;
	}
	var dd=date.getDate();
	if(dd<10){
		dd = '0'+dd;
	}
	document.getElementById("daily").href="/inquiry/daily?date="+yy+"-"+mm+"-"+dd;
</script>
