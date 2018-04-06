<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
// 발주서 컬러별 수량
function add_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	var row = my_tbody1.insertRow(my_tbody1.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	cell1.innerHTML = '<input type="text" class="form-control color">' ;
	cell2.innerHTML = '<input type="number" class="form-control ttl" placeholder="YD">';
    cell3.innerHTML = '<input type="text" class="form-control colorBt">';
}
function del_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	if (my_tbody1.rows.length < 1) return;
	my_tbody1.deleteRow( my_tbody1.rows.length-1 );
}	
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
// 편직의뢰서 01
function add_knit() {
	var my_tbody4 = document.getElementById('my-tbody4');
	var row4 = my_tbody4.insertRow(my_tbody4.rows.length);
	var cell41 = row4.insertCell(0);
	var cell42 = row4.insertCell(1);
	var cell43 = row4.insertCell(2);
	var cell44 = row4.insertCell(3);
	var cell45 = row4.insertCell(4);
	cell41.innerHTML = '<input type="text" class="form-control thread" placeholder="사종">';
	cell42.innerHTML = '<input type="number" class="form-control ratio" placeholder="%">';
	cell43.innerHTML = '<input type="number" class="form-control Knitweight" placeholder="kg">';
	cell44.innerHTML = '<input type="text" class="form-control thread_com" placeholder="원사업체">';
	cell45.innerHTML = '<input type="text" class="form-control lot" placeholder="lot">';
}
function del_knit(){
	var my_tbody4 = document.getElementById('my-tbody4');
	if (my_tbody4.rows.length < 1) return;
	my_tbody4.deleteRow( my_tbody4.rows.length-1 );
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
			<a class="navbar-brand" href="/">HOME</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/order/new">발주서</a></li>
			<li class="active"><a href="#">염색의뢰서</a></li>
			<li><a href="/order/knit">편직의뢰서</a></li>
		</ul>
	</div>
</nav>
<div class="row">
	<div class="col-lg-4">	
		<form action="/order/dye" method="POST">
			<table class="table2" style="margin-top:50px;">
				<tr>
					<td width="5%"></td>
					<td width="25%">Order NO</td>
					<td width="50%"><input type="text" class="form-control" name="orderno" id="orderno" value="${orderno }"></td>
					<td width="20%"><button type="submit" class="btn btn-info">Search</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-lg-4 center">
		<table class="table2">
			<tr>
				<td width="30%">LOSS %</td>
				<td width="30%"><input type="number" class="form-control" id="loss" placeholder="ex)1.15" required></td>
				<td rowspan="2"><button type="button" id="dyeSum" class="btn btn-success">계산</button></td>
			</tr>
			<tr>
				<td>KG/절</td>
				<td ><input type="number" class="form-control" id="perkg" required></td>
			</tr>
		</table>
		<table  class="table2">
			<tr>
				<td width="20%"  style="border-top: 1px solid blue; padding:5px 0px 0px;">컬러</td>
				<td width="20%"  style="border-top: 1px solid blue; padding:5px 0px 0px;">절수</td>
				<td width="30%"  style="border-top: 1px solid blue; padding:5px 0px 0px;">수량(KG)</td>
				<td width="30%"  style="border-top: 1px solid blue; padding:5px 0px 0px;">발주량(yard)</td>
			</tr>
			<tbody id="my-tbody2">
			</tbody>
			<tr>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">원단혼용율</td>
				<td colspan="3" style="border-top: 1px solid blue; padding:5px 0px 0px;">
					<input type="text" id="mixed" class="form-control">
				</td>
			</tr>
			<tr>
				<td>가공방법</td>
				<td colspan="3"><input type="text" id="method" class="form-control"></td>
			</tr>
			<tr>
				<td>세부사항</td>
				<td colspan="3"><input type="text" id="detail" class="form-control"></td>
			</tr>
			<tr>
		</table>
		<table class="table3">
			<tr>
				<td width="30%">시험의뢰&nbsp;
					<button type="button" onclick="add_test()" style="border-radius:5px; font-size: 10px;">+</button>&nbsp;
					<button type="button" onclick="del_test()" style="border-radius:5px; font-size: 10px;">&#8210;</button>
				</td>
				<td>염색견뢰도/축률/필링/사행도</td>
			</tr>
			<tbody id="test-tbody">
				<tr>
					<td><input type="text" size="5" class="form-control testColor" placeholder="컬러명"></td>
					<td><input type="text" class="form-control test" placeholder="테스트내용"></td>
				</tr>
			</tbody>
			<tr>
				<td>기타사항</td>
				<td><textarea id="dyeetc" class="form-control" rows="3">야드지 요청 : 퀄리티 컨펌용 3yd / 컬러컨펌용 1yd/ 자체 시험성적 결과 회신 바람</textarea></td>
			</tr>
			<tr>
				<td>주의사항</td>
				<td><textarea id="caution" class="form-control" rows="2">포장전 B/T 색상과 자체 비교 요망</textarea></td>
			</tr>
			<tr>
				<td>생지출고처</td>
				<td><input type="text" id="knitcompany" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>염색처</td>
				<td><input type="text" id="dyecompany" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td><input type="text" id="delivery" class="form-control" style="text-align:left;"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="dyeBtn">저장</button>
	</div>
	<div class="col-lg-4">
		<input type="hidden" id="color" value="${color }">
		<input type="hidden" id="workWeight" value="${workWeight }">
		<input type="hidden" id="orderLength" value="${orderLength }">
	</div>
</div>
	
<script>
$(document).ready(function(){
	if($("#orderno").val()==""){
		window.alert("Order No를 입력해주세요");
	}else{
	    window.alert("Loss와 kg/절을 입력해주세요");
	    $("#loss").focus();
	}
});
// 염색의뢰서 컬러별 절수계산 버튼
$("#dyeSum").click(function(){
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
})
// 염색의뢰서 저장 버튼
$("#dyeBtn").click(function(){
	var testColorList=document.getElementsByClassName("testColor");
	var testList=document.getElementsByClassName("test");
	var testColor = testColorList[0].value;
	var test = testList[0].value;
	for(var i=1; i<testColorList.length; i++){
		testColor += "&"+testColorList[i].value;
		test += "&"+ testList[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/dyeAdd",
		"data":{
			"orderno":$("#orderno").val(),
			"loss":$("#loss").val(),
			"perkg":$("#perkg").val(),
			"mixed":$("#mixed").val(),
			"method":$("#method").val(),
			"detail":$("#detail").val(),
			"dyeetc":$("#dyeetc").html(),
			"caution":$("#caution").html(),
			"knitcompany":$("#knitcompany").val(),
			"dyecompany":$("#dyecompany").val(),
			"delivery":$("#delivery").val(),
			"testcolor":testColor,
			"test":test,
			"rolltotal":$("#rollTotal").html(),
			"perkgtotal":$("#perkgTotal").html()
		},
		success:function(obj){
			if(obj=="new"){
				window.alert("신규저장 완료");
			}else if(obj="update"){
				window.alert("업데이트 완료");
			}
			var html = $("#my-tbody2").html();
			window.location.href="/order/knit?orderno="+$("#orderno").val();
		}
	})
})

</script>