<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).on('click','.add', function(){
		var getHtml = $('#formgroupcopy').html();
		$('#addhtml').append(getHtml);
	});
	$(document).on('click','.del', function(){
		$(this).parent().parent().parent().remove();
	})
</script>
<style>
	table, th, td{
		text-align:center;
		border: 1px solid DodgerBlue;
		height:30px;
	}
	nav{
		margin:0px;
	}
	td{
		padding-right:20px;
	}
	
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li><a href="/input"><b>수입</b></a></li>
    <li class="active"><a href=""><b>지출</b></a></li>
  </ul>
</nav>
<div align="center" >
	<table style="width:80%">
		<thead>
			<tr style="background-color:#E0FFFF">
				<th width=15%>은행종류</th>
				<th width=15%>계좌번호</th>
				<th width=15%>기초잔액</th>
				<th width=15%>입금</th>
				<th width=15%>출금</th>
				<th width=15%>기말잔액</th>
				<th width=10%>비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="padding-right:0px;">농협(매출)</td>
				<td style="padding-right:0px;">301-0204-8239-11</td>
				<td style="text-align:right;"><span id="bal01"></span></td>
				<td style="text-align:right"><span id="income01" ></span></td>
				<td style="text-align:right"><span id="spend01"></span></td>
				<td style="text-align:right"><span id="sum01" ></span></td>
				<td></td>
			</tr>
			<tr>
				<td style="padding-right:0px;">농협(경비)</td>
				<td style="padding-right:0px;">301-0204-8259-01</td>
				<td style="text-align:right;"><span id="bal02"></span></td>
				<td style="text-align:right"><span id="income02" ></span></td>
				<td style="text-align:right"><span id="spend02"></span></td>
				<td style="text-align:right"><span id="sum02" ></span></td>
				<td></td>
			</tr>
			<tr>
				<td style="padding-right:0px;">기업(매출)</td>
				<td style="padding-right:0px;">317-091848-01-024</td>
				<td style="text-align:right;"><span id="bal03"></span></td>
				<td style="text-align:right"><span id="income03" ></span></td>
				<td style="text-align:right"><span id="spend03"></span></td>
				<td style="text-align:right"><span id="sum03" ></span></td>
				<td></td>
			</tr>
			<tr>
				<td style="padding-right:0px;">기업(경비)</td>
				<td style="padding-right:0px;">317-091848-01-017</td>
				<td style="text-align:right;"><span id="bal04"></span></td>
				<td style="text-align:right"><span id="income04" ></span></td>
				<td style="text-align:right"><span id="spend04"></span></td>
				<td style="text-align:right"><span id="sum04" ></span></td>
				<td></td>
			</tr>
			<tr>
				<td style="padding-right:0px;">신한(매출)</td>
				<td style="padding-right:0px;">100-032-613919</td>
				<td style="text-align:right;"><span id="bal05"></span></td>
				<td style="text-align:right"><span id="income05" ></span></td>
				<td style="text-align:right"><span id="spend05"></span></td>
				<td style="text-align:right"><span id="sum05" ></span></td>
				<td></td>
			</tr>
			<tr>
				<td style="padding-right:0px;">국민(매출)</td>
				<td style="padding-right:0px;">838937-04-006067</td>
				<td style="text-align:right;"><span id="bal06"></span></td>
				<td style="text-align:right"><span id="income06"></span></td>
				<td style="text-align:right"><span id="spend06"></span></td>
				<td style="text-align:right"><span id="sum06"></span></td>
				<td></td>
			</tr>
			<tr>
				<td style="padding-right:0px;" colspan="2">소계</td>
				<td style="text-align:right;" id="bal07"></td>
				<td style="text-align:right"><span id="income07"></span></td>
				<td style="text-align:right"><span id="spend07"></span></td>
				<td style="text-align:right"><span id="sum07"></span></td>
				<td></td>
			</tr>
		</tbody>
	</table><hr/>
</div>
<div align="center">
	<h2><b>일일 지출자금 실적</b></h2>
</div>
<div class="row">
	<div class="col-lg-1">
		<h5>지출일자</h5>
	</div>
	<div class="col-lg-1">
		<h5>계좌명</h5>
	</div>
	<div class="col-lg-1">
		<h5>사용자</h5>
	</div>
	<div class="col-lg-1">
		<h5>비목</h5>
	</div>
	<div class="col-lg-1">
		<h5>사용구분</h5>
	</div>
	<div class="col-lg-3">
		<h5>내용</h5>
	</div>
	<div class="col-lg-1">
		<h5>금액</h5>
	</div>
	<div class="col-lg-2">
		<h5>비고</h5>
	</div>
