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
			<li class="active"><a href="">일일</a></li>
			<li><a href="/purchase/monthly">월별</a></li>
		</ul>
	</div>
</nav>
<div align="center">
	<h1>매입 리스트</h1>
	<table>
		<thead>
			<tr>
				<th width="5%">NO</th>
				<th width="8%">발주일자</th>
				<th width="8%">Order No</th>
				<th width="7%">분류</th>
				<th width="7%">거래처</th>
				<th width="44%">매입내용</th>
				<th width="7%">금액</th>
				<th width="7%">입고수량</th>
				<th width="7%">입고일자</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>${i.no}</td>
				<td>${i.purchase_date}</td>
				<td>${i.order_no}</td>
				<td>${i.category}</td>
				<td>${i.company}</td>
				<td>${i.detail}</td>
				<td><input type="text" name="stock_in_date" value="${i.sum}"></td>
				<td><input type="text" name="stock_in_date" value="${i.quantity}"></td>
				<td><input type="text" name="stock_in_date" value="${i.stock_in_date }"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="/purchase/read?page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>> 
				<a href="/purchase/read?page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a href="/purchase/read?page=${pageMaker.endPage + 1}">&laquo;</a></li>
		</c:if>
	</ul>
</div> 
</div>