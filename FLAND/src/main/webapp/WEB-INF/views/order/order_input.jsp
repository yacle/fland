<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function add_row(){
		var my_tbody = document.getElementById('my-tbody');
		var row = my_tbody.insertRow( my_tbody.rows.length );
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);
		cell1.innerHTML = '';
		cell2.innerHTML = '';
		cell3.innerHTML = '';
		cell4.innerHTML = '<input type="text" name="COLOR"  required>';
		cell5.innerHTML = '<input type="number" name="ORDER_QUANTITY"  required>';
		cell6.innerHTML = '<input type="number" name="ORDER_PRICE"  required>';
		cell7.innerHTML = '<button onclick="delete_row()">삭제</button  required>';
	}
	function delete_row() {
	   var my_tbody = document.getElementById('my-tbody');
	   if (my_tbody.rows.length < 1) return;
	   my_tbody.deleteRow( my_tbody.rows.length-1 );
	}	

	function add_row1(){
		var my_tbody1 = document.getElementById('my-tbody1');
		var row_yarn = my_tbody1.insertRow( my_tbody1.rows.length );
		var cell1_yarn = row_yarn.insertCell(0);
		var cell2_yarn = row_yarn.insertCell(1);
		var cell3_yarn = row_yarn.insertCell(2);
		var cell4_yarn = row_yarn.insertCell(3);
		var cell5_yarn = row_yarn.insertCell(4);
		var cell6_yarn = row_yarn.insertCell(5);
		cell1_yarn.innerHTML = '<input type="text" name="YARN" required>';
		cell2_yarn.innerHTML = '<input type="text" name="YARN_COM" required>';
		cell3_yarn.innerHTML = '<input type="number" name="YARN_PRICE"  required>';
		cell4_yarn.innerHTML = '<input type="date" name="YARN_ORDER_DATE"  required>';
		cell5_yarn.innerHTML = '<input type="number" name="YARN_ORDER_QUANTITY"  required>';
		cell6_yarn.innerHTML = '<button onclick="delete_row1()">삭제</button  required>';
	}
	function delete_row1() {
	   var my_tbody1 = document.getElementById('my-tbody1');
	   if (my_tbody1.rows.length < 1) return;
	   my_tbody1.deleteRow( my_tbody1.rows.length-1 );
	}	
 
	function add_row2(){
		var my_tbody2 = document.getElementById('my-tbody2');
		var row_knit = my_tbody2.insertRow( my_tbody2.rows.length );
		var cell1_knit = row_knit.insertCell(0);
		var cell2_knit = row_knit.insertCell(1);
		var cell3_knit = row_knit.insertCell(2);
		var cell4_knit = row_knit.insertCell(3);
		var cell5_knit = row_knit.insertCell(4);
		var cell6_knit = row_knit.insertCell(5);
		cell1_knit.innerHTML = '<input type="text" name="KNIT" required>';
		cell2_knit.innerHTML = '<input type="text" name="KNIT_COM" required>';
		cell3_knit.innerHTML = '<input type="number" name="KNIT_PRICE"  required>';
		cell4_knit.innerHTML = '<input type="date" name="KNIT_ORDER_DATE"  required>';
		cell5_knit.innerHTML = '<input type="number" name="KNIT_ORDER_QUANTITY"  required>';
		cell6_knit.innerHTML = '<button onclick="delete_row2()">삭제</button  required>';
	}
	function delete_row2() {
	   var my_tbody2 = document.getElementById('my-tbody2');
	   if (my_tbody2.rows.length < 1) return;
	   my_tbody2.deleteRow( my_tbody2.rows.length-1 );
	}	
	 
	function add_row3(){
		var my_tbody3 = document.getElementById('my-tbody3');
		var row_dye = my_tbody3.insertRow( my_tbody3.rows.length );
		var cell1_dye = row_dye.insertCell(0);
		var cell2_dye = row_dye.insertCell(1);
		var cell3_dye = row_dye.insertCell(2);
		var cell4_dye = row_dye.insertCell(3);
		var cell5_dye = row_dye.insertCell(4);
		var cell6_dye = row_dye.insertCell(5);
		var cell7_dye = row_dye.insertCell(6);
		cell1_dye.innerHTML = '<input type="text" name="DYEING" required>';
		cell2_dye.innerHTML = '<input type="text" name="DYEING_COM" required>';
		cell3_dye.innerHTML = '<input type="text" name="DYE_COLOR"  required>';
		cell4_dye.innerHTML = '<input type="number" name="DYE_PRICE"  required>';
		cell5_dye.innerHTML = '<input type="date" name="DYE_ORDER_DATE"  required>';
		cell6_dye.innerHTML = '<input type="number" name="DYE_ORDER_QUANTITY"  required>';
		cell7_dye.innerHTML = '<button onclick="delete_row3()">삭제</button  required>';
	}
	 function delete_row3() {
	    var my_tbody3 = document.getElementById('my-tbody3');
	    if (my_tbody3.rows.length < 1) return;
	    my_tbody3.deleteRow( my_tbody3.rows.length-1 );
	 }	
			 
	function add_row4(){
		var my_tbody4 = document.getElementById('my-tbody4');
		var row_proc = my_tbody4.insertRow( my_tbody4.rows.length );
		var cell1_proc = row_proc.insertCell(0);
		var cell2_proc = row_proc.insertCell(1);
		var cell3_proc = row_proc.insertCell(2);
		var cell4_proc = row_proc.insertCell(3);
		var cell5_proc = row_proc.insertCell(4);
		var cell6_proc = row_proc.insertCell(5);
		cell1_proc.innerHTML = '<input type="text" name="PROCESS" required>';
		cell2_proc.innerHTML = '<input type="text" name="PROCESS_COM" required>';
		cell3_proc.innerHTML = '<input type="number" name="PROCESS_PRICE"  required>';
		cell4_proc.innerHTML = '<input type="date" name="PROCESS_ORDER_DATE"  required>';
		cell5_proc.innerHTML = '<input type="number" name="PROCESS_ORDER_QUANTITY"  required>';
		cell6_proc.innerHTML = '<button onclick="delete_row4()">삭제</button  required>';
	}
	 function delete_row4() {
	    var my_tbody4 = document.getElementById('my-tbody4');
	    if (my_tbody4.rows.length < 1) return;
	    my_tbody4.deleteRow( my_tbody4.rows.length-1 );
	 }	
