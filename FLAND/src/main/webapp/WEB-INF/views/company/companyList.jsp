<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table{
		width:100%;
	}
	table, th, td{
		text-align:center;
		border: 1px solid DodgerBlue;
		height:40px;
		padding:0px;
	}
	tr:hover {background-color:#f5f5f5;}
	input{
		height:39px;
		border: none;
		box-sizing: border-box;
		margin:0px;
	}
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
	<div class="modal-dialog modal-lg">
<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding:20px 35px;">
				<h2><span id="name"></span></h2>
			</div>
			<div class="modal-body" style="padding:20px 30px;">
				<form role="form" action="/company/update">
					<table>
						<tr>
							<td>분류</td>
							<td colspan="2"><input id="div" name="div" value="" size="44"></td>
							<td colspan="2"><input id="item" name="item" placeholder="품목" value="" size="44"/></td>
						</tr>
						<tr>
							<td>담당자</td>
							<td><input id="class" name="class" value=""></td>
							<td><input id="person" name="person" value=""></td>
							<td><input id="phone_cell" name="phone_cell" value=""></td>
							<td><input id="phone_com" name="phone_com" value=""></td>
						</tr>
						<tr>
							<td>Email/Fax</td>
							<td colspan="2"><input id="email" name="email" value="" size="44"></td>
							<td colspan="2"><input id="fax" name="fax" value="" size="44"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="4"><input id="address" name="address" value="" size="90"></td>
						</tr>
						<tr>
							<td>계좌</td>
							<td><input id="bank" name="bank" value=""></td>
							<td><input id="account_name" name="account_name" value=""></td>
							<td colspan="2"><input id="account_num" name="account_num" value="" size="44"></td>
						</tr>
						<tr>
							<td>사업자</td>
							<td><input id="ceo" name="ceo" value=""></td>
							<td><input id="type1" name="type1" value=""></td>
							<td><input id="type2" name="type2" value=""></td>
							<td><input id="license_num" name="license_num" value=""></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-success btn-block">저장</button>
				</form>
			</div>
		</div>
	</div>
</div>	   
<script>
$(".sel-com").dblclick(function(){
	var name = $(this).attr("data");
	$.getJSON("/company/readOne?name="+name, function(data){
		$("#name").html(data.name);
		$("#div").val(data.div);
		$("#item").val(data.item);
		$("#class").val(data.clas);
		$("#person").val(data.person);
		$("#phone_cell").val(data.phone_cell);
		$("#phone_com").val(data.phone_coml);
		$("#email").val(data.email);
		$("#fax").val(data.fax);
		$("#address").val(data.address);
		$("#bank").val(data.bank);
		$("#account_name").val(data.account_name);
		$("#account_num").val(data.account_num);
		$("#ceo").val(data.ceo);
		$("#type1").val(data.type1);
		$("#type2").val(data.type2);
		$("#license_num").val(data.license_num);
		$("#myModal").modal();
	})
})
</script>