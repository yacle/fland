<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#ordertbl, .table2{
	border-collapse: separate;
	border-spacing: 10px;
	width: 100%;
	text-align: center;
}
.border{
	border: solid 1px black;
	text-align: center;
	padding: 5px;
}
#datatbl{
	width: 100%;
	text-align: center;
}
input{
	text-align: right;
	box-sizing: border-box;
	text-align:center;
	border: none;
}
td, th{
	text-align: center;
	font-weight: bold;
	padding: 10px;
}
</style>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/">HOME</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/order/new">발주서</a></li>
			<li><a href="/order/dye">염색의뢰서</a></li>
			<li><a href="/order/knit">편직의뢰서</a></li>
			<li class="active"><a href="#">원사발주서</a></li>
		</ul>
	</div>
</nav>
<div class="row">
	<div class="col-lg-3">
		<form action="/order/threadSearch">
			<input type="hidden" name="index" id="index" value="0">
			<table class="table2" style="margin-top:50px;">
				<tr>
					<td width="5%"></td>
					<td width="25%">Order NO</td>
					<td width="50%"><input type="text" class="form-control" name="orderno" id="orderno" value="${orderno }"></td>
					<td width="20%"><button type="submit" class="btn btn-info" id="btn">Search</button></td>
				</tr>
				<c:forEach var="map" items="${volist }" varStatus="status">
					<tr>
						<td colspan="4">
							<button type="button" size="5" class="btn knitBtn" value="${status.index}">원사발주서 ${map.threadno}</button>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<button type="button" size="5" class="btn" id="knitNew">NEW</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-lg-5" align="center">
		<h3>원사발주서</h3>
		<table id="ordertbl">
			<tr>
				<td>거래처</td>
				<td colspan="3"><input type="text" id="thread_com"  class="form-control" placeholder="거래처"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td colspan="3"><input type="text" id="delivery" class="form-control" placeholder="출고처"></td>
			</tr>
		</table><hr/>
		<table  class="table2">
			<thead>
				<tr>
					<th colspan="2">편직 LOSS(%)</th>
					<th><input type="number" class="form-control" id="knitloss" placeholder="편직로스" required></th>
					<th></th>
				</tr>
				<tr>
					<th style="width:30%;">원사명</th>
					<th style="width:20%;">편직수량</th>
					<th style="width:20%;">원사수량</th>
					<th style="width:30%;">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="map" items="${list }">
					<c:forEach var="i" begin="0" end="${map.thread.size()-1 }" step="1">
						<tr>
							<td>${map.thread[i] }</td>
							<td><input type="number" class="weight" value="${map.weight[i] }"></td>
							<td><input type="number" class="threadweight" value=""></td>
							<td><input type="text" class="threadetc" value=""></td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-lg-4" align="center">
		<h3>편직 DATA</h3>
		<table class="datatbl" style="width: 90%;">
			<tr class="border">
				<th class="border" style="width:20%;">편직의뢰서 NO</th>
				<th class="border" style="width:30%;">원사명</th>
				<th class="border" style="width:30%;">편직수량(KG)</th>
				<th class="border" style="width:20%;">비율(%)</th>
			</tr>
			<c:forEach var="map" items="${list }">
				<c:forEach var="i" begin="0" end="${map.thread.size()-1 }" step="1">
					<tr class="border">
						<td class="border">${map.knitno}</td>
						<td class="border">${map.thread[i] }</td>
						<td class="border">${map.weight[i] }</td>
						<td class="border">${map.ratio[i] }</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="border"></td>
					<td class="border"><b>총계</b></td>
					<td class="border" colspan="2"><b>${map.perkgtotal }KG</b></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<script>
$(document).ready(function(){
	if($("#orderno").val()==""){
		window.alert("Order No를 입력해주세요");
	}
});
$("#knitloss").change(function(){
	var loss = $(this).val()/100;
	var arr = document.getElementsByClassName("weight");
	var weight = document.getElementsByClassName("threadweight");
	for(var i=0; i<arr.length; i++){
		weight[i].value = Math.round(arr[i].value*(loss+1.0));
	}
})
</script>