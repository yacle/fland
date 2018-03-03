<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
div{
	overflow-x:auto;
}
table{
	border-collapse: collapse;
	width:100%;
}
td{
	padding:0px;
	text-align:center;
	font-size:13px;
	height:30px;
}
tr:hover {background-color:#f5f5f5;}
th{
	text-align: center;
	font-size:12px;
	background-color: #FFFF00;
}
tr{
	height: 35px;
}
</style>
<nav class="navbar navbar-inverse">
	<ul class="nav navbar-nav">
	    <li><a id="date" href="">일별</a></li>
	    <li><a href="/inquiry/monthly?month=2018-01">월별</a></li>
	    <li class="active"><a href="">연별</a></li>
	    <form class="navbar-form navbar-right" action="/inquiry/yearly">
			<div class="form-group">
				<select class="form-control" name="year">
					<option>2018</option>
					<option>2019</option>
				</select>
			</div>
			<button type="submit" class="btn btn-default">조회</button>
		</form>
	</ul>
</nav>
<div id="print">
<div align="center">
	<h2>[<span id="year">${year}</span>년 자금 실적서]</h2>
</div>
<div>
<table border="1">
	<tr>
		<th width="50px">구분</th>
		<th colspan="2">내역</th>
		<c:forEach var="i" begin="1" end="12">
			<th style="width:90px;" class="sel-date" value="${i}">${i}</th>
		</c:forEach>
		<th style="width:100px;">합계</th>
	</tr>
	<tr>
		<td rowspan="7">입 금</td>
		<td width="80px" rowspan="2">영업수입</td>
		<td width="90px">매출</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item01[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item01Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>업체환급</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item02[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item02Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td rowspan="4">영업외수입</td>
		<td>금융이자</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item03[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item04Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>차입금</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item04[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item05Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>카드취소</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item05[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item06Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>세금환급</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item06[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item07Sum}" groupingUsed="true"/></td>
	</tr>
	<tr style="background-color:#FFFF00">
		<td colspan="2">입금계(B)</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${incomeSum[i] }" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${incomeTotal}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td rowspan="19">출 금</td>
		<td rowspan="2">매입출금</td>
		<td>대금결제</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item07[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item08Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>기타물류비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item08[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item08Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td rowspan="5">고정비</td>
		<td>임대관리비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item09[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item09Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>급여</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item10[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item10Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>차입금상환</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item11[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item11Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>세금</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item12[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item12Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>4대보험</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item13[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item13Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td rowspan="11">변동비</td>
		<td>접대비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item14[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item14Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>대표자-차량</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item15[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item15Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>대표자-경비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item16[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item16Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>박성진-차량</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item17[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item17Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>박성진-식대</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item18[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item18Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>박성진-경비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item19[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item19Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>한정신-차량</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item20[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item20Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>한정신-식대</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item21[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item21Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>한정신-경비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item22[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item22Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>공용-식대</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item23[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item23Sum}" groupingUsed="true"/></td>
	</tr>
	<tr>
		<td>공용-경비</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${item24[i]}" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${item24Sum}" groupingUsed="true"/></td>
	</tr>
	<tr style="background-color:#F4A460;">
		<td colspan="2">출금계(C)</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right;"><fmt:formatNumber value="${expenseSum[i] }" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${expenseTotal}" groupingUsed="true"/></td>
	</tr>
	<tr style="background-color:#E0FFFF">
		<td colspan="3">자금과부족(B-C)</td>
		<c:forEach var="i" begin="0" end="11">
			<td style="text-align:right; color:red;"><fmt:formatNumber value="${incomeSum[i] + expenseSum[i] }" groupingUsed="true"/></td>
		</c:forEach>
		<td><fmt:formatNumber value="${incomeTotal + expenseTotal}" groupingUsed="true"/></td>
	</tr>
</table>
</div>
</div>
<button type="button" onclick="javascript:divPrint()">출력</button>
<script>
// 일일 조회로 이동
	var date=new Date();
	var yy=date.getFullYear();
	var mm=date.getMonth()+1;
	if(mm<10){
		mm = '0'+mm;
	}
	var dd=date.getDate();
	if(dd<10){
		dd = '0'+dd;
	}
	document.getElementById("date").href="/inquiry/daily?date="+yy+"-"+mm+"-"+dd;
	
// 선택월로 이동
	$(".sel-date").dblclick(function(){
		var mon = this.innerHTML;
		if(mon<10){
			mon = "0"+mon;
		}
		var year = $("#year").html();
		window.location ="/inquiry/monthly?month="+year+"-"+mon;
	})
	
// 프린트
	function divPrint(){
	var initBody = document.body.innerHTML;
	printID1.style.display = "none";
	printID2.style.display = "none";
	window.onbeforeprint = function(){
		document.body.innerHTML = document.getElementById('print').innerHTML;
	}
	window.onafterprint = function(){
		document.body.innerHTML = initBody;
	}
	window.print();
}
</script>