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
	var cell4 = row.insertCell(3);
	cell1.innerHTML = '<input type="text" class="form-control color">' ;
	cell2.innerHTML = '<input type="number" class="form-control ttl" placeholder="YD">';
    cell3.innerHTML = '<input type="text" class="form-control colorBt">';
    cell4.className='selectSn';
}
function del_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	if (my_tbody1.rows.length < 1) return;
	my_tbody1.deleteRow( my_tbody1.rows.length-1 );
}	
</script>
<style>
table{
	text-align: center;
	border-collapse: separate;
	border-spacing: 10px;
	width: 100%;
}
td, th{
	text-align: center;
	font-weight: bold;
	font-family: verdana;
}
input{
	text-align: right;
	box-sizing: border-box;
	text-align:center;
}
.title{
	width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    background-color: #A9A9A9;
    color: black;
    text-align: center;
}
.col-lg-4{
	text-align: center;
}
</style>
<!-- nav -->
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Admin</a>
		</div>
		<ul class="nav navbar-nav justify-content-center">
			<li class="active"><a href="#">발주서</a></li>
			<li><a href="/order/dye">염색의뢰서</a></li>
			<li><a href="/order/knit">편직의뢰서</a></li>
			<li><a href="/order/thread">원사발주서</a></li>
			<li><a href="/order/work">가공의뢰서</a></li>
			<li><a href="/precost/precosting">사전원가계산서</a></li>
		</ul>
	</div>
</nav>
<div class="row">
	<div class="col-lg-3">
		<form action="/order/orderSearch" method="POST">
			<table class="table2" style="margin-top:50px;">
				<tr>
					<td width="5%"></td>
					<td width="25%">Order NO</td>
					<td width="50%"><input type="text" class="form-control" id="orderno" name="orderno" value="${data.ORDERNO }"></td>
					<td width="20%"><button type="submit" class="btn btn-info">Search</button></td>
				</tr>
			</table>
		</form>
	</div>	
	<div class="col-lg-5" align="center">
	<h3>[발주서]</h3>
		<table>
			<tr>
				<td width=30%>Order No</td>
				<td colspan="2"><input type="text" class="form-control" id="orderNo" value="${data.ORDERNO }" required></td>
			</tr>
			<tr>
				<td>발주처</td>
				<td><input type="text" class="form-control" id="company" value="${data.COMPANY }" placeholder="발주회사"></td>
				<td><input type="text" class="form-control" id="person" value="${data.PERSON }" placeholder="담당자"></td>
			</tr>
			<tr>
				<td>S/#</td>
				<td colspan="2"><input type="text" class="form-control" id="serial" value="${data.SERIAL }" placeholder="ex) fl1245 / fl4321"></td>
			</tr>
			<tr>
				<td>발주일</td>
				<td colspan="2"><input type="date" class="form-control" id="orderDate" value="${data.ORDERDATE }"></td>
			</tr>
			<tr>
				<td>납기일</td>
				<td colspan="2"><input type="date" class="form-control" id="endDate" value="${data.ENDDATE }"></td>
			</tr>
			<tr>
				<td>원단명</td>
				<td colspan="2"><input type="text" class="form-control" id="fabric" value="${data.FABRIC }"></td>
			</tr>
			<tr>
				<td>가공폭(inch)</td>
				<td colspan="2"><input type="number" class="form-control" id="workWidth" value="${data.WORKWIDTH }"></td>
			</tr>
			<tr>
				<td>가공중량</td>
				<td><input type="text" class="form-control" id="workWeight" placeholder="g/yd" value="${data.WORKWEIGHT }" required></td>
				<td><input type="text" class="form-control" id="mWeight" placeholder="g/m2" required></td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px; width: 25%;">
					컬러
					<button type="button" onclick="add_row()" id="plus" style="border-radius:5px; font-size: 10px;">+</button>&nbsp;
					<button type="button" onclick="del_row()" id="minus" style="border-radius:5px; font-size: 10px;">&#8210;</button>
				</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px; width: 25%;">Order Length</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px; width: 25%;">BT No.</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px; width: 25%;">S/#</td>
			</tr>
			<c:choose>
				<c:when test="${color.size() gt 0 }">
					<c:forEach var="idx" begin="1" end="${color.size() }">
					<tr>
						<td><input type="text" class="form-control color" value="${color[idx-1] }"></td>
						<td><input type="number" class="form-control ttl" value="${length[idx-1] }" placeholder="YD"></td>
    					<td><input type="text" class="form-control colorBt" value="${colorbt[idx-1] }"></td>
						<td class="selectSn">${sn[idx-1] }</td>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tbody id="my-tbody1">
					<tr>
						<td><input type="text" class="form-control color"></td>
						<td><input type="number" class="form-control ttl" placeholder="YD"></td>
						<td><input type="text" class="form-control colorBt"></td>
						<td class="selectSn">	</td>
					</tr>
				</tbody>
				</c:otherwise>
			</c:choose>
			<tr>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;"><b>Order Total</b></td>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;"><span id="ttl" style="color: red;"></span></td>
				<td  style="border-bottom: 1px solid blue; padding:0px 0px 5px; text-align:left;">YD</td>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td width="25%">단가</td>
				<td width="75%"><input type="text" class="form-control" id="price" value="${data.PRICE }" required></td>
			</tr>
			<tr>
				<td>기타</td>
				<td><textarea class="form-control" id="etc" value="${data.ETC }"></textarea></td>
			</tr>
			<tr>
				<td>관련 Sample No</td>
				<td><input class="form-control" id="sample" value="${data.SAMPLE }"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="orderBtn">저장</button>
	</div>
