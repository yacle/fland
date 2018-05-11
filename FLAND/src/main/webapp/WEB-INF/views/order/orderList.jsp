<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
table{
	width: 90%;
}
.text-center{
	text-align: center;
}
table, td, th{
	border: 1px solid blue;
	text-align: center;
	height: 35px;
}
tr:hover {background-color:#f5f5f5;}
</style>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Admin</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/order/new">발주서</a></li>
			<li><a href="/order/dye">염색의뢰서</a></li>
			<li><a href="/order/knit">편직의뢰서</a></li>
			<li class="active"><a href="#">원사발주서</a></li>
		</ul>
	</div>
</nav>
<div align="center">
	<h1>ORDER LIST</h1>
	<table>
		<thead>
			<tr>
				<th width="2%">NO</th>
				<th width="7%">Order No</th>
				<th width="5%">발주일자</th>
				<th width="8%">발주처</th>
				<th width="10%">품명</th>
				<th width="9%">컬러</th>
				<th width="9%">발주량</th>
				<th width="5%">발주기한</th>
				<th width="5%">작업지시서</th>
				<th width="5%">진행상황</th>
				<th width="5%">원가분석</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>${i.no}</td>
				<td>${i.orderno}</td>
				<td>${i.orderdate}</td>
				<td>${i.company} / ${i.person}</td>
				<td>${i.fabric}</td>
				<td>${i.color}</td>
				<td>${i.orderlength}</td>
				<td>${i.enddate}</td>
				<td><a href="/print/read?orderno=${i.orderno}"><input type="button" value="작업지시서"></a></td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="/order/orderList?page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>> 
				<a href="/order/orderList?page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a href="/order/orderList?page=${pageMaker.endPage + 1}">&laquo;</a></li>
		</c:if>
	</ul>
</div> 
</div>