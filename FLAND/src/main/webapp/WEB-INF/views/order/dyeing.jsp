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
    cell1.innerHTML = '<input type="number" name="group" size="5">';
    cell2.innerHTML = '<input type="text" name="color">';
    cell3.innerHTML = '<input type="number" name="kg" size="8">';
    cell4.innerHTML = '<span id="jul"></span>절';
    cell5.innerHTML = '<span id="ttlkg"></span>kg';
    cell6.innerHTML = '<input type="text" name="btno">';
    cell7.innerHTML = '<input type="number" name="quantity">';
  }

  function delete_row() {
    var my_tbody = document.getElementById('my-tbody');
    if (my_tbody.rows.length < 1) return;
    my_tbody.deleteRow( my_tbody.rows.length-1 );
  }
  
  function add_row2() {
	    var my_tbody2 = document.getElementById('my-tbody2');
	    var row = my_tbody2.insertRow( my_tbody2.rows.length );
	    var cell1 = row.insertCell(0);
	    var cell2 = row.insertCell(1);
	    var cell3 = row.insertCell(2);
	    var cell4 = row.insertCell(3);
	    var cell5 = row.insertCell(4);
	    cell1.innerHTML = '<input type="text" name="test-color">';
	    cell2.innerHTML = '<input type="checkbox" name="test-fastness">';
	    cell3.innerHTML = '<input type="checkbox" name="test-reduction">';
	    cell4.innerHTML = '<input type="checkbox" name="test-feeling">';
	    cell5.innerHTML = '<input type="checkbox" name="test-skewness">';
	  }

	  function delete_row2() {
	    var my_tbody2 = document.getElementById('my-tbody2');
	    if (my_tbody2.rows.length < 1) return;
	    my_tbody2.deleteRow( my_tbody2.rows.length-1 );
	  }
</script>
<style>
table{
	border-collapse: collapse;
}
td{
	padding:0px;
	text-align:center;
	font-size:20px;
	border: 1px solid black;
}
th{
	text-align: center;
	font-size:11px;
	background-color: #FFFF00;
	border: 1px solid black;
}
tr{
	height: 23px;
	border: 1px solid black;
	height: 40px;
}
input, select{
	width:100%;
	border: none;
	margin: 0px 0;
	box-sizing: border-box;
	height: 39px;
	font-size: 15px;
	text-align: center;
}
#tablefixed {table-layout:fixed;}
</style>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color:yellow; font-weight: bold;">작업의뢰서</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">염색의뢰서</a></li>
			<li><a href="#">편직의뢰서</a></li>
			<li><a href="#">원사발주서</a></li>
			<li><a href="#">가공의뢰서</a></li>
			<li><a href="#">사전원가계산서</a></li>
			<li><a href="#">사후원가계산서</a></li>
		</ul>
	</div>
</nav>
<div class="row" id="print">
	<div class="col-lg-1"></div>
	<div class="col-lg-10 table-responsive" align="center">
		<h2>염색의뢰서</h2>
		<table width=80%>
			<tr>
				<table width=90%>
					<tr>
						<td width=20%>날짜</td>
						<td colspan="2">ORDER NO.</td>
						<td colspan="2">Sample NO.</td>
					</tr>
					<tr>
						<td><input type="date" name="order_date" style="text-align:right" required></td>
						<td colspan="2"><input type="text" name="order_name" required></td>
						<td colspan="2"><input type="text" name="sample" required></td>
					</tr>
					<tr>
						<td colspan="2">생지출고처</td>
						<td colspan="3">염색처</td>
					</tr>
					<tr>
						<td>
							<select name="fabric">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</td>
						<td width=30%></td>
						<td width=20%>
							<select name="dyeing">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2">품명</td>
						<td>원단가공폭</td>
						<td colspan="2">원단가공중량</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="name" required></td>
						<td><input type="number" name="f_width" required></td>
						<td width=15%>g/m2</td>
						<td width=15%><input type="number" name="f_weight" placeholder="g/yd" required></td>
					</tr>
				</table>
			</tr>
			<tr>
				<table width=90%>
					<tr>
						<td colspan="2">원단가공 세부사항</td>
					</tr>
					<tr>
						<td width=20%>&#9608; 원단혼용율</td>
						<td><input type="text" name="mix"></td>
					</tr>
					<tr>
						<td>&#10112;가공방법</td>
						<td><input type="text" name="method"></td>
					</tr>
					<tr>
						<td>&#10113;세부사항</td>
						<td><input type="text" name="detail"></td>
					</tr>
				</table>
			</tr>
			<tr>
				<table width=90%>
					<thead>
						<tr>
							<td rowspan="2">편직그룹<br/>
								<button onclick="add_row()">add</button>
								<button onclick="delete_row()">del</button>
							</td>
							<td rowspan="2">색상</td>
							<td colspan="3">염색수량</td>
							<td rowspan="2">BT NO.</td>
							<td rowspan="2">발주량</td>
						</tr>
						<tr>
							<td>KG</td>
							<td>절수</td>
							<td>수량</td>
						</tr>
					</thead>
					<tbody id="my-tbody">
						<tr>
							<td><input type="number" name="group" size="5"></td>
							<td><input type="text" name="color"></td>
							<td><input type="number" name="kg" size="8"></td>
							<td width=10%><span id="jul"></span>절</td>
							<td width=10%><span id="ttlkg"></span>kg</td>
							<td><input type="text" name="btno"></td>
							<td><input type="number" name="quantity"></td>
						</tr>
					</tbody>	
				</table>
			</tr>
			<tr>
				<table width=90%>
					<thead>
						<tr>
							<td colspan="5">&#10114;시험의뢰
								<button onclick="add_row2()">add</button>
								<button onclick="delete_row2()">del</button>
							</td>
						</tr>
						<tr>
							<td width=15%>색상</td>
							<td width=15%>염색견뢰도</td>
							<td width=15%>축률</td>
							<td width=15%>필링</td>
							<td width=15%>사행도</td>
						</tr>
					</thead>
					<tbody id="my-tbody2">
						<tr>
							<td><input type="text" name="test-color"></td>
							<td><input type="checkbox" name="test-fastness"></td>
							<td><input type="checkbox" name="test-reduction"></td>
							<td><input type="checkbox" name="test-feeling"></td>
							<td><input type="checkbox" name="test-skewness"></td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td>&#10115;기타사항</td>
							<td colspan="5"><input type="text" name="etc"></td>
						</tr>
						<tr>
							<td>&#10116;주의사항</td>
							<td colspan="5"><input type="text" name="caution"></td>
						</tr>
						<tr>
							<td>&#10117;출고처</td>
							<td colspan="5"><input type="text" name="delivery"></td>
						</tr>
					</tbody>
				</table>
			</tr>
		</table>
	</div>
</div>
<button type="button" onclick="javascript:divPrint()">출력</button>
<script>
//프린트
function divPrint(){
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function(){
		document.body.innerHTML = document.getElementById('print').innerHTML;
	}
	window.onafterprint = function(){
		document.body.innerHTML = initBody;
	}
	window.print();
}
</script>