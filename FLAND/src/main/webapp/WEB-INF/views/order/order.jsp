<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function add_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	var row = my_tbody1.insertRow(my_tbody1.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	cell1.innerHTML = '<input type="text" class="form-control" id="color">' ;
	cell2.innerHTML = '<input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD">';
    cell3.innerHTML = '<input type="text" class="form-control" id="colorBT">';
    
    var my_tbody2 = document.getElementById('my-tbody2');
	var row2 = my_tbody2.insertRow(my_tbody2.rows.length);
	var cell21 = row2.insertCell(0);
	var cell22 = row2.insertCell(1);
	var cell23 = row2.insertCell(2);
	cell21.innerHTML = '<input type="text" id="color" class="form-control">' ;
	cell22.innerHTML = '<input type="number" id="roll" class="form-control ttl2" style="text-align: right;" placeholder="절">';
    cell23.innerHTML = '<input type="text" id="kg" class="form-control" placeholder="KG">';
  }

  function del_row() {
    var my_tbody1 = document.getElementById('my-tbody1');
    if (my_tbody1.rows.length < 1) return;
    my_tbody1.deleteRow( my_tbody1.rows.length-1 );
    
    var my_tbody2 = document.getElementById('my-tbody2');
    if (my_tbody2.rows.length < 1) return;
    my_tbody2.deleteRow( my_tbody2.rows.length-1 );
  }	
</script>
<style>
.col-lg-3{
	border: 2px solid red;
    border-radius: 5px;
    padding: 10px;
}
#table1, #table2{
	border-collapse: separate;
	border-spacing: 10px;
	width: 95%;
}
td{
	text-align: center;
}
</style>
<div class="row">
	<div class="col-lg-3">	
		<h1 align="center"><strong>[발주서]</strong></h1>
		<table id="table1">
		<tbody>
			<tr>
				<td width=30%>Order No</td>
				<td colspan="2"><input type="text" class="form-control" id="orderNo"></td>
			</tr>
			<tr>
				<td>발주처</td>
				<td colspan="2"><input type="text" class="form-control" id="company"></td>
			</tr>
			<tr>
				<td>S/#</td>
				<td colspan="2"><input type="text" class="form-control" id="sn"></td>
			</tr>
			<tr>
				<td>발주일</td>
				<td colspan="2"><input type="date" class="form-control" id="orderDate"></td>
			</tr>
			<tr>
				<td>납기일</td>
				<td colspan="2"><input type="date" class="form-control" id="endDate"></td>
			</tr>
			<tr>
				<td>원단명</td>
				<td colspan="2"><input type="text" class="form-control" id="fabric"></td>
			</tr>
			<tr>
				<td>가공폭</td>
				<td colspan="2"><input type="text" class="form-control" id="width"></td>
			</tr>
			<tr>
				<td>가공중량</td>
				<td colspan="2"><input type="text" class="form-control" id="weight"></td>
			</tr>
			<tr align="center">
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">컬러</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">Order Length</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">BT No.</td>
			</tr>
			</tbody>
			<tbody id="my-tbody1">
				<tr>
					<td><input type="text" class="form-control" id="color"></td>
					<td><input type="number" class="form-control ttl" id="orderLength" style="text-align: right;" placeholder="YD"></td>
					<td><input type="text" class="form-control" id="colorBt"></td>
				</tr>
			</tbody>
			<tbody>
			<tr>
				<td>Order Total</td>
				<td><input type="text" class="form-control" id="ttl" readonly></td>
				<td style="text-align:left;">YD</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;">
					<small><button type="button" onclick="add_row()" class="btn btn-xs">추가</button></small>
				</td>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;"></td>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;" align="right">
					<small><button type="button" onclick="del_row()" class="btn btn-xs">삭제</button></small>
				</td>
			</tr>
			<tr>
				<td>단가</td>
				<td colspan="2"><input type="text" class="form-control" id="price"></td>
			</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-primary" id="orderBtn">저장</button>
	</div>
	<div class="col-lg-3">
		<h1 align="center"><strong>[염색의뢰서]</strong></h1>
		<table id="table2">
			<tr>
				<td width="30%">LOSS %</td>
				<td><input type="text" class="form-control" id="loss"></td>
			</tr>
			<tr>
				<td>KG/절</td>
				<td ><input type="text" class="form-control" id="perkg"></td>
			</tr>
			<tr align="center">
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">컬러</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">절수</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">수량(KG)</td>
			</tr>
			<tbody id="my-tbody2">
				<tr>
					<td><input type="text" id="color" class="form-control"></td>
					<td><input type="number" id="roll" class="form-control ttl2" style="text-align: right;" placeholder="절"></td>
					<td><input type="text" id="kg" class="form-control"></td>
			</tbody>
			<tr>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">원단혼용율</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;" colspan="2"><input type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>가공방법</td>
				<td colspan="2"><input type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>세부사항</td>
				<td colspan="2"><input type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>시험의뢰</td>
				<td colspan="2"><input type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>기타사항</td>
				<td colspan="2"><input type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>주의사항</td>
				<td colspan="2"><input type="text" class="form-control"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td colspan="2"><input type="text" class="form-control"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="byeingBtn">저장</button>
	</div>
	<div class="col-lg-3">
		편직의뢰서
	</div>
	<div class="col-lg-3">
		원사발주서
	</div>
</div>
	
<script>
$(document).on('change','.ttl', function(){
	var total=0;
	var sum=document.getElementsByClassName("ttl");
	for(var i=0; i<sum.length; i++){
		var s = sum[i].value;
		total += parseInt(s);
	};
	$("#ttl").val(total);
})
$("#orderBtn").click(function(){
	var html = $("#my-tbody1").html();
	$('#my-tbody2').append(html);
})
</script>