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
		<div class="form-group">
			<label for="orderNo">ORDER NO.:</label>
			<input type="text" class="form-control" id="orderNo">
		</div>
		<div class="form-group">
			<label for="company">발주처 담당자:</label>
			<input type="text" class="form-control" id="company">
		</div>
		<div class="form-group">
			<label for="sn">S/#:</label>
			<input type="text" class="form-control" id="sn">
		</div>
		<div class="form-group">
			<label for="orderDate">발주일:</label>
			<input type="text" class="form-control" id="orderDate">
		</div>
		<div class="form-group">
			<label for="endDate">납기일:</label>
			<input type="text" class="form-control" id="endDate">
		</div>
		<div class="form-group">
			<label for="fabric">원단명:</label>
			<input type="text" class="form-control" id="fabric">
		</div>
		<div class="form-group">
			<label for="width">가공폭:</label>
			<input type="text" class="form-control" id="width">
		</div>
		<div class="form-group">
			<label for="weight">가공중량:</label>
			<input type="text" class="form-control" id="weight">
		</div>
		<h3>Color</h3>
		<div id="addhtml">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="color">컬러:</label>
						<input type="text" class="form-control" id="color">
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