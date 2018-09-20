<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
th, td{
	text-align: center;
}
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li class="active"><a href=""><b>발주서</b></a></li>
    <li><a href="/manage/view_order"><b>생산관리</b></a></li>
  </ul>
</nav>
<div class="col-lg-8">
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
			<th>발주일자</th>
			<th>발주수량</th>
			<th>입고일자</th>
			<th>입고수량</th>
		</tr>
		<c:forEach items="${yarn}" var="i">
			<tr>
				<td>${i.YARN }</td>
				<td>${i.YARN_PRICE }</td>
				<td>${i.YARN_COM }</td>		
				<td>${i.YARN_ORDER_DATE }</td>		
				<td>${i.YARN_ORDER_QUANTITY}</td>		
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
			<th>발주일자</th>
			<th>발주수량</th>
			<th>출고일자</th>
			<th>출고수량</th>
		</tr>
		<c:forEach items="${knit}" var="i">
			<tr>
				<td>${i.KNIT }</td>
				<td>${i.KNIT_PRICE }</td>	
				<td>${i.KNIT_COM }</td>		
				<td>${i.KNIT_ORDER_DATE }</td>		
				<td>${i.KNIT_ORDER_QUANTITY }</td>		
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
			<th>발주일자</th>
			<th>발주수량</th>
			<th>출고일자</th>
			<th>출고수량</th>
		</tr>
		<c:forEach items="${dye}" var="i">
			<tr>
				<td>${i.DYEING }</td>
				<td>${i.DYE_PRICE }</td>	
				<td>${i.DYEING_COM }</td>	
				<td>${i.DYE_ORDER_DATE }</td>		
				<td>${i.DYE_ORDER_QUANTITY }</td>		
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
			<th>발주일자</th>
			<th>발주수량</th>
			<th>출고일자</th>
			<th>출고수량</th>
		</tr>
		<c:forEach items="${process}" var="i">
			<tr>
				<td>${i.PROCESS }</td>
				<td>${i.PROCESS_PRICE }</td>		
				<td>${i.PROCESS_COM }</td>		
				<td>${i.PROCESS_ORDER_DATE }</td>
				<td>${i.PROCESS_ORDER_QUANTITY }</td>			
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
			<th>출고일자</th>
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
				<td></td>				
			</tr>
	</table><hr/>
</div>
<div class="col-lg-4">
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
