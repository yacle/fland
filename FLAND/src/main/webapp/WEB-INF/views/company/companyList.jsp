<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table{
		width:100%;
	}
	table, th, td{
		text-align:center;
		border: 1px solid DodgerBlue;
		height:30px;
	}
	tr:hover {background-color:#f5f5f5;}
</style>
<div align="center">
<h1>거래처 목록</h1>
</div>
<div>
	<table>
		<thead>
			<tr>
				<th>구분</th>
				<th>업체명</th>
				<th>품목</th>
				<th>직급</th>
				<th>담당</th>
				<th>이메일</th>
				<th>핸드폰</th>
				<th>회사전화</th>
				<th>팩스</th>
				<th>주소</th>
				<th>은행명</th>
				<th>예금주</th>
				<th>계좌번호</th>
				<th>사업자등록번호</th>
				<th>업태</th>
				<th>종목</th>
				<th>대표자명</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="i" items="${list}">
			<tr class="sel-com" data="${i.NAME }" >
				<td>${i.DIV }</td>
				<td>${i.NAME }</td>
				<td>${i.ITEM }</td>
				<td>${i.CLASS }</td>
				<td>${i.PERSON }</td>
				<td>${i.EMAIL }</td>
				<td>${i.PHONE_CELL }</td>
				<td>${i.PHONE_COM }</td>
				<td>${i.FAX }</td>
				<td>${i.ADDRESS }</td>
				<td>${i.BANK }</td>
				<td>${i.ACCOUNT_NUM}</td>
				<td>${i.ACCOUNT_NAME }</td>
				<td>${i.LICENSE_NUM}</td>
				<td>${i.TYPE1}</td>
				<td>${i.TYPE2}</td>
				<td>${i.CEO}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding:35px 50px;">
				<h4><span id="name"></span></h4>
			</div>
			<div class="modal-body" style="padding:40px 50px;">
				<form role="form">
			            
				</form>
			</div>
			<div class="modal-footer">
		        <button type="submit">저장</button>
			</div>
		</div>
	</div>
</div>	   
<script>
$(".sel-com").click(function(){
	var name = $(this).attr("data");
	console.log(name);
	$.getJSON("/company/readOne?name="+name, function(data){
		console.log(data.item);
	})
})
</script>