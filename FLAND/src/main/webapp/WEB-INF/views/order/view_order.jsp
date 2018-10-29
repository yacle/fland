<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
th, td{
	text-align: center;
}
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li><a href="/input/input_order"><b>발주서</b></a></li>
    <li class="active"><a href=""><b>생산관리</b></a></li>
  </ul>
</nav>
<div class="col-lg-7">
	<h4>발주서</h4>
	<table class="table table-bordered">
		<tr>
			<th>발주일</th>
			<th>품번</th>
			<th>FABRIC</th>
			<th>색상</th>
			<th>수량(yd)</th>
			<th>단가</th>
		</tr>
		<c:forEach items="${order}" var="i">
			<tr>
				<td>${i.ORDER_DATE }</td>
				<td>${i.ORDER_NO}</td>
				<td>${i.FABRIC_NAME }</td>
				<td>${i.COLOR }</td>
				<td>${i.ORDER_QUANTITY }</td>
				<td>${i.ORDER_PRICE }</td>
			</tr>
		</c:forEach>	
	</table><hr/>
	<h4>원사</h4>
	<table class="table table-bordered">
		<tr>
			<th>원사명</th>
			<th>단가</th>
			<th>회사명</th>
			<th><button type="button" data-toggle="modal" data-target="#yarn_order">발주현황</button></th>
			<th><button type="button" data-toggle="modal" data-target="#yarn-in">입고현황</button></th>
		</tr>
		<c:forEach items="${yarn}" var="i">
			<tr>
				<td>${i.YARN }</td>
				<td>${i.YARN_PRICE }</td>
				<td>${i.YARN_COM }</td>		
				<td></td>		
				<td></td>				
			</tr>
		</c:forEach>
	</table><hr/>
	<h4>편직</h4>
	<table class="table table-bordered">
		<tr>
			<th>편직명</th>
			<th>단가</th>
			<th>편직처</th>
			<th>발주현황</th>
			<th>출고현황</th>
		</tr>
		<c:forEach items="${knit}" var="i">
			<tr>
				<td>${i.KNIT }</td>
				<td>${i.KNIT_PRICE }</td>	
				<td>${i.KNIT_COM }</td>		
				<td></td>		
				<td></td>				
			</tr>
		</c:forEach>
	</table><hr/>
	<h4>염색</h4>
	<table class="table table-bordered">
		<tr>
			<th>컬  러</th>
			<th>단가</th>
			<th>염색처</th>
			<th>발주현황</th>
			<th>출고현황</th>
		</tr>
		<c:forEach items="${dye}" var="i">
			<tr>
				<td>${i.DYEING }</td>
				<td>${i.DYE_PRICE }</td>	
				<td>${i.DYEING_COM }</td>	
				<td></td>		
				<td></td>				
			</tr>
		</c:forEach>
	</table><hr/>
	<h4>가공</h4>
	<table class="table table-bordered">
		<tr>
			<th>가공방법</th>
			<th>단가</th>
			<th>가공처</th>
			<th>발주현황</th>
			<th>출고현황</th>
		</tr>
		<c:forEach items="${process}" var="i">
			<tr>
				<td>${i.PROCESS }</td>
				<td>${i.PROCESS_PRICE }</td>		
				<td>${i.PROCESS_COM }</td>		
				<td></td>			
				<td></td>				
			</tr>
		</c:forEach>
	</table><hr/>
	<h4>출고</h4>
	<table class="table table-bordered">
		<tr>
			<th>발주량</th>
			<th>출고량</th>
			<th>과부족</th>
			<th>출고수량</th>
			<th>단가</th>
			<th>출고처</th>
		</tr>
			<tr>
				<td></td>
				<td></td>		
				<td></td>		
				<td></td>		
				<td></td>	
				<td></td>				
			</tr>
	</table><hr/>
</div>
<div class="col-lg-5">
	<h4>생산비</h4>
	<table class="table table-bordered">
		<tr>
			<th>총계</th>
			<th>원사</th>
			<th>편직</th>
			<th>염색</th>
			<th>가공</th>
			<th>포장</th>
		</tr>
		<tr>
			<td></td>
			<td></td>		
			<td></td>		
			<td></td>		
			<td></td>		
			<td></td>				
		</tr>
	</table><hr/>
	<table class="table table-bordered">
		<tr>
			<th>발주금액</th>
			<th>총생산비</th>
			<th>일반관리비</th>
			<th>이익</th>
			<th>이익률</th>
		</tr>
		<tr>
			<td></td>
			<td></td>		
			<td></td>		
			<td></td>		
			<td></td>		
		</tr>
	</table><hr/>
</div>
<!-- 원사 입고현황 모달 -->
<div class="modal fade" id="yarn-in" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form action="/manage/yarn_in" method="post">
		<div class="modal-content">
			<div class="modal-header"><h3>원사입고 현황</h3></div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>원사명</th>
						<th>발주일자</th>
						<th>발주수량</th>
					</tr>
					<c:forEach begin="1" end="9" step="1">
						<tr>
							<td><input type="text" class="form-control" name="yarn" value=""></td>
							<td><input type="date" class="form-control" name="yarn_date" value=""></td>
							<td><input type="number" class="form-control" name="yarn_quantity" value=""></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<input type="hidden" name="ORDER_NO" value="${order_no}">
				<button type="submit">저장</button>
			</div>
		</div>
		</form>
	</div>
</div>
