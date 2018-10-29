<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function add_row() {
    var my_tbody = document.getElementById('my-tbody');
    var row = my_tbody.insertRow( my_tbody.rows.length );
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6);
    cell1.innerHTML = '<input type="date" min="2017-12-31" id="date" name="purchase_date" required>';
    cell2.innerHTML = '<input type="text" name="order_no">';
    cell3.innerHTML = '<select id="category" name="category">'+
								'<option></option>'+
								'<option>원사</option>'+
								'<option>편직</option>'+
								'<option>염색</option>'+
								'<option>가공</option>'+
								'<option>포장</option>'+
								'<option>물류</option>'+
								'<option>기타</option>'+
							'</select>';
    cell4.innerHTML = '<input type="text" name="company">';
    cell5.innerHTML = '<input type="text" style="text-align: left" name="detail" required>';
    cell6.innerHTML = '<input type="number" class="sum" style="text-align: right" name="sum" required>';
    cell7.innerHTML = '<button onclick="delete_row()">삭제</button>';
  }

  function delete_row() {
    var my_tbody = document.getElementById('my-tbody');
    if (my_tbody.rows.length < 1) return;
    my_tbody.deleteRow( my_tbody.rows.length-1 );
  }
</script>
<style>
	#table01{
		width:85%;
		border:0;
	}
	nav{
		margin:0px;
	}
	input, select{
		width:97%;
		border: 1px solid LightGray;
		border-radius: 4px;
		margin: 0px 0;
		box-sizing: border-box;
		height: 39px;
		font-size: 15px;
		text-align: center;
	}
	select{
		text-align-last:center;
	}
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li><a href="/input/expense"><b>지출</b></a></li>
    <li><a href="/input"><b>수입</b></a></li>
    <li class="active"><a href=""><b>매입</b></a></li>
  </ul>
</nav>
<div align="center">
	<h2><b>매입자료 입력</b></h2>
<form action="/purchase/add" method="POST">
	<table id="table01">
		<thead>
			<tr>
				<th width=10%>매입발주일자</th>
				<th width=10%>Order_No</th>
				<th width=8%>분류</th>
				<th width=8%>거래처</th>
				<th width=50%>매입내용</th>
				<th width=9%>금액</th>
				<th width=5%>추가</th>
			</tr>
		</thead>
		<tbody id="my-tbody">
			<tr>
				<td><input type="date" min="2017-12-31" id="date" name="purchase_date" required></td>
				<td><input type="text" name="order_no"></td>
				<td>
					<select id="category" name="category">
						<option></option>
						<option>원사</option>
						<option>편직</option>
						<option>염색</option>
						<option>가공</option>
						<option>포장</option>
						<option>물류</option>
						<option>기타</option>
					</select>
				</td>
				<td><input type="text" name="company"></td>
				<td><input type="text" style="text-align: left" name="detail" required></td>
				<td><input type="number" class="sum" style="text-align: right" name="sum" required></td>
				<td>
					<button onclick="add_row()">추가</button>
				</td>
			</tr>
		</tbody>
	</table><br/>
	<button class="btn btn-warning" type="reset">취소</button>
	<button class="btn btn-success" type="submit">등록</button>
</form>
</div>