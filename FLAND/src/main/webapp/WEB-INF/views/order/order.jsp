<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function add_row() {
	var my_tbody = document.getElementById('my-tbody');
	var row = my_tbody.insertRow( my_tbody.rows.length );
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
	border-spacing: 15px;
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
				<td colspan="2"><input type="text" class="form-control" id="orderDate"></td>
			</tr>
			<tr>
				<td>납기일</td>
				<td colspan="2"><input type="text" class="form-control" id="endDate"></td>
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
				<td>컬러</td>
				<td>Order Length</td>
				<td>BT No.</td>
			</tr>
			<tbody id="my-tbody">
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
				<td>[Order Total :</td>
				<td><span id="ttl"></span>YD]</td>
			</tr>
			<tr>
				<td>단가</td>
				<td colspan="2"><input type="text" class="form-control" id="price"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary">저장</button>
	</div>
	<div class="col-lg-3">
		염색의뢰서
	</div>
	<div class="col-lg-3">
		편직의뢰서
	</div>
	<div class="col-lg-3">
		원사발주서
	</div>
</div>
<!-- 컬러 추가 HTML -->
<div id="formgroupcopy" style="display:none;">
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<input type="text" class="form-control" id="color">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group" >
				<input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<input type="text" class="form-control" id="colorBT">
			</div>
		</div>
		<div class="col-md-1" style="padding: 5px 0;">
			<button type="button" class="del">삭제</button>
		</div>
	</div>
</div>				
<script>
$(".ttl").change(function(){
	var total=0;
	var sum=document.getElementsByClassName("ttl");
	for(var i=0; i<sum.length-1; i++){
		var s = sum[i].value;
		total += parseInt(s);
	};
	$("#ttl").html(total);
})
</script>