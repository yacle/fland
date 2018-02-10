<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
table{
	border-collapse: collapse;
	table-layout: fixed;
}
td{
	padding:0px;
	text-align:right;
	font-size:9px;
}
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li><a id="date" href="">일일</a></li>
    <li class="active"><a href="">종합</a></li>
    <form class="navbar-form navbar-right" action="/inquiry/month">
      <div class="form-group">
        <input type="month" name="month" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">조회</button>
    </form>
  </ul>
</nav>
<div align="center">
	<h2>[${month}월 자금 실적서]</h2>
</div>
<div style="overflow-y:auto;">
<table border="1">
	<tr>
		<td>구분</td>
		<td colspan="2">일자</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>월계</td>
	</tr>
	<tr>
		<td colspan="3">기초잔액(A)</td>
		<c:forEach var="i" begin="1" end="31">
			<td style="width:57px;">a</td>
		</c:forEach>
		<td>기초잔액(A)합계</td>
	</tr>
	<tr>
		<td rowspan="8">입 금</td>
		<td rowspan="2">영업수입</td>
		<td>매출</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	<tr>
		<td>업체환급</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>업체환급 합계</td>
	</tr>
	<tr>
		<td rowspan="5">영업외수입</td>
		<td>이체</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>이체합계</td>
	</tr>
	<tr>
		<td>금융이자</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>금융이자합계</td>
	</tr>
	<tr>
		<td>차입금</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>차입금합계</td>
	</tr>
	<tr>
		<td>카드취소</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>카드취소합계</td>
	</tr>
	<tr>
		<td>세금환급</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>세금환급합계</td>
	</tr>
	<tr>
		<td colspan="2">입금계(B)</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>입금합계</td>
	</tr>
	<tr>
		<td rowspan="20">출 금</td>
		<td>매입출금</td>
		<td>거래처결제</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>거래처결재합계</td>
	</tr>
	<tr>
		<td rowspan="18">기타운영</td>
		<td>이체</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>이체합계</td>
	</tr>
	<tr>
		<td>경비</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>경비합계</td>
	</tr>
	<tr>
		<td>접대비</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>접대비합계</td>
	</tr>
	<tr>
		<td>대표자경비</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>대표자경비합계</td>
	</tr>
	<tr>
		<td>식대</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>식대합계</td>
	</tr>
	<tr>
		<td>회식</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>회식합계</td>
	</tr>
	<tr>
		<td>대표자차량</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>대표자차량합계</td>
	</tr>
	<tr>
		<td>원단물류비</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>원단물류비합계</td>
	</tr>
	<tr>
		<td>기타</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>기타합계</td>
	</tr>
	<tr>
		<td>임대관리비</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>임대관리비합계</td>
	</tr>
	<tr>
		<td>한정신차량</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>한정신차량합계</td>
	</tr>
	<tr>
		<td>박성진차량</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>박성진차량합계</td>
	</tr>
	<tr>
		<td>박성진식대</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>박성진식대합계</td>
	</tr>
	<tr>
		<td>급여</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>급여합계</td>
	</tr>
	<tr>
		<td>차입금상환</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>차입금상환합계</td>
	</tr>
	<tr>
		<td>대출</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>대출합계</td>
	</tr>
	<tr>
		<td>세금</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>세금합계</td>
	</tr>
	<tr>
		<td>4대보험</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>4대보험합계</td>
	</tr>
	<tr>
		<td colspan="2">출금계(C)</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>출금합계</td>
	</tr>
	<tr>
		<td colspan="3">자금과부족(B-C)</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>자금과부족합계</td>
	</tr>
	<tr>
		<td colspan="3">기말잔액(A+B-C)</td>
		<c:forEach var="i" begin="1" end="31">
			<td>${i}</td>
		</c:forEach>
		<td>기말잔액합계</td>
	</tr>
</table>
</div>
<script>
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
	console.log(yy+mm+dd);
	document.getElementById("date").href="/inquiry/daily?date="+yy+"-"+mm+"-"+dd;
</script>