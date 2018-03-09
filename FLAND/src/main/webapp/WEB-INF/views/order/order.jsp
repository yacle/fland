<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function add_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	var row = my_tbody1.insertRow(my_tbody1.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	cell1.innerHTML = '<input type="text" class="form-control color">' ;
	cell2.innerHTML = '<input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD">';
    cell3.innerHTML = '<input type="number" class="form-control colorBt">';
    
  }

  function del_row() {
    var my_tbody1 = document.getElementById('my-tbody1');
    if (my_tbody1.rows.length < 1) return;
    my_tbody1.deleteRow( my_tbody1.rows.length-1 );
  }	
</script>
<style>
.col-lg-3{
	border: none;
    padding: 10px;
}
#table1, #table2, #table3{
	border-collapse: separate;
	border-spacing: 10px;
	width: 95%;
}
td{
	text-align: center;
}
input{
	text-align: right;
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
				<td colspan="2"><input type="number" class="form-control" id="workWidth"></td>
			</tr>
			<tr>
				<td>가공중량</td>
				<td colspan="2"><input type="number" class="form-control" id="workWeight" placeholder="g/yd"></td>
			</tr>
			<tr align="center">
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">컬러</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">Order Length</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">BT No.</td>
			</tr>
			</tbody>
			<tbody id="my-tbody1">
				<tr>
					<td><input type="text" class="form-control color"></td>
					<td><input type="number" class="form-control ttl" placeholder="YD"></td>
					<td><input type="text" class="form-control colorBt"></td>
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
				<td width="30%"><input type="number" class="form-control" id="loss"></td>
				<td rowspan="2"><button type="button" id="dyeSum">계산</button></td>
			</tr>
			<tr>
				<td>KG/절</td>
				<td ><input type="number" class="form-control" id="perkg"></td>
			</tr>
			<tr align="center">
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">컬러</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">절수</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">수량(KG)</td>
			</tr>
			<tbody id="my-tbody2">
				<tr>
					<td><span class="dyeColor"></span></td>
					<td><input type="number" id="roll" class="form-control ttl2" placeholder="절"></td>
					<td><input type="number" id="kg" class="form-control" placeholder="KG"></td>
				</tr>
			</tbody>
			<tr>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">원단혼용율</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;" colspan="2">
					<input type="text" class="form-control" style="text-align:left;">
				</td>
			</tr>
			<tr>
				<td>가공방법</td>
				<td colspan="2"><input type="text" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>세부사항</td>
				<td colspan="2"><input type="text" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
		</table>
		<table id="table3">
			<tr>
				<td>시험의뢰&#8192;
					<button type="button" width="7px" height="7px" id="testPlus">+</button>&#8192;
					<button type="button" width="7px" height="7px" id="testMinus">&#8210;</button>
				</td>
				<td>염색견뢰도</td>
				<td>축률</td>
				<td>필링</td>
				<td>사행도</td>
			</tr>
			<tr>
				<td><input type="text" size="6" name="testColor"></td>
				<td><input type="checkbox" name="fastness"></td>
				<td><input type="checkbox" name="reduction"></td>
				<td><input type="checkbox" name="feeling"></td>
				<td><input type="checkbox" name="skewness" ></td>
			</tr>
			<tr>
				<td>기타사항</td>
				<td colspan="4"><input type="text" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>주의사항</td>
				<td colspan="4"><input type="text" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td colspan="4"><input type="text" class="form-control" style="text-align:left;"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="dyeBtn">저장</button>
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
	
	var colorList=document.getElementsByClassName("color");
	var orderLengthList=document.getElementsByClassName("ttl");
	var colorBtList=document.getElementsByClassName("colorBt");
	var color = colorList[0].value;;
	var orderLength = orderLengthList[0].value;
	var colorBt = colorBtList[0].value;
	for(var i=1; i<colorList.length; i++){
		color += "/"+colorList[i].value;
		orderLength += "/"+orderLengthList[i].value;
		colorBt += "/"+colorBtList[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/order",
		"data":{
			"orderNo":$("#orderNo").val(),
			"company":$("#company").val(),
			"sn":$("#sn").val(),
			"orderDate":$("#orderDate").val(),
			"endDate":$("#endDate").val(),
			"fabric":$("#fabric").val(),
			"workWidth":$("#workWidth").val(),
			"workWeight":$("#workWeight").val(),
			"price":$("#price").val(),
			"color":color,
			"orderLength":orderLength,
			"colorBt":colorBt
		},
		success:function(obj){
			$("#my-tbody2").html(obj);
		}
	})
})
$("#dyeSum").click(function(){
	var colorList=document.getElementsByClassName("color");
	var orderLengthList=document.getElementsByClassName("ttl");
	var color = colorList[0].value;;
	var orderLength = orderLengthList[0].value;
	for(var i=1; i<colorList.length; i++){
		color += "/"+colorList[i].value;
		orderLength += "/"+orderLengthList[i].value;
	}
	var workWeight = $("#workWeight").val();
	var loss = $("#loss").val();
	var perkg = $("#perkg").val();
	console.log(workWeight);
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/dyeSum",
		"data":{
			"loss": loss,
			"perkg": perkg,
			"color":color,
			"orderLength":orderLength,
			"workWeight": workWeight
		},
		success:function(obj){
			$("#my-tbody2").html(obj);
		}
	})
})
</script>