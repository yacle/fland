<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table, th, td{
	border: 1px solid black;
	text-align: center;
	font-size: 13px;
	height: 30px;
	padding: 0px;
}
table{
	width: 98%;
}
input{
	text-align: right;
	box-sizing: border-box;
	text-align:center;
	margin: 0px;
	border: none;
	background-color: #E6E6FA;
	height: 30px;
}
div.a{
	display: inline;
}
.total{
	font-size: 15px;
	font-weight: bold;
}
</style>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Admin</a>
		</div>
		<ul class="nav navbar-nav justify-content-center">
			<li><a href="/order/new">발주서</a></li>
			<li><a href="/order/dye">염색의뢰서</a></li>
			<li><a href="/order/knit">편직의뢰서</a></li>
			<li><a href="/order/thread">원사발주서</a></li>
			<li><a href="/order/work">가공의뢰서</a></li>
			<li class="active"><a href="#">사전원가계산서</a></li>
		</ul>
	</div>
</nav>
<div align="center"><h2>사전원가계산서</h2></div>
<div class="row">
<!-- 발주서 & 원사발주서 -->
	<div class="col-lg-4" align="center">
		<form action="/precost/search" class="form-inline" method="POST">
			<div class="form-group" align="left" style="display">
				<label for="orderno">Order No:</label>
				<input type="text" class="form-control" name="orderno" id="orderno" value="${orderno }">
				<button type="submit" class="btn">Search</button>
			</div>
		</form>
		<h4>[발주서]</h4>
		<input type="hidden" id="order_length" value="${order.ORDERLENGTH }">
		<table>
			<tr>
				<td rowspan="2">품명</td>
				<td colspan="3">오더금액</td>
			</tr>
			<tr>
				<td>발주량(Yard)</td>
				<td>단가(원)</td>
				<td>발주금액(원)</td>
			</tr>
			<tr>
				<td width="30%">${order.FABRIC }</td>
				<td width="15%"><span id="orderlength ">${order.ORDERLENGTH }</span> yd</td>
				<td width="15%"><input type="number" style="background-color: yellow;" id="order_price" value="${order.PRICE }"></td>
				<td width="23%"><span id="order_sum"></span> 원</td>
			</tr>
		</table>
		<h4>[원사발주서]</h4>
		<table>
			<tr>
				<td style="color: blue;">Calculator(단가/181.44)</td>
				<td colspan="2"><input type="number" id="price_calcu"></td>
				<td><span id="rst"></span></td>
			</tr>
			<tr>
				<td width="41%">원사종류</td>
				<td width="18%">수량(KG)</td>
				<td width="18%">단가(KG당)</td>
				<td width="23%">금액</td>
			</tr>
			<c:forEach var="idx" begin="1" end="${threadMap.weight_list.size() }">
			<tr>
				<td>${threadMap.thread_list[idx-1] }</td>
				<td><span class="thread_weight">${threadMap.weight_list[idx-1] }</span></td>
				<td><input type="number" size="3" class="thread_price" value="${precostlist.threadprice[idx-1] }"></td>
				<td><span class="thread_total_price"></span></td>
			</tr>
			</c:forEach>
			<tr>
				<td><b>A</b> 총계</td>
				<td>${threadMap.weight }	</td>
				<td colspan="2"><span id="price_total"></span></td>
			</tr>
		</table>
	</div>
