<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function add_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	var row = my_tbody1.insertRow( my_tbody.rows.length );
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	cell1.innerHTML = '<input type="text" class="form-control" id="color">' ;
	cell2.innerHTML = '<input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD">';
    cell3.innerHTML = '<input type="text" class="form-control" id="colorBT">';
  }

  function del_row() {
    var my_tbody = document.getElementById('my-tbody');
    if (my_tbody.rows.length < 1) return;
    my_tbody.deleteRow( my_tbody.rows.length-1 );
  }	
</script>
<style>
.col-lg-3{
	border: 2px solid red;
    border-radius: 5px;
    padding: 10px;
}
#table1{
	border-collapse: separate;
	border-spacing: 10px;
}
td{
	text-align: center;
}
</style>
<div class="row">
	<div class="col-lg-3">
		<h1 align="center"><strong>[발주서]</strong></h1>
		<table width=95% id="table1">
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
			<tbody id="my-tbody1">
				<tr>
					<td><input type="text" class="form-control" id="color"></td>
					<td><input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD"></td>
					<td><input type="text" class="form-control" id="colorBT"></td>
				</tr>
			</tbody>
			<tr>
				<td>
					<small><button type="button" onclick="add_row()" class="btn btn-xs">추가</button></small>
				</td>
				<td></td>
				<td align="right">
					<small><button type="button" onclick="del_row()" class="btn btn-xs">삭제</button></small>
				</td>
			</tr>
			<tr>
				<td>[Order Total</td>
				<td><span id="ttl"></span> &#8194;YD]</td>
			</tr>
			<tr>
				<td>단가</td>
				<td colspan="2"><input type="text" class="form-control" id="price"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary">저장</button>
	</div>
	<div class="col-lg-3">
		<h1 align="center"><strong>[염색의뢰서]</strong></h1>
		<table width=95% id="table2">
			<tr>
				<td>LOSS %</td>
				<td><input type="number" id="loss" name="loss"></td>
				<td>Kg/절</td>
				<td colspan="2"><input type="number" id="perkg" name="perkg"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td>수량</td>
				<td>절수</td>
				<td>BT NO</td>
				<td>발주량</td>
			</tr>
		</table>
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
	$("#ttl").html(total);
})
</script>