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
		font-weight: bold;
	}
	tr:hover {background-color:#f5f5f5;}
	input{
		width: 100%;
		height:39px;
		border: none;
		margin:0px 0;
		box-sizing: border-box;
	}
	textarea{
		width: 100%;
	    padding: 12px 20px;
	    margin: 0px 0;
	    box-sizing: border-box;
	}
</style>
<div align="center">
	<div class="row">
		<div class="col-lg-11" style="padding-left:200px;" align="center"><h1><b>거래처목록</b></h1></div>
		<div class="col-lg-1" style="margin-top:20px;"><button class="btn btn-info" type="button" id="reg">등록</button></div>
	</div><br/>
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
			<tr class="sel-com" data="${i.name }" >
				<td>${i.dvs }</td>
				<td>${i.name }</td>
				<td>${i.item }</td>
				<td>${i.clas }</td>
				<td>${i.person }</td>
				<td>${i.email }</td>
				<td>${i.phone_cell }</td>
				<td>${i.phone_com }</td>
				<td>${i.fax }</td>
				<td>${i.address }</td>
				<td>${i.bank }</td>
				<td>${i.account_num}</td>
				<td>${i.account_name }</td>
				<td>${i.license_num}</td>
				<td>${i.type1}</td>
				<td>${i.type2}</td>
				<td>${i.ceo}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>
 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding:20px 35px;">
				<h2><input id="name" name="name" placeholder="회사명" value="" size="44"/></h2>
			</div>
			<div class="modal-body" style="padding:20px 30px;">
				<form role="form" action="/company/update" method="post">
					<table width="95%">
						<tr>
							<td width="15%">분류</td>
							<td colspan="2"><input id="dvs" name="dvs" placeholder="구분" value=""></td>
							<td colspan="2"><input id="item" name="item" placeholder="품목" value=""/></td>
						</tr>
						<tr>
							<td>담당자</td>
							<td><input id="clas" name="clas" placeholder="직급" value=""></td>
							<td><input id="person" name="person" placeholder="담당자명" value=""></td>
							<td><input id="phone_cell" name="phone_cell" placeholder="핸드폰" value=""></td>
							<td><input id="phone_com" name="phone_com" placeholder="회사전화번호" value=""></td>
						</tr>
						<tr>
							<td>Email/Fax</td>
							<td colspan="2"><input id="email" name="email" placeholder="이메일" value=""></td>
							<td colspan="2"><input id="fax" name="fax" placeholder="팩스번호" value=""></td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="4"><input id="address" name="address" placeholder="회사주소" value=""></td>
						</tr>
						<tr>
							<td>계좌</td>
							<td><input id="bank" name="bank" placeholder="은행" value=""></td>
							<td><input id="account_name" name="account_name" placeholder="예금주" value=""></td>
							<td colspan="2"><input id="account_num" name="account_num" placeholder="계좌번호" value=""></td>
						</tr>
						<tr>
							<td>사업자</td>
							<td><input id="ceo" name="ceo" placeholder="대표자명" value=""></td>
							<td><input id="type1" name="type1" placeholder="업태" value=""></td>
							<td><input id="type2" name="type2" placeholder="종목" value=""></td>
							<td><input id="license_num" name="license_num" placeholder="사업자번호" value=""></td>
						</tr>
						<tr>
							<td colspan="5"><textarea id="refer" name="refer" placeholder="참고사항" rows="5"></textarea></td>
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
		$("#name").val(data.name);
		$("#dvs").val(data.dvs);
		$("#item").val(data.item);
		$("#clas").val(data.clas);
		$("#person").val(data.person);
		$("#phone_cell").val(data.phone_cell);
		$("#phone_com").val(data.phone_com);
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
		$("#refer").val(data.refer);
		$("#myModal").modal();
	})
})
$("#reg").click(function(){
	$("#name").val("");
	$("#dvs").val("");
	$("#item").val("");
	$("#clas").val("");
	$("#person").val("");
	$("#phone_cell").val("");
	$("#phone_com").val("");
	$("#email").val("");
	$("#fax").val("");
	$("#address").val("");
	$("#bank").val("");
	$("#account_name").val("");
	$("#account_num").val("");
	$("#ceo").val("");
	$("#type1").val("");
	$("#type2").val("");
	$("#license_num").val("");
	$("#refer").val("");
	$("#myModal").modal();
})
</script>