</script>
<style>
	input{
		width:95%;
		border: 1px solid LightGray;
		border-radius: 4px;
		margin: 0px 0;
		box-sizing: border-box;
		height: 39px;
		font-size: 15px;
		text-align: center;
	}
	.left{
		margin-left : 100px;
	}
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li class="active"><a href=""><b>발주서</b></a></li>
    <li><a href="/manage/view_order"><b>생산관리</b></a></li>
  </ul>
</nav>
<form action="/input/order_Add" method="post">
<div class="left">
	<table>
		<thead>
			<tr>
				<th>발주일</th>
				<th>ORDER NO</th>
				<th>원단명</th>
				<th>컬러명</th>
				<th>발주량</th>
				<th>단가</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="my-tbody">
			<tr>
				<td><input type="date" name="ORDER_DATE" required></td>
				<td><input type="text" name="ORDER_NO" required></td>
				<td><input type="text" name="FABRIC_NAME" required></td>
				<td><input type="text" name="COLOR" required></td>
				<td><input type="number" name="ORDER_QUANTITY" required></td>
				<td><input type="number" name="ORDER_PRICE" required></td>
				<td><button onclick="add_row()">추가</button></td>
			</tr>
		</tbody>
	</table>
</div><hr/>
<div  class="left">
	<table>
		<thead>
			<tr>
				<th>원사명</th>
				<th>회사명</th>
				<th>원사단가</th>
				<th>발주일자</th>
				<th>발주수량</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="my-tbody1">
			<tr>
				<td><input type="text" name="YARN" required></td>
				<td><input type="text" name="YARN_COM" required></td>
				<td><input type="number" name="YARN_PRICE" required></td>
				<td><input type="date" name="YARN_ORDER_DATE" required></td>
				<td><input type="number" name="YARN_ORDER_QUANTITY" required></td>
				<td><button onclick="add_row1()">추가</button></td>
			</tr>
		</tbody>
	</table>
</div><hr/>
<div class="left">
	<table>
		<thead>
			<tr>
				<th>편직명</th>
				<th>편직처</th>
				<th>편직단가</th>
				<th>발주일자</th>
				<th>발주수량</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="my-tbody2">
			<tr>
				<td><input type="text" name="KNIT" required></td>
				<td><input type="text" name="KNIT_COM" required></td>
				<td><input type="number" name="KNIT_PRICE" required></td>
				<td><input type="date" name="KNIT_ORDER_DATE" required></td>
				<td><input type="number" name="KNIT_ORDER_QUANTITY" required></td>
				<td><button onclick="add_row2()">추가</button></td>
			</tr>
		</tbody>
	</table>
</div><hr/>
<div class="left">
	<table>
		<thead>
			<tr>
				<th>염색방법</th>
				<th>염색처</th>
				<th>컬러</th>
				<th>염색단가</th>
				<th>발주일자</th>
				<th>발주수량</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="my-tbody3">
			<tr>
				<td><input type="text" name="DYEING" required></td>
				<td><input type="text" name="DYEING_COM" required></td>
				<td><input type="text" name="DYE_COLOR" required></td>
				<td><input type="number" name="DYE_PRICE" required></td>
				<td><input type="date" name="DYE_ORDER_DATE" required></td>
				<td><input type="number" name="DYE_ORDER_QUANTITY" required></td>
				<td><button onclick="add_row3()">추가</button></td>
			</tr>
		</tbody>
	</table>
</div><hr/>
<div class="left">
	<table>
		<thead>
			<tr>
				<th>가공방법</th>
				<th>가공처</th>
				<th>가공단가</th>
				<th>발주일자</th>
				<th>발주수량</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="my-tbody4">
			<tr>
				<td><input type="text" name="PROCESS" required></td>
				<td><input type="text" name="PROCESS_COM" required></td>
				<td><input type="number" name="PROCESS_PRICE" required></td>
				<td><input type="date" name="PROCESS_ORDER_DATE" required></td>
				<td><input type="number" name="PROCESS_ORDER_QUANTITY" required></td>
				<td><button onclick="add_row4()">추가</button></td>
			</tr>
		</tbody>
	</table>
</div><hr/>
<div align="center">
	<button class="btn btn-success" type="submit">등록</button>
</div>
</form>



