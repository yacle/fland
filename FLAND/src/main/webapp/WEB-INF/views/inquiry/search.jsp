<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table{
	text-align: center;
}
input, select{
	width:95%;
	border: 1px solid LightGray;
	border-radius: 4px;
	margin: 0px 0;
	box-sizing: border-box;
	height: 39px;
	font-size: 15px;
	text-align: center;
}
select{
	text-align-last:center;
}
</style>
<nav class="navbar navbar-inverse">
	<ul class="nav navbar-nav">
		<li><a href="">일별</a></li>
		<li><a href="/inquiry/monthly?month=2018-01">월별</a></li>
		<li><a href="/inquiry/yearly?year=2018">연별</a></li>
		<li class="active"><a href="/inquiry/search">조건검색</a></li>
	</ul>
</nav>

<div align="center">
<form action="/inquiry/search" method="POST">
<table width="70%">
	<tr>
		<td height="50px" width="10%">구분</td>
		<td colspan="4">조회기간</td>
		<td>조회구분</td>
		<td>내용</td>
		<td></td>
	</tr>
	<tr>
		<td>
			<select id="division">
				<option></option>
				<option>수입</option>
				<option>지출</option>
			</select>
		</td>
		<td width="12%">
			<input type="date" id="startDate">
		</td>
		<td style="text-align:left">부터</td>
		<td width="12%">
			<input type="date" id="endDate">
		</td>
		<td style="text-align:left">까지</td>
		<td width="15%">
			<select id="item">
				<option></option>
				<option value="1">내용</option>
				<option value="2">비고</option>
				<option value="3">금액</option>
			</select>
		</td>
		<td><input type="search" id="detail"></td>
		<td><button type="button" id="btn">조회</button></td>
	</tr>
</table>
</form>
</div>
<div id="div1"></div>
<script>
$("#btn").click(function(){
	var div = $("#division").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var item = $("#item").val();
	var detail = $("#detail").val();
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/inquiry/search",
		"data":{
			"div": div,
			"startDate": startDate,
			"endDate": endDate,
			"item": item,
			"detail": detail
		},
		success:function(data){
			console.log(data);
		}
//		var str="";
//		$(data).each(function(){
//				str +="<div class='row'>"
//							+"<div class='col-lg-1'>"+this.tran_date+"</div>"
//							+"<div class='col-lg-2'>"+this.account+"</div>"
//							+"<div class='col-lg-1'>"+this.item+"</div>"
//							+"<div class='col-lg-1'>"+this.client+"</div>"
//							+"<div class='col-lg-4'>"+this.detail+"</div>"
//							+"<div class='col-lg-1'>"+this.sum+"</div>"
//							+"<div class='col-lg-2'>"+this.etc+"</div>"
//					+"</div><hr/>"
//			})
//		$("#div1").html(str);
	})
})
</script>