<!-- 편직의뢰서 & 염색의뢰서 -->
	<div class="col-lg-4" align="center">
		<h4>[편직의뢰서]</h4>
		<table>
			<tr>
				<td width="41%">편직사양</td>
				<td width="18%">수량(KG)</td>
				<td width="18%">편직비(KG당)</td>
				<td width="23%">금액</td>
			</tr>
			<c:forEach var="knit" items="${knitlist}">
				<c:forEach var="i" begin="0" end="${knit.thread.size()-1 }" step="1">
				<tr>
					<td>${knit.thread[i] }</td>
					<td><span class="knitweight">${knit.weight[i] }</span></td>
					<td><input type="number" size="3" class="knit_price" value="${precostlist.knitprice[i] }"></td>
					<td><span class="knit_total_price"></span></td>
				</tr>
				</c:forEach>
			</c:forEach>
			<tr>
				<td><b>B</b> 총계</td>
				<td><span id="knitweight_total"></span>	</td>
				<td colspan="2"><span id="knitprice_total"></span></td>
			</tr>
		</table>
		<h4>[염색의뢰서]</h4>
		<table>
			<tr>
				<td width="20%">염색방법</td>
				<td width="27%">색상</td>
				<td width="15%">수량(KG)</td>
				<td width="15%">단가(KG당)</td>
				<td width="23%">금액</td>
			</tr>
			<c:forEach var="idx" begin="1" end="${dyeMap.weight.size() }">
			<tr>
				<td><input type="text" class="dyemethod" value="${precostlist.dyemethod[idx-1] }"></td>
				<td>${dyeMap.color[idx-1] }</td>
				<td><span class="dyeweight">${dyeMap.weight[idx-1] }</span></td>
				<td><input type="number" size="3" class="dye_price" value="${precostlist.dyeprice[idx-1] }"></td>
				<td><span class="dye_total_price"></span></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="2"><b>C</b> 총계</td>
				<td><span id="dyeweight_total"></span></td>
				<td colspan="2"><span id="dyeprice_total"></span></td>
			</tr>
		</table>
	</div>
<!-- 가공의뢰서 & 계산서 -->
	<div class="col-lg-4" align="center">
		<h4>[가공의뢰서]</h4>
		<table>
			<tr>
				<td width="41%">가공방법</td>
				<td width="18%">수량</td>
				<td width="18%">단가</td>
				<td width="23%">금액</td>
			</tr>
			<tr>
				<td>기모</td>
				<td><span id="napping_total"></span> kg</td>
				<td><input type="number" size="3" id="napping" value="${precost.NAPPING }"></td>
				<td><span id="napping_price"></span></td>
			</tr>
			<tr>
				<td>원단검사 및 포장</td>
				<td><span id="packing_total">${order.ORDERLENGTH }</span> yd</td>
				<td><input type="number" size="3" id="packing" value="${precost.PACKING }"></td>
				<td><span id="packing_price"></span></td>
			</tr>
			<tr>
				<td colspan="2"><b>D</b> 총계</td>
				<td colspan="2"><span id="work_total"></span></td>
			</tr>
		</table>
		<h4>[총계산]<button type="button" id="total_cal" class="btn btn-primary btn-xs">계산</button></h4>
		<table>
			<tr>
				<td rowspan="3" class="total">직접비</td>
				<td width="30%" class="total">순제조비 (A+B+C+D)</td>
				<td width="35%" class="total"><span id="manufacturing_cost"></span></td>
			</tr>
			<tr>
				<td class="total">샘플비</td>
				<td class="total"><input type="number" name ="sample_price" id="sample_price" value="${precost.SAMPLEPRICE }"></td>
			</tr>
			<tr>
				<td class="total">물류비 및 기타비용</td>
				<td class="total"><input type="number" name="delivery_price" id="delivery_price" value="${precost.DELIVERYPRICE }"></td>
			</tr>
			<tr>
				<td class="total">간접비</td>
				<td class="total">일반관리비</td>
				<td class="total"><span id="indirect_cost"></span></td>
			</tr>
			<tr>
				<td colspan="2" class="total">합계(직접비+간접비)</td>
				<td class="total"><span id="total_cost"></span></td>
			</tr>
			<tr>
				<td class="total">마진 및 마진율</td>
				<td class="total" style="background-color: yellow;"><span id="margin_ratio"></span>%</td>
				<td class="total"><span id="margin_cost"></span></td>
			</tr>
		</table>
		<button type="button" id="precost_save">저장</button>
	</div>
</div>