</div>	

<script>

// yard 중량 입력
$("#workWeight").change(function(){
	var gperyd = $("#workWeight").val();
	var width = $("#workWidth").val();
	var gperm = ((parseInt(gperyd)/0.465)/(parseInt(width)/2))*10;
	$("#mWeight").val(Math.round(gperm)+" g/m2");
	$("#workWeight").val(gperyd+" g/yd");
})
// m2 중량 입력
$("#mWeight").change(function(){
	var gperm = $("#mWeight").val();
	var width = $("#workWidth").val();
	var gperyd = (parseInt(gperm)*0.465*(parseInt(width)/2))/10;
	$("#workWeight").val(Math.round(gperyd)+" g/yd");
	$("#mWeight").val(gperm+" g/m2");
})
function serial(){
	var sn = $("#serial").val();
	var snArr = sn.split(',');
	var html="<select name='sn' class='form-control sn'>";
	for(var i=0; i<snArr.length; i++){
		html += "<option>"+snArr[i]+"</option>";
	}
	html +="</select>";
	$(".selectSn").html(html);
}
$("#plus").click(function(){
	serial();
})

$(document).on('change','#serial', function(){
	serial();
})
$(document).ready(function(){
	if($("#workWeight").val()!=null){
		var gperyd = $("#workWeight").val();
		var width = $("#workWidth").val();
		var gperm = ((parseInt(gperyd)/0.465)/(parseInt(width)/2))*10;
		$("#mWeight").val(Math.round(gperm)+" g/m2");
		$("#workWeight").val(gperyd+" g/yd");
	}
})

$(document).on('change','.ttl', function(){
	var total=0;
	var sum=document.getElementsByClassName("ttl");
	for(var i=0; i<sum.length; i++){
		var s = sum[i].value;
		total += parseInt(s);
	};
	$("#ttl").html("<b>"+total+"</b>");
})

// 발주서 저장버튼
$("#orderBtn").click(function(){
	var colorList=document.getElementsByClassName("color");
	var orderLengthList=document.getElementsByClassName("ttl");
	var colorBtList=document.getElementsByClassName("colorBt");
	var snList = document.getElementsByClassName("sn");
	var color = colorList[0].value;;
	var orderLength = orderLengthList[0].value;
	var colorBt = colorBtList[0].value;
	var sn = snList[0].value;
	for(var i=1; i<colorList.length; i++){
		color += "&&"+colorList[i].value;
		orderLength += "&&"+orderLengthList[i].value;
		colorBt += "&&"+colorBtList[i].value;
		sn = "&&"+snList[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/order",
		"data":{
			"orderno":$("#orderNo").val(),
			"company":$("#company").val(),
			"person":$("#person").val(),
			"serial":$("#serial").val(),
			"orderdate":$("#orderDate").val(),
			"enddate":$("#endDate").val(),
			"fabric":$("#fabric").val(),
			"workwidth":$("#workWidth").val(),
			"workweight":parseInt($("#workWeight").val()),
			"price":$("#price").val(),
			"color":color,
			"orderlength":orderLength,
			"colorbt":colorBt,
			"sn":sn,
			"etc":$("#etc").html(),
			"sample":$("#sample").val()
		},
		success:function(obj){
			if(obj=='new'){
				window.alert("신규저장 완료");
			}else{
				window.alert("업데이트 완료");
			}
			window.location.href="/order/dye?COLOR="+color
					+"&&WORKWEIGHT="+parseInt($("#workWeight").val())
					+"&&ORDERLENGTH="+orderLength
					+"&&orderno="+$("#orderNo").val();
		}
	})
})
</script>