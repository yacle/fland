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
    var cell8 = row.insertCell(7);
    cell1.innerHTML = '';
    cell2.innerHTML = '<select id="account" name="account">'+
						'<option>계좌명</option>'+
						'<option>농협(매출)</option>'+
						'<option>농협(경비)</option>'+
						'<option>기업(매출)</option>'+
						'<option>기업(경비)</option>'+
						'<option>신한(매출)</option>'+
						'<option>국민(매출)</option>'+
					'</select>';
    cell3.innerHTML = '<input type="text" name="company" required>';
    cell4.innerHTML = '<select name="item">'+
						'<option>매출</option>'+
						'<option>업체환급</option>'+
						'<option>경비이체</option>'+
						'<option>금융이자</option>'+
						'<option>차입금</option>'+
						'<option>카드취소</option>'+
						'<option>세금환급</option>'+
						'<option>기타</option>'+
					'</select>';
    cell5.innerHTML = '<input type="text" name="detail" required>';
    cell6.innerHTML = '<input type="number" id="sum" name="sum" required>';
    cell7.innerHTML = '<input type="text" name="etc">';
    cell8.innerHTML = '<button onclick="delete_row()">삭제</button>';
  }

  function delete_row() {
    var my_tbody = document.getElementById('my-tbody');
    if (my_tbody.rows.length < 1) return;
    my_tbody.deleteRow( my_tbody.rows.length-1 );
  }
</script>
<style>
	.t1, .acctd{
		text-align:center;
		border: 1px solid DodgerBlue;
		height:39px;
	}
	nav{
		margin:0px;
	}
	.acctd{
		padding-right:20px;
	}
	input, select{
		width:95%;
		border: 1px solid LightGray;
		border-radius: 4px;
		margin: 0px 0;
		box-sizing: border-box;
		height: 39px;
		font-size: 15px;
		text-align: center;
		text-align-last:center;
	}
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li class="active"><a href="">수입</a></li>
    <li><a href="/input/expense">지출</a></li>
  </ul>
</nav>
<div align="center" >
	<table style="width:80%" class="t1">
		<thead>
			<tr style="background-color:#E0FFFF">
				<th class="t1" width=15%>은행종류</th>
				<th class="t1" width=15%>계좌번호</th>
				<th class="t1" width=15%>기초잔액</th>
				<th class="t1" width=15%>입금</th>
				<th class="t1" width=15%>출금</th>
				<th class="t1" width=15%>기말잔액</th>
				<th class="t1" width=10%>비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="t1" style="padding-right:0px;">농협(매출)</td>
				<td class="t1" style="padding-right:0px;">301-0204-8239-11</td>
				<td class="acctd" style="text-align:right;"><span id="bal01"></span></td>
				<td class="acctd" style="text-align:right"><span id="income01" ></span></td>
				<td class="acctd" style="text-align:right"><span id="spend01"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum01" ></span></td>
				<td class="t1" ></td>
			</tr>
			<tr>
				<td class="t1" style="padding-right:0px;">농협(경비)</td>
				<td class="t1" style="padding-right:0px;">301-0204-8259-01</td>
				<td class="acctd" style="text-align:right;"><span id="bal02"></span></td>
				<td class="acctd" style="text-align:right"><span id="income02" ></span></td>
				<td class="acctd" style="text-align:right"><span id="spend02"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum02" ></span></td>
				<td class="t1" ></td>
			</tr>
			<tr>
				<td class="t1" style="padding-right:0px;">기업(매출)</td>
				<td class="t1" style="padding-right:0px;">317-091848-01-024</td>
				<td class="acctd" style="text-align:right;"><span id="bal03"></span></td>
				<td class="acctd" style="text-align:right"><span id="income03" ></span></td>
				<td class="acctd" style="text-align:right"><span id="spend03"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum03" ></span></td>
				<td class="t1" ></td>
			</tr>
			<tr>
				<td class="t1" style="padding-right:0px;">기업(경비)</td>
				<td class="t1" style="padding-right:0px;">317-091848-01-017</td>
				<td class="acctd" style="text-align:right;"><span id="bal04"></span></td>
				<td class="acctd" style="text-align:right"><span id="income04" ></span></td>
				<td class="acctd" style="text-align:right"><span id="spend04"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum04" ></span></td>
				<td class="t1" ></td>
			</tr>
			<tr>
				<td class="t1" style="padding-right:0px;">신한(매출)</td>
				<td class="t1" style="padding-right:0px;">100-032-613919</td>
				<td class="acctd" style="text-align:right;"><span id="bal05"></span></td>
				<td class="acctd" style="text-align:right"><span id="income05" ></span></td>
				<td class="acctd" style="text-align:right"><span id="spend05"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum05" ></span></td>
				<td class="t1" ></td>
			</tr>
			<tr>
				<td class="t1" style="padding-right:0px;">국민(매출)</td>
				<td class="t1" style="padding-right:0px;">838937-04-006067</td>
				<td class="acctd" style="text-align:right;"><span id="bal06"></span></td>
				<td class="acctd" style="text-align:right"><span id="income06"></span></td>
				<td class="acctd" style="text-align:right"><span id="spend06"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum06"></span></td>
				<td class="t1" ></td>
			</tr>
			<tr>
				<td class="t1" style="padding-right:0px;" colspan="2">소계</td>
				<td class="acctd" style="text-align:right;" id="bal07"></td>
				<td class="acctd" style="text-align:right"><span id="income07"></span></td>
				<td class="acctd" style="text-align:right"><span id="spend07"></span></td>
				<td class="acctd" style="text-align:right"><span id="sum07"></span></td>
				<td class="t1" ></td>
			</tr>
		</tbody>
	</table><hr/>
