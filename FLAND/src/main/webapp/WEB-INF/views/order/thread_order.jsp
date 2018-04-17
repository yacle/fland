<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#ordertbl, .table2{
	border-collapse: separate;
	border-spacing: 10px;
	width:100%;
}
.datatbl{
	border: 1px solid black;
	padding: 5px;
	font-size: 13px;
}
input{
	text-align: right;
	box-sizing: border-box;
	text-align:center;
	border: none;
}
table, th, td, tr{
	text-align:center;
	height: 35x;
	padding: 5px;
}
#table3{
	border: 1px solid black;
	width: 100%;
}
</style>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Admin</a>
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
	<div class="col-lg-4" align="center" style="background-color: #F0F8FF">
		<h3>편직 DATA</h3>
		<table class="datatbl">
			<tr class="datatbl">
				<th class="datatbl" width=10%>NO</th>
				<th class="datatbl" width=50%>원사명</th>
				<th class="datatbl" width=20%>편직수량(KG)</th>
				<th class="datatbl" width=20%>비율(%)</th>
			</tr>
			<c:forEach var="map" items="${list }">
				<c:forEach var="i" begin="0" end="${map.thread.size()-1 }" step="1">
					<tr class="datatbl">
						<td class="datatbl">${map.knitno}</td>
						<td class="datatbl">${map.thread[i] }</td>
						<td class="datatbl">${map.weight[i] }</td>
						<td class="datatbl">${map.ratio[i] }</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="datatbl"></td>
					<td class="datatbl"><b>총계</b></td>
					<td class="datatbl" colspan="2"><b>${map.perkgtotal }KG</b></td>
				</tr>
			</c:forEach>
		</table><hr/>
		<form action="/order/threadSearch">
			<input type="hidden" name="threadno"	id="threadno" value="${map.threadno!=null ? map.threadno : '0' }">
			<input type="hidden" name="index" id="index" value="0">
			<table class="table2" style="margin-top:50px;">
				<tr>
					<td width="5%"></td>
					<td width="25%">Order NO</td>
					<td width="50%"><input type="text" class="form-control" name="orderno" id="orderno" value="${orderno }" required></td>
					<td width="20%"><button type="submit" class="btn btn-info" id="threadSearch">Search</button></td>
				</tr>
				<c:forEach var="map" items="${volist }" varStatus="status">
					<tr>
						<td colspan="4">
							<button type="button" size="5" class="btn threadBtn" value="${status.index}">원사발주서 ${map.threadno}</button>
							<button type="button" size="5" class="btn btn-danger btn-xs delBtn" value="${map.threadno}">삭제</button>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<button type="button" size="5" class="btn" id="threadNew">NEW</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-lg-7" align="center">
		<h3>[원사발주서 ${map.threadno}]</h3>
		<table id="ordertbl">
			<tr>
				<td>거래처</td>
				<td colspan="2"><input type="text" id="thread_com"  class="form-control" value=" ${map.company}" placeholder="거래처" required></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td colspan="2"><input type="text" id="delivery" class="form-control" value=" ${map.delivery}" placeholder="출고처" required></td>
			</tr>
		</table><hr/>
		<table  id="table3" border="1">
			<tr>
				<th colspan="2">편직 LOSS(%)</th>
				<th colspan="2"><input type="number" class="form-control" id="knitloss" value="${map.knitloss}" placeholder="편직로스" required></th>
				<th><button type="button" class="btn btn-default" id="count">계산</button></th>
			</tr>
			<tr>
				<th width="40%">원사명</th>
				<th width="20%">편직수량</th>
				<th width="10%">원사수량</th>
				<th width="10%">B/T No</th>
				<th width="20%">비고</th>
			</tr>
			<c:forEach var="map" items="${list }">
				<c:forEach var="i" begin="0" end="${map.thread.size()-1 }" step="1">
					<tr>
						<td><input type="text" class="thread" value="${map.thread[i] }"></td>
						<td><input type="number" class="weight" value="${map.weight[i] }"></td>
						<td><input type="number" class="threadweight" value=""></td>
						<td><input type="text" class="btno" value=""></td>
						<td><input type="text" class="threadetc" value=""></td>
					</tr>
				</c:forEach>
			</c:forEach>
		</table><hr/>
		<button type="button" class="btn btn-primary" id="threadSave">저장</button>
	</div>
</div>
<script>
function loss(){
	var loss = $("#knitloss").val()/100;
	var arr = document.getElementsByClassName("weight");
	var weight = document.getElementsByClassName("threadweight");
	for(var i=0; i<arr.length; i++){
		weight[i].value = Math.round(arr[i].value*(loss+1.0));
	}
}
$(document).ready(function(){
	if($("#orderno").val()==""){
		window.alert("Order No를 입력해주세요");
	}else{
		loss();
	}
});
$("#count").click(function(){
	loss();
})
// 편직의뢰서 삭제
$(".delBtn").click(function(){
	var threadno = $(this).val();
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/threadDel",
		"data":{
			"threadno":threadno
		},
		success:function(){
			$("#threadSearch").click();
		}
	})
})
$("#threadSave").click(function(){
	var threadweight = document.getElementsByClassName("threadweight");
	var btno = document.getElementsByClassName("btno");
	var threadetc = document.getElementsByClassName("threadetc");
	var threadweight_list=threadweight[0].value;
	var btno_list=btno[0].value;
	var threadetc_list=threadetc[0].value;
	for(var i=1; i<threadweight.length; i++){
		threadweight_list += "&&"+threadweight[i].value;
		btno_list += btno[i].value;
		threadetc_list += threadetc[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/threadAdd",
		"data":{
			"threadno":$("#threadno").val(),
			"company":$("#thread_com").val(),
			"delivery":$("#delivery").val(),
			"knitloss":$("#knitloss").val(),
			"threadweight":threadweight_list,
			"btno": btno_list,
			"threadetc":threadetc_list,
			"orderno":$("#orderno").val()
		},
		success:function(obj){
			window.alert(obj);
			$("#threadSearch").click();
		}
	})
})
$(".threadBtn").click(function(){
	var index = $(this).val();
	$("#index").val(index);
	$("#threadSearch").click();
})

$("#threadNew").click(function(){
	$("#thread_com").val("");
	$("#delivery").val("");
	$("#knitloss").val("");
	loss();
	$("#threadno").val(0);
})

</script>