</div>
<!-- input -->
<form action="/input/expenseAdd" method="POST">
<div id="addhtml">
	<div class="formgroup">
		<div class="row">
			<div class="col-lg-1">
				<input type="date" min="2017-12-31" class="form-control" id="date" name="expense_date">
			</div>
			<div class="col-lg-1">
				<select class="form-control account" id="account" name="account">
					<option>계좌명</option>
					<option>농협(매출)</option>
					<option>농협(경비)</option>
					<option>기업(매출)</option>
					<option>기업(경비)</option>
					<option>신한(매출)</option>
					<option>국민(매출)</option>
				</select>
			</div>
			<div class="col-lg-1">
				<select class="form-control" id="employee" name="employee">
					<option>공용</option>
					<option>황수현</option>
					<option>한정신</option>
					<option>박성진</option>
				</select>
			</div>
			<div class="col-lg-1">
				<div class="form-group">
					<select class="form-control" name="item">
						<option>비목 선택</option>
						<option>차량유지비</option>
						<option>경비</option>
						<option>식대</option>
						<option>경비이체</option>
						<option>대금결재</option>
						<option>물류비</option>
						<option>임대관리비</option>
						<option>급여</option>
						<option>차입금상환</option>
						<option>세금</option>
						<option>4대보험</option>
					</select>
				</div>
			</div>
			<div class="col-lg-1">
				<select class="form-control" id="method" name="method">
					<option>카드</option>
					<option>이체</option>
				</select>
			</div>
			<div class="col-lg-3">
				<div class="form-group">
					<input type="text" class="form-control" name="detail" required>
				</div>
			</div>
			<div class="col-lg-1">
				<div class="form-group"> 
					<input type="number" class="form-control sum" id="sum" name="sum" required>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="form-group">
					<input type="text" class="form-control" name="etc">
				</div>
			</div>
			<div class="col-lg-1">
				<div class="form-group">
					<button type="button" class="add">추가</button>
				</div>
			</div>
		</div>
	</div>
</div><hr/>
	<button type="button" id="btn">조회</button>
	<button type="reset">취소</button>
	<button type="submit">등록</button>
</form>
<div id="formgroupcopy" style="display:none;">
	<div class="formgroup">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1">
				<select class="form-control account" id="account" name="account">
					<option>계좌명</option>
					<option>농협(매출)</option>
					<option>농협(경비)</option>
					<option>기업(매출)</option>
					<option>기업(경비)</option>
					<option>신한(매출)</option>
					<option>국민(매출)</option>
				</select>
			</div>
			<div class="col-lg-1">
				<select class="form-control" id="employee" name="employee">
					<option>공용</option>
					<option>황수현</option>
					<option>한정신</option>
					<option>박성진</option>
				</select>
			</div>
			<div class="col-lg-1">
				<div class="form-group">
					<select class="form-control" name="item">
						<option>비목 선택</option>
						<option>차량유지비</option>
						<option>경비</option>
						<option>식대</option>
						<option>경비이체</option>
						<option>대금결재</option>
						<option>물류비</option>
						<option>임대관리비</option>
						<option>급여</option>
						<option>차입금상환</option>
						<option>세금</option>
						<option>4대보험</option>
					</select>
				</div>
			</div>
			<div class="col-lg-1">
				<select class="form-control" id="method" name="method">
					<option>카드</option>
					<option>현금</option>
					<option>이체</option>
				</select>
			</div>
			<div class="col-lg-3">
				<div class="form-group">
					<input type="text" class="form-control" name="detail" required>
				</div>
			</div>
			<div class="col-lg-1">
				<div class="form-group"> 
					<input type="number" class="form-control sum" id="sum" name="sum" required>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="form-group">
					<input type="text" class="form-control" name="etc">
				</div>
			</div>
			<div class="col-lg-1">
				<div class="form-group">
					<button type="button" class="del">삭제</button>
				</div>
			</div>
		</div>
	</div>
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
				$("#bal01").html(comma(accsum.nhe));
				$("#bal02").html(comma(accsum.nhi));
				$("#bal03").html(comma(accsum.kbe));
				$("#bal04").html(comma(accsum.kbi));
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
		$("#spend01").html(0);
		$("#spend02").html(0);
		$("#spend03").html(0);
		$("#spend04").html(0);
		$("#spend05").html(0);
		$("#spend06").html(0);
		$("#spend07").html(0);
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
			};
			sum07+=parseInt(s);
		};
		$("#spend01").html(comma(sum01)); $("#sum01").html(comma(parseInt(uncomma($("#bal01").html()))-sum01));
		$("#spend02").html(comma(sum02)); $("#sum02").html(comma(parseInt(uncomma($("#bal02").html()))-sum02));
		$("#spend03").html(comma(sum03)); $("#sum03").html(comma(parseInt(uncomma($("#bal03").html()))-sum03));
		$("#spend04").html(comma(sum04)); $("#sum04").html(comma(parseInt(uncomma($("#bal04").html()))-sum04));
		$("#spend05").html(comma(sum05)); $("#sum05").html(comma(parseInt(uncomma($("#bal05").html()))-sum05));
		$("#spend06").html(comma(sum06)); $("#sum06").html(comma(parseInt(uncomma($("#bal06").html()))-sum06));
		$("#spend07").html(comma(sum07)); $("#sum07").html(comma(parseInt(uncomma($("#bal07").html()))-sum07));
	})
</script>

	