<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<script src="/resources/printThis.js"></script>
</head>
<style>
#div1{
	width:730px;
	height:990px;
	border: none;
    margin: 20px;
    padding: 0px;
    text-align: center;
}
table{
	width: 96%;
	border-collapse: collapse;
}
table, th, td {
	border: 1px solid black;
	text-align: center;
	font-size: 13px;
	height: 31.5px;
}
p {
    font-size: 3px;
    text-align: left;
    padding-left: 15px;
}
.logo{
	position: absolute;
	left: 575px;
	top: 1050px;
}
input{
	text-align: center;
	border: none;
}
</style>

<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/order/orderList">LIST</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/print/dye">염색의뢰서</a></li>
			<li><a href="/print/knit">편직의뢰서</a></li>
			<li><a href="/print/work">가공의뢰서</a></li>
			<li><a href="/print/threadOrder">원사발주서</a></li>
			<li><a href="/print/precosting">사전원가계산서</a>
		</ul>
	</div>
</nav>
<div class="row">
	<div class="col-lg-4" align="center">
		<button type="button" class="btn btn-success" style="margin-top: 300px;" id="btnPrint" >프린트</button> 
	</div>
	<div  class="col-lg-4" align="center">
		<div id="div1"><br/>
			<h2>[염색의뢰서]</h2><br/>
			<table>
				<tr>
					<th colspan="3" style="border-style: hidden solid solid hidden;"></th>
					<th width="12%">담당</th>
					<th width="12%">부장</th>
					<th width="14%">대표</th>
				</tr>
				<tr>
					<th width="22%">날짜</th>
					<th width="25%">ORDER NO</th>
					<th width="15%">Sample NO</th>
					<th rowspan="2" width="12%"></th>
					<th rowspan="2" width="12%"></th>
					<th rowspan="2" width="14%"></th>
				</tr>
				<tr>
					<td><input type="text" value="${data.ORDERDATE }" placeholder="ex) 2018/03/12"></td>
					<td>${data.ORDERNO }</td>
					<td></td>
				</tr>
			</table>
			<table>
				<tr>
					<th colspan="2">생지출고처</th>
					<th colspan="3">염색처</th>
				</tr>
				<tr>
					<td width="22%">${data.KNITCOMPANY }</td>
					<td width="25%"></td>
					<td width="15%">${data.DYECOMPANY }</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th colspan="2">품명</th>
					<th>원단가공폭</th>
					<th colspan="2">원단가공중량</th>
				</tr>
				<tr>
					<td colspan="2">${data.FABRIC }</td>
					<td>${data.WORKWIDTH-2 } / ${data.WORKWIDTH }</td>
					<td><fmt:formatNumber value="${data.WORKWEIGHT/(0.02323*data.WORKWIDTH)}" pattern="0"/> g/m2</td>
					<td>${data.WORKWEIGHT } g/yd</td>
				</tr>
				<tr>
					<th colspan="5">원단가공 세부사항</th>
				</tr>
				<tr>
					<td>원단 혼용율</td>
					<td colspan="4">${data.MIXED }</td>
				</tr>
				<tr>
					<td>가공방법</td>
					<td colspan="4">${data.METHOD }</td>
				</tr>
				<tr>
					<td>세부사항</td>
					<td colspan="4">${data.DETAIL }</td>
				</tr>
			</table>
			<table>
				<tr>
					<th rowspan="2" width="22%">품명</th>
					<th rowspan="2">색상</th>
					<th colspan="3">염색수량</th>
					<th rowspan="2">BT NO.</th>
					<th rowspan="2">발주량</th>
				</tr>
				<tr>
					<th>KG</th>
					<th>절수</th>
					<th>수량</th>
				</tr>
			<c:forEach var="idx" begin="0" end="6">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="2">합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<table>
				<tr>
					<th rowspan="3" width="22%">시험의뢰</th>
					<th width="16%">색상</th>
					<th width="16%">염색견뢰도</th>
					<th width="16%">축률</th>
					<th width="15%">필링</th>
					<th width="15%">사행도</th>
				</tr>
			<c:forEach var="idx" begin="0" end="1">
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</c:forEach>
				<tr>
					<th>기타사항</th>
					<th colspan="5">${data.DYEETC }</th>
				</tr>
				<tr>
					<th>주의사항</th>
					<th colspan="5">${data.CAUTION }</th>
				</tr>
				<tr>
					<th>출고처</th>
					<th colspan="5">${data.DELIVERY }</th>
				</tr>
			</table><br/>
			<p>본 의뢰서에 근거하여 작업한 물품이 상기 내용과 다름으로 인하여 발생되는 문제와 관련하여 수탁자는 위탁자의 손해를 배상할 의무를 가진다.</p>
			<p>주소 : 서울시 노원구 노원로 15길 10, 부대동 305호(하계동, 하계테크노타운)  TEL : 02-949-9362 / FAX : 02-949-9363 / EMAIL : fabricland@kita.net</p>
			<img src="/resources/flandCI.png" class="logo" width="150">	
		</div>
	</div>
	<div class="col-lg-4">
	</div>
</div>
</body>
</html>
<script>
	$("#btnPrint").click(function(){
		$("#div1").printThis({
				importCSS: true,	
				importStyle: true,
				printContainer: true,
				header: null,              
				footer: null
		});
	})
</script>