<script>
var thread_sum=0;
var knit_sum=0;
var dye_sum=0;
var work_sum=0;
// 천단위 콤마
function comma(str) {
    str = String(str);
    var minus = str.substring(0, 1);
    str = str.replace(/[^\d]+/g, '');
    str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    if(minus == "-") str = "-"+str;
    return str;
}
function thread() {	
	var thread_weight = document.getElementsByClassName("thread_weight");
	var thread_price = document.getElementsByClassName("thread_price");
	var thread_total_price = document.getElementsByClassName("thread_total_price");
	var price_total = 0;
	for(var i=0; i<thread_weight.length; i++){
		thread_total_price[i].innerHTML = comma(parseInt(thread_weight[i].innerHTML)*parseInt(thread_price[i].value))+"원";
		price_total += parseInt(thread_weight[i].innerHTML)*parseInt(thread_price[i].value);
	}
	$("#price_total").html(comma(price_total)+"원");
	thread_sum = price_total;
}
function knit() {	
	var knit_weight = document.getElementsByClassName("knitweight");
	var knit_price = document.getElementsByClassName("knit_price");
	var knit_total_price = document.getElementsByClassName("knit_total_price");
	var knitprice_total = 0;
	for(var i=0; i<knit_weight.length; i++){
		knit_total_price[i].innerHTML = comma(parseInt(knit_weight[i].innerHTML)*parseInt(knit_price[i].value))+"원";
		knitprice_total += parseInt(knit_weight[i].innerHTML)*parseInt(knit_price[i].value);
	}
	$("#knitprice_total").html(comma(knitprice_total)+"원");
	knit_sum = knitprice_total;
}
function dye() {	
	var dye_weight = document.getElementsByClassName("dyeweight");
	var dye_price = document.getElementsByClassName("dye_price");
	var dye_total_price = document.getElementsByClassName("dye_total_price");
	var dyeprice_total = 0;
	for(var i=0; i<dye_weight.length; i++){
		dye_total_price[i].innerHTML = comma(parseInt(dye_weight[i].innerHTML)*parseInt(dye_price[i].value))+"원";
		dyeprice_total += parseInt(dye_weight[i].innerHTML)*parseInt(dye_price[i].value);
	}
	$("#dyeprice_total").html(comma(dyeprice_total)+"원");
	dye_sum = dyeprice_total;
}
function working(){
	var napping = document.getElementById("napping").value;
	var napping_total = document.getElementById("napping_total").innerHTML;
	var packing = document.getElementById("packing").value;
	var packing_total = document.getElementById("packing_total").innerHTML;
	document.getElementById("napping_price").innerHTML 
		= comma(parseInt(napping)*parseInt(napping_total))+" 원";
	document.getElementById("packing_price").innerHTML 
	= comma(parseInt(packing)*parseInt(packing_total))+" 원";
	document.getElementById("work_total").innerHTML = comma(parseInt(napping)*parseInt(napping_total)+parseInt(packing)*parseInt(packing_total))+" 원";
	work_sum = parseInt(napping)*parseInt(napping_total)+parseInt(packing)*parseInt(packing_total);
}
// 계산기
$("#price_calcu").change(function(){
	var price_calcu = $("#price_calcu").val();
	$("#rst").html(price_calcu/181.44);
})
// 발주서
var order_total_price = 0;
$("#order_price").change(function(){
	var order_price = $("#order_price").val();
	var order_length=$("#order_length").val()
	var sum=order_price*order_length;
	$("#order_sum").html(comma(sum));
	order_total_price = sum;
})
// 원사발주서
$(".thread_price").change(function(){
	thread();
})
//  편직의뢰서
$(".knit_price").change(function(){
	knit();
})
// 염색의뢰서
$(".dye_price").change(function(){
	dye();
})
// 가공의뢰서
$("#napping").change(function(){
	working();
})
$("#packing").change(function(){
	working();
})
$(document).ready(function(){
	// 발주금액
	var order_price = $("#order_price").val();
	var order_length = $("#order_length").val();
	$("#order_sum").html(comma(parseInt(order_price)*parseInt(order_length)));
	order_total_price=parseInt(order_price)*parseInt(order_length);
	
	// 편직 총수량
	var knitweight = document.getElementsByClassName("knitweight");
	var knitweight_total = 0;
	for(var i=0; i<knitweight.length; i++){
		knitweight_total += parseInt(knitweight[i].innerHTML);
	}
	$("#knitweight_total").html(knitweight_total);
	// 염색 총수량
	var dyeweight = document.getElementsByClassName("dyeweight");
	var dyeweight_total = 0;
	for(var i=0; i<dyeweight.length; i++){
		dyeweight_total += parseInt(dyeweight[i].innerHTML);
	}
	$("#dyeweight_total").html(dyeweight_total);
	$("#napping_total").html(dyeweight_total);
	thread();	// 원사발주서 계산
	knit();		// 편직의뢰서 계산
	dye();		// 염색의뢰서 계산
	working();	// 가공의뢰서 계산
})
var manufacturing_cost = 0;
$("#total_cal").click(function(){
	manufacturing_cost = thread_sum + knit_sum + dye_sum + work_sum;
	$("#manufacturing_cost").html(comma(manufacturing_cost)+" 원");
	var mcost = manufacturing_cost;
	var sprice = $("#sample_price").val();
	var dprice = $("#delivery_price").val();
	var direct_price = mcost+parseInt(sprice)+parseInt(dprice);
	$("#indirect_cost").html(comma(direct_price*0.1));
	$("#total_cost").html(comma(parseInt(direct_price*1.1)));
	$("#margin_cost").html(comma(order_total_price-parseInt(direct_price*1.1)));
	$("#margin_ratio").html(((order_total_price-parseInt(direct_price*1.1))*100/order_total_price).toFixed(2));
})
// 총계
$("#sample_price, #delivery_price, #order_price").change(function(){
	var mcost = manufacturing_cost;
	var sprice = $("#sample_price").val();
	var dprice = $("#delivery_price").val();
	var direct_price = mcost+parseInt(sprice)+parseInt(dprice);
	$("#indirect_cost").html(comma(direct_price*0.1));
	$("#total_cost").html(comma(parseInt(direct_price*1.1)));
	$("#margin_cost").html(comma(order_total_price-parseInt(direct_price*1.1)));
	$("#margin_ratio").html(((order_total_price-parseInt(direct_price*1.1))*100/order_total_price).toFixed(2));
})
// 저장
$("#precost_save").click(function(){
	var threadpriceArr = document.getElementsByClassName("thread_price");
	var knitpriceArr = document.getElementsByClassName("knit_price");
	var dyepriceArr = document.getElementsByClassName("dye_price");
	var dyemethodArr = document.getElementsByClassName("dyemethod");
	var threadprice = threadpriceArr[0].value;
	var knitprice = knitpriceArr[0].value;
	var dyeprice = dyepriceArr[0].value;
	var dyemethod = dyemethodArr[0].value;
	for(var i=1; i<threadpriceArr.length; i++){
		threadprice += "&&"+threadpriceArr[i].value;
	}
	for(var i=1; i<knitpriceArr.length; i++){
		knitprice += "&&"+knitpriceArr[i].value;
	}
	for(var i=1; i<dyepriceArr.length; i++){
		dyeprice += "&&"+dyepriceArr[i].value;
		dyemethod += "&&"+dyemethodArr[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/precost/precostSave",
		"data":{
			"ORDERNO" : $("#orderno").val(),
			"PRICE" : $("#order_price").val(),
			"NAPPING" : $("#napping").val(),
			"PACKING" : $("#packing").val(),
			"SAMPLEPRICE" : $("#sample_price").val(),
			"DELIVERYPRICE" : $("#delivery_price").val(),
			"THREADPRICE" : threadprice,
			"KNITPRICE" : knitprice,
			"DYEPRICE" : dyeprice,
			"DYEMETHOD" : dyemethod
		},
		success:function(result){
			window.alert(result);
		}
	})
})

</script>







