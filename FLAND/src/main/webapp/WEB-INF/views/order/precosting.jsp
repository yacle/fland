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
				<td width="15%"><fmt:formatNumber value="${order.ORDERLENGTH }" groupingUsed="true"/> yd</td>
				<td width="15%"><input type="number" id="order_price" value="${order.PRICE }"></td>
				<td width="23%"><span id="order_sum"><fmt:formatNumber value="${order.ORDERLENGTH*order.PRICE }" groupingUsed="true"/></span> 원</td>
			</tr>
		</table>
		<h4>[원사발주서]</h4>
		
		<table>
			<tr>
				<td style="background-color: #7FFFD4; color: red;">calculator</td>
				<td colspan="2" style="background-color: #7FFFD4"><input type="number" id="price_calcu"></td>
				<td style="background-color: #7FFFD4"><span id="rst"></span></td>
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
				<td>${threadMap.weight_list[idx-1] }</td>
				<td><input type="number" size="3" class="thread_price"></td>
				<td><span class="thread_total_price"></span></td>
			</tr>
			</c:forEach>
			<tr>
				<td>총계</td>
				<td>${threadMap.weight }	</td>
				<td colspan="2" style="background-color: yellow;"><span id="price_total"></span></td>
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
					<td><input type="number" size="3" class="knit_price"></td>
					<td><span class="knit_total_price"></span></td>
				</tr>
				</c:forEach>
			</c:forEach>
			<tr>
				<td>총계</td>
				<td><span id="knitweight_total"></span>	</td>
				<td colspan="2" style="background-color: yellow;"><span id="knitprice_total"></span></td>
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
				<td><input type="text" id="dyemethod"></td>
				<td>${dyeMap.color[idx-1] }</td>
				<td><span class="dyeweight">${dyeMap.weight[idx-1] }</span></td>
				<td><input type="number" size="3" class="dye_price"></td>
				<td><span class="dye_total_price"></span></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="2">총계</td>
				<td><span id="dyeweight_total"></span></td>
				<td colspan="2" style="background-color: yellow;"><span id="dyeprice_total"></span></td>
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
				<td><span id="napping_total"></span></td>
				<td><input type="number" size="3" id="napping"></td>
				<td><span id="napping_price"></span></td>
			</tr>
			<tr>
				<td>원단검사 및 포장</td>
				<td><span id="packing_total"></span></td>
				<td><input type="number" size="3" id="packing"></td>
				<td><span id="packing_price"></span></td>
			</tr>
			<tr>
				<td colspan="2">총계</td>
				<td colspan="2" style="background-color: yellow;"><span id="work_total"></span></td>
			</tr>
		</table>
		<h4>총계산</h4>
		<table style="background-color: yellow;">
			<tr>
				<td width="60%">순제조비</td>
				<td width="40%"></td>
				
			</tr>
			<tr>
				<td>샘플비</td>
				<td></td>
			</tr>
			<tr>
				<td>물류비 및 기타비용</td>
				<td></td>
				
			</tr>
			<tr>
				<td>직접비</td>
				<td></td>
			</tr>
			<tr>
				<td>일반관리비</td>
				<td></td>
				
			</tr>
			<tr>
				<td>직접비합계</td>
				<td></td>
			</tr>
		</table>
	</div>
</div>

<script>
// 천단위 콤마
function comma(str) {
    str = String(str);
    var minus = str.substring(0, 1);
    str = str.replace(/[^\d]+/g, '');
    str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    if(minus == "-") str = "-"+str;
    return str;
}
// 계산기
$("#price_calcu").change(function(){
	var price_calcu = $("#price_calcu").val();
	$("#rst").html(price_calcu/181.44);
})
// 발주서
$("#order_price").change(function(){
	var order_price = $("#order_price").val();
	var order_length=$("#order_length").val()
	var sum=order_price*order_length;
	$("#order_sum").html(comma(sum));
})
// 원사발주서
var thread_total_price = 0;
$(".thread_price").change(function(){
	var thread_price= $(this).val();
	var prev1 = $(this).parent().prev().html();
	var sum1 = thread_price*parseInt(prev1);
	$(this).parent().next().html(comma(sum1)+"원");
	thread_total_price +=sum1;
	$("#price_total").html(comma(thread_total_price)+"원");
})
//  편직의뢰서
var knit_total_price = 0;
$(".knit_price").change(function(){
	var knit_price= $(this).val();
	var prev2 = $(this).parent().prev().children().html();
	console.log("prev2"+prev2);
	var sum2 = knit_price*parseInt(prev2);
	$(this).parent().next().html(comma(sum2)+"원");
	knit_total_price +=sum2;
	$("#knitprice_total").html(comma(knit_total_price)+"원");
})
$(document).ready(function(){
	var knitweight = document.getElementsByClassName("knitweight");
	var knitweight_total = 0;
	for(var i=0; i<knitweight.length; i++){
		knitweight_total += parseInt(knitweight[i].innerHTML);
	}
	$("#knitweight_total").html(knitweight_total);
	
	var dyeweight = document.getElementsByClassName("dyeweight");
	var dyeweight_total = 0;
	for(var i=0; i<dyeweight.length; i++){
		dyeweight_total += parseInt(dyeweight[i].innerHTML);
	}
	$("#dyeweight_total").html(dyeweight_total);
	
	$("#napping_total").html(dyeweight_total+"  kg");
	$("#packing_total").html($("#order_length").val()+"  yd");
})
// 염색의뢰서
var dye_total_price = 0;
$(".dye_price").change(function(){
	var dye_price= $(this).val();
	var prev3 = $(this).parent().prev().children().html();
	console.log(prev3);
	var sum3 = dye_price*parseInt(prev3);
	$(this).parent().next().html(comma(sum3)+"원");
	dye_total_price +=sum3;
	$("#dyeprice_total").html(comma(dye_total_price)+"원");
})
// 가공의뢰서
$("#napping").change(function(){
	var napping = $("#napping").val();
	var napping_total = $("#napping_total").html();
	var packing = $("#packing").val();
	var packing_total = $("#packing_total").html();
	$("#napping_price").html(comma(napping*parseInt(napping_total))+" 원");
	$("#work_total").html(comma(napping*parseInt(napping_total)+packing*parseInt(packing_total))+" 원");
})
$("#packing").change(function(){
	var napping = $("#napping").val();
	var napping_total = $("#napping_total").html();
	var packing = $("#packing").val();
	var packing_total = $("#packing_total").html();
	$("#packing_price").html(comma(packing*parseInt(packing_total))+" 원");
	$("#work_total").html(comma(napping*parseInt(napping_total)+packing*parseInt(packing_total))+" 원");
})
</script>








