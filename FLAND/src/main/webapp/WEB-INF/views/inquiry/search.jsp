<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	table, th, td{
		text-align:center;
		border: 1px solid DodgerBlue;
		height:40px;
	}
	tr:hover {background-color:#f5f5f5;}
</style>
<nav class="navbar navbar-inverse">
	<ul class="nav navbar-nav">
		<li><a href="">일별</a></li>
		<li><a href="/inquiry/monthly?month=2018-01">월별</a></li>
		<li><a href="/inquiry/yearly?year=2018">연별</a></li>
		<form class="navbar-form navbar-right" action="/inquiry/daily" >
			<div class="form-group">
				<input type="date" name="date" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">조회</button>
			<a href="/input"><button type="button" class="btn btn-info">입력</button></a>
		</form>
	</ul>
<!-- 검색부분 -->
	<ul class="nav navbar-nav navbar-right" style="padding-right: 20px">
		<form class="navbar-form navbar-right" action="/inquiry/search" method="post">
			<div class="form-group">
				<input name="startDate" value="${vo.startDate }" placeholder="시작일자" class="form-control input-sm" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" size="5">
			</div>
			<div class="form-group">
				<input name="endDate" value="${vo.endDate }" placeholder="종료일자" class="form-control input-sm" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" size="5">
			</div>
			<div class="form-group">
				<select name="condition" class="form-control input-sm">
					<option value="내용">내용</option>
					<option value="비고">비고</option>
					<option value="금액">금액</option>
				</select>
			</div>
			<div class="form-group">
				<input name="detail" type="search" class="form-control input-sm" placeholder="검색내용">
			</div>
			<button type="submit" class="btn btn-success">조회</button>
		</form>
	</ul>
</nav>
<div align="center">
	<h1>검색결과</h1><hr/>
	<table width=90% border="1">
		<tr>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>검색조건</th>
			<th>검색내용</th>
		</tr>
		<tr>
			<td>${vo.startDate }</td>
			<td>${vo.endDate }</td>
			<td>${vo.condition }</td>
			<td>${vo.detail }</td>
		</tr>	
	</table><hr/>
	<table width=90%>
		<thead>
			<tr>
				<th>Date</th>
				<th>Account</th>
				<th>Method</th>
				<th>Name</th>
				<th>Item</th>
				<th>Detail</th>
				<th>Sum</th>
				<th>ETC</th>
			</tr>
		</thead>
		<tfoot>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>${i.tran_date}</td>
					<td>${i.account}</td>
					<td>${i.method}</td>
					<td>${i.client}</td>
					<td>${i.item}</td>
					<td>${i.detail}</td>
					<td>${i.sum}</td>
					<td>${i.etc}</td>
			</c:forEach>
		</tfoot>
	</table>
</div>