</div>
<div align="center">
	<h2><b>일일 수입자금 실적</b></h2>
</div>
<div align="center">
<form action="/input/incomeAdd"	method="POST">
	<table width=90% border="0">
		<thead>
			<tr>
				<th width=10%>입금일자</th>
				<th width=10%>계좌명</th>
				<th width=10%>입금처</th>
				<th width=10%>비목</th>
				<th width=30%>내용</th>
				<th width=10%>금액</th>
				<th width=15%>비고</th>
				<th width=5%>추가</th>
			</tr>
		</thead>
		<tbody id="my-tbody">
			<tr>
				<td>
					<input type="date" min="2017-12-31" id="date" name="date">
				</td>
				<td>
					<select id="account" name="account" class="account">
						<option>계좌명</option>
						<option>농협(매출)</option>
						<option>농협(경비)</option>
						<option>기업(매출)</option>
						<option>기업(경비)</option>
						<option>신한(매출)</option>
						<option>국민(매출)</option>
					</select>
				</td>
				<td>
					<input type="text" name="company" required>
				</td>
				<td>
					<select name="item">
						<option>매출</option>
						<option>업체환급</option>
						<option>경비이체</option>
						<option>금융이자</option>
						<option>차입금</option>
						<option>카드취소</option>
						<option>세금환급</option>
					</select>
				</td>
				<td>
					<input type="text" name="detail" required>
				</td>
				<td>
					<input type="number" class="sum" id="sum" name="sum" required>
				</td>
				<td>
					<input type="text" name="etc">
				</td>
				<td>
					<button onclick="add_row()">추가</button>
				</td>
			</tr>
		</tbody>
	</table><br/>
	<button class="btn btn-info" type="button" id="btn">조회</button>
	<button class="btn btn-warning" type="reset">취소</button>
	<button class="btn btn-success" type="submit">등록</button>
</form>
</div>


<script>
function comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

var arr = [];
var sumarr = [];
	$("#btn").click(function(){	// 조회버튼
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/input/readAccount",
			"data":{
				"date":$("#date").val()
			},
			success:function(obj){
				var accsum = JSON.parse(obj);
				$("#bal01").html(comma(accsum.nhi));
				$("#bal02").html(comma(accsum.nhe));
				$("#bal03").html(comma(accsum.kbi));
				$("#bal04").html(comma(accsum.kbe));
				$("#bal05").html(comma(accsum.sh));
				$("#bal06").html(comma(accsum.km));
				$("#bal07").html(comma(accsum.total));
			}
		})
		
		var sum01=0;	// 농협(매출)
		var sum02=0;	// 농협(경비)
		var sum03=0;	// 기업(매출)
		var sum04=0;	// 기업(경비)
		var sum05=0;	// 신한(매출)
		var sum06=0;	// 국민(매출)
		var sum07=0;	// 소계
		$("#income01").html(0);
		$("#income02").html(0);
		$("#income03").html(0);
		$("#income04").html(0);
		$("#income05").html(0);
		$("#income06").html(0);
		$("#income07").html(0);
		var acc=document.getElementsByClassName("account");
		var sum=document.getElementsByClassName("sum");
		for(var i=0; i<acc.length-1; i++){
			var s = sum[i].value;
			if(acc[i].value=="농협(매출)"){
				sum01 += parseInt(s);
			}else if(acc[i].value=="농협(경비)"){
				sum02 += parseInt(s);
			}else if(acc[i].value=="기업(매출)"){
				sum03 += parseInt(s);
			}else if(acc[i].value=="기업(경비)"){
				sum04 += parseInt(s);
			}else if(acc[i].value=="신한(매출)"){
				sum05 += parseInt(s);
			}else if(acc[i].value=="국민(매출)"){
				sum06 += parseInt(s);
			}
			sum07+=parseInt(s);
		};
		$("#income01").html(comma(sum01)); $("#sum01").html(comma(parseInt(uncomma($("#bal01").html()))+sum01));
		$("#income02").html(comma(sum02)); $("#sum02").html(comma(parseInt(uncomma($("#bal02").html()))+sum02));
		$("#income03").html(comma(sum03)); $("#sum03").html(comma(parseInt(uncomma($("#bal03").html()))+sum03));
		$("#income04").html(comma(sum04)); $("#sum04").html(comma(parseInt(uncomma($("#bal04").html()))+sum04));
		$("#income05").html(comma(sum05)); $("#sum05").html(comma(parseInt(uncomma($("#bal05").html()))+sum05));
		$("#income06").html(comma(sum06)); $("#sum06").html(comma(parseInt(uncomma($("#bal06").html()))+sum06));
		$("#income07").html(comma(sum07)); $("#sum07").html(comma(parseInt(uncomma($("#bal07").html()))+sum07));
	})
</script>

	