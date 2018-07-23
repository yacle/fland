<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- nav -->
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Admin</a>
		</div>
		<ul class="nav navbar-nav justify-content-center">
			<li class="active"><a href="#">원사발주서</a></li>
			<li><a href="/sample/sample_knit">편직의뢰서</a></li>
			<li><a href="/sample/sample_dye">염색의뢰서</a></li>
			<li><a href="/sample/sample_precosting">샘플원가계산서</a></li>
		</ul>
	</div>
</nav>
<div>
	<h3>[샘플의뢰서]</h3>
		<form action="/sample/sample_order_save" method="POST">
			<table>
				<tr>
					<td width=30%>Sample No</td>
					<td colspan="2"><input type="text" class="form-control" id="sampleNo" required></td>
				</tr>
				<tr>
					<td>샘플의뢰처</td>
					<td><input type="text" class="form-control" id="company" placeholder="발주회사"></td>
					<td><input type="text" class="form-control" id="person" placeholder="담당자"></td>
				</tr>
				<tr>
					<td>발주일</td>
					<td colspan="2"><input type="date" class="form-control" id="orderDate" ></td>
				</tr>
				<tr>
					<td>납기일</td>
					<td colspan="2"><input type="date" class="form-control" id="endDate" ></td>
				</tr>
				<tr>
					<td>원단명</td>
					<td colspan="2"><input type="text" class="form-control" id="fabric"></td>
				</tr>
				<tr>
					<td>원사종류</td>
					<td colspan="2"><input type="text" class="form-control" id="thread"></td>
				</tr>
				<tr>
					<td>편직처</td>
					<td colspan="2"><input type="text" class="form-control" id="knit_com"></td>
				</tr>
				<tr>
					<td>염색/가공처</td>
					<td colspan="2"><input type="text" class="form-control" id="dye_com"></td>
				</tr>
				<tr>
					<td>가공폭(inch)</td>
					<td colspan="2"><input type="number" class="form-control" id="workWidth" ></td>
				</tr>
				<tr>
					<td>가공중량</td>
					<td><input type="text" class="form-control" id="mWeight" placeholder="g/m2"></td>
				</tr>
			</table>
			<button>저장</button>
		</form>
</div>
