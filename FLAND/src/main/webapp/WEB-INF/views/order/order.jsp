<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).on('click','.add', function(){
		var getHtml = $('#formgroupcopy').html();
		$('#addhtml').append(getHtml);
	});
	$(document).on('click','.del', function(){
		$(this).parent().parent().remove();
	})
</script>
<style>
.col-lg-3{
	border: 2px solid red;
    border-radius: 5px;
    padding: 20px;
}
</style>
<div class="row">
	<div class="col-lg-3">
		<h1>발주서</h1>
		<table width=95%>
			<tr>
				<td width=20%>Order No</td>
				<td colspan="2"><input type="text" class="form-control" id="orderNo"></td>
			</tr>
			<tr>
				<td>발주처 담당자</td>
				<td colspan="2"><input type="text" class="form-control" id="company"></td>
			</tr>
			<tr>
				<td>S/#</td>
				<td colspan="2"><input type="text" class="form-control" id="sn"></td>
			</tr>
			<tr>
				<td>발주일</td>
				<td colspan="2"><input type="text" class="form-control" id="orderDate"></td>
			</tr>
			<tr>
				<td>납기일</td>
				<td colspan="2"><input type="text" class="form-control" id="endDate"></td>
			</tr>
			<tr>
				<td>원단명</td>
				<td colspan="2"><input type="text" class="form-control" id="fabric"></td>
			</tr>
			<tr>
				<td>가공폭</td>
				<td colspan="2"><input type="text" class="form-control" id="width"></td>
			</tr>
			<tr>
				<td>가공중량</td>
				<td colspan="2"><input type="text" class="form-control" id="weight"></td>
			</tr>
			<tr>
				<td>컬러</td>
				<td>Order Length</td>
				<td>BT No.</td>
			</tr>
			<tr>
				
				<td><input type="text" class="form-control" id="color">/td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<h3>Color</h3>
		<div id="addhtml">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="color">컬러:</label>
						
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" >
						<label for="colorTTL">컬러별 오더:</label>
						<input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="colorBT">컬러별 BT:</label>
						<input type="text" class="form-control" id="colorBT">
					</div>
				</div>
				<div class="col-md-1" style="padding: 29px 0;">
					<button type="button" class="add">추가</button>
				</div>
			</div>
		</div>
		<b>Order Total :<span id="ttl"></span></b><br/>
		<div class="form-group">
			<label for="price">단가:</label>
			<input type="text" class="form-control" id="price">
		</div>
		<button type="button" class="btn btn-primary">저장</button>
	</div>
	<div class="col-lg-3">
		염색의뢰서
	</div>
	<div class="col-lg-3">
		편직의뢰서
	</div>
	<div class="col-lg-3">
		원사발주서
	</div>
</div>
<!-- 컬러 추가 HTML -->
<div id="formgroupcopy" style="display:none;">
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<input type="text" class="form-control" id="color">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group" >
				<input type="number" class="form-control ttl" style="text-align: right;" placeholder="YD">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<input type="text" class="form-control" id="colorBT">
			</div>
		</div>
		<div class="col-md-1" style="padding: 5px 0;">
			<button type="button" class="del">삭제</button>
		</div>
	</div>
</div>				
<script>
$(".ttl").change(function(){
	var total=0;
	var sum=document.getElementsByClassName("ttl");
	for(var i=0; i<sum.length-1; i++){
		var s = sum[i].value;
		total += parseInt(s);
	};
	$("#ttl").html(total);
})
</script>