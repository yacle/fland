<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	
// 염색의뢰서 테스트 의뢰  
function add_test(){
	var test_tbody = document.getElementById('test-tbody');
	var test_row = test_tbody.insertRow(test_tbody.rows.length);
	var cell1 = test_row.insertCell(0);
	var cell2 = test_row.insertCell(1);
	cell1.innerHTML = '<input type="text" size="5" class="form-control testColor" style="text-align: center; box-sizing: border-box;">';
	cell2.innerHTML = '<input type="text" class="form-control test">';
}
function del_test(){
	var test_tbody = document.getElementById('test-tbody');
	if (test_tbody.rows.length < 1) return;
	test_tbody.deleteRow( test_tbody.rows.length-1 );
}

</script>
<style>
.col-lg-4{
    text-align: center;
}
.table2, .table3{
	border-collapse: separate;
	border-spacing: 10px;
	width: 100%;
}
td, th{
	text-align: center;
	font-weight: bold;
}
input{
	text-align: right;
	box-sizing: border-box;
	text-align:center;
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
			<li><a href="/order/thread">원사발주서</a></li>
			<li class="active"><a href="#">가공의뢰서</a></li>
			<li><a href="/precost/precosting">사전원가계산서</a></li>
		</ul>
	</div>
</nav>
<div class="row">
	<div class="col-lg-3">	
		<form action="/order/work" method="POST">
			<table class="table2" style="margin-top:50px;">
				<tr>
					<td width="5%"></td>
					<td width="25%">Order NO</td>
					<td width="50%"><input type="text" class="form-control" name="orderno" id="orderno" value="${orderno }" required></td>
					<td width="20%"><button type="submit" class="btn btn-info">Search</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-lg-5" align="center">
		<h3>[가공의뢰서]</h3>
		<table class="table2">
			<tr>
				<td width="30%">원단출고처</td>
				<td width="70%"><input type="text" class="form-control" id="knitdelivery" value="${data.KNITDELIVERY }" placeholder="원단출고처" required></td>
			</tr>
			<tr>
				<td>가공처</td>
				<td ><input type="text" class="form-control" id="workcompany" value="${data.WORKCOMPANY }" placeholder="가공처" required></td>
			</tr>
		</table>
		<table  class="table2">
			<tr>
				<td width="30%">컬러</td>
				<td width="20%">절수</td>
				<td width="20%">수량(KG)</td>
				<td width="30%">발주량(yard)</td>
			</tr>
			<tbody id="my-tbody2"></tbody>
			<tr>
				<td>원단혼용율</td>
				<td colspan="3"><input type="text" id="mixed" value="${color.MIXED }" class="form-control"></td>
			</tr>
			<tr>
				<td>가공방법</td>
				<td colspan="3"><input type="text" id="work" value="${data.WORK }" class="form-control"></td>
			</tr>
			<tr>
				<td>세부사항</td>
				<td colspan="3"><input type="text" id="detail" value="${data.DETAIL }" class="form-control"></td>
			</tr>
		</table>
		<table class="table3">
			<tr>
				<td width="30%">기타사항</td>
				<td width="70%"><textarea id="etc"  class="form-control" rows="2" >${data.ETC}</textarea></td>
			</tr>
			<tr>
				<td>주의사항</td>
				<td><textarea id="caution" class="form-control" rows="2">${data.CAUTION}</textarea></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td><input type="text" id="delivery" value="${data.DELIVERY }" class="form-control" style="text-align:left;"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="workBtn">저장</button>
	</div>
	<div class="col-lg-4">
		<input type="hidden" id="color" value="${color.COLOR }">
		<input type="hidden" id="workWeight" value="${color.WORKWEIGHT }">
		<input type="hidden" id="orderLength" value="${color.ORDERLENGTH }">
		<input type="hidden" id="loss"	value="${color.LOSS }">
		<input type="hidden" id="perkg"	value="${color.PERKG }">
	</div>
</div>
	
<script>
$(document).ready(function(){
	if($("#orderno").val()==""){
		window.alert("Order No를 입력해주세요");
	}else{
		var color = $("#color").val();
		var workWeight = $("#workWeight").val();
		var orderLength = $("#orderLength").val();
		var loss = $("#loss").val();
		var perkg = $("#perkg").val();
		$.ajax({
			"type":"POST",
			"async":false,
			"url":"/order/dyeSum",
			"data":{
				"LOSS": loss,
				"PERKG": perkg,
				"COLOR":color,
				"ORDERLENGTH":orderLength,
				"WORKWEIGHT": workWeight
			},
			success:function(obj){
				$("#my-tbody2").html(obj);
			}
		})
	}
});
// 염색의뢰서 저장 버튼
$("#workBtn").click(function(){
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/workAdd",
		"data":{
			"ORDERNO":$("#orderno").val(),
			"KNITDELIVERY": $("#knitdelivery").val(),
			"WORKCOMPANY":$("#workcompany").val(),
			"WORK":$("#work").val(),
			"DETAIL":$("#detail").val(),
			"ETC":$("#etc").val(),
			"CAUTION":$("#caution").val(),
			"DELIVERY":$("#delivery").val()
		},
		success:function(obj){
				window.alert(obj);
		}
	})
})

</script>