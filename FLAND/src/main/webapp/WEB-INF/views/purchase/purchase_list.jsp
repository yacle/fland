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
				<th width="39%">매입내용</th>
				<th width="7%">금액</th>
				<th width="7%">입고수량</th>
				<th width="7%">입고일자</th>
				<th width="5%">수정</th>
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
				<td align="left">${i.detail}</td>
				<td>${i.sum}</td>
				<td>${i.quantity}</td>
				<td>${i.stock_in_date }</td>
				<td><button class="sel-com" data="${i.no }">입력</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
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
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body" style="padding:20px 30px; text-align: center;">
				<form role="form" id="updateModal">
					<table id="modalTable">
						<tr>
							<td>Order No</td>
							<td><input type="text" name="order_no" id="order_no" value=""></td>
						</tr>
						<tr>
							<td>금액</td>
							<td><input type="number" name="sum" id="sum" value=""></td>
						</tr>
						<tr>
							<td>입고수량</td>
							<td><input type="text" name="quantity" id="quantity" value=""></td>
						</tr>
						<tr>
							<td>입고일자</td>
							<td><input type="text" name="stock_in_date" id="stock_in_date" value=""></td>
						</tr>
					</table><br/>
					<input type="hidden" name="no" id="no" value="">
					<button type="button" id="updateBtn" class="btn btn-success">수정</button>
					<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
				</form>
			</div>
		</div>
	</div>
</div>	   
<script>
// 수정 modal
$(".sel-com").click(function(){
	var no = $(this).attr("data");
	var date = $("#modalDate").html();
	if(no!=""){
		$.getJSON("/purchase/modify?no="+no, function(data){
			$("#order_no").val(data.order_no);
			$("#sum").val(data.sum);
			$("#quantity").val(data.quantity);
			$("#stock_in_date").val(data.stock_in_date);
			$("#no").val(no);
			$("#myModal").modal();
		})
	}
})

$("#updateBtn").click(function(){
	var data = $("#updateModal").serialize();
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/purchase/update",
		"data":data,
		success:function(){
			$("#myModal").modal("hide");
			location.reload();
		}
	})
})

$("#deleteBtn").click(function(){
	if(window.confirm("정말 삭제하시겠습니까?")){
		var no = $("#no").val();
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/purchase/delete",
			"data":no,
			success:function(){
				$("#myModal").modal("hide");
				location.reload();
			}
		})
	}else{
		$("#myModal").modal("hide");
	}
})
</script>