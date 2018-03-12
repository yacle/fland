<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head> <base target="_self" /> </head>
<style>
	table, th, td{
		text-align:center;
		border: 1px solid DodgerBlue;
		height:40px;
	}
	.num{
		padding-right:10px;
		text-align:right;
		font-weight: bold;
	}
	tr:hover {background-color:#f5f5f5;}
	.title{
		margin: auto;
		width: 90%;
		text-align: center;
	}
	input{
		width:100%;
		border: none;
		margin: 0px 0;
		box-sizing: border-box;
		height: 35px;
		font-size: 15px;
		text-align: center;
	}
</style>
<nav class="navbar navbar-inverse">
	<ul class="nav navbar-nav">
		<li class="active"><a href="">일별</a></li>
		<li><a href="/inquiry/monthly?month=2018-01">월별</a></li>
		<li><a href="/inquiry/yearly?year=2018">연별</a></li>
		<form class="navbar-form navbar-right" action="/inquiry/daily" method="get">
			<div class="form-group">
				<input type="date" name="date" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">조회</button>
			<a href="/input/expense"><button type="button" class="btn btn-info" style="margin-left: 10px;">입력</button></a>
		</form>
	</ul>
<!-- 검색부분 -->
	<ul class="nav navbar-nav navbar-right" style="padding-right: 20px">
		<form class="navbar-form navbar-right" action="/inquiry/search" method="post">
			<div class="form-group">
				<div style="color: white; font-size: 17px; margin-right: 10px;">조건검색</div>
			</div>
			<div class="form-group">
				<input name="startDate" placeholder="시작일자" class="form-control input-sm" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" size="7">
			</div>
			<div class="form-group">
				<input name="endDate" placeholder="종료일자" class="form-control input-sm" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" size="7">
			</div>
			<div class="form-group">
				<select name="condition"  class="form-control input-sm">
					<option value="내용">조건선택</option>
					<option value="내용">내용</option>
					<option value="비고">비고</option>
					<option value="금액">금액</option>
				</select>
			</div>
			<div class="form-group">
				<input name="detail" type="search" class="form-control input-sm" placeholder="검색내용">
			</div>
			<button type="submit" class="btn btn-success">조회</button>
		</form>
	</ul>
</nav>
<div class="title">
	<h2><b>일일자금수지 실적표</b> [<span id="modalDate">${date}</span>]</h2>
	<ul class="pager">
		<li class="previous" id="pre"><a href="#">Previous</a></li>
		<li class="next" id="next"><a href="#">Next</a></li>
	</ul>
</div>
<div align="center">
<table border="1" width="90%">
	<thead>
		<tr style="background-color:#FFFF00">
			<th rowspan="2">은행구분</th>
			<th rowspan="2">기초잔액</th>
			<th colspan="4">수입</th>
			<th colspan="4">지출</th>
			<th rowspan="2">기말잔액</th>
		</tr>
		<tr style="background-color:#FFFF00">
			<th>비목</th>
			<th>내역</th>
			<th>입금처</th>
			<th>금액</th>
			<th>비목</th>
			<th>내역</th>
			<th>사용자</th>
			<th>금액</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td width="8%" rowspan="${in_nhi.size()+out_nhi.size()}" style="background-color:#E0FFFF">농협(매출)</td>
			<td width="8%" class="num" rowspan="${in_nhi.size()+out_nhi.size()}"><fmt:formatNumber value="${begin.nhi}" groupingUsed="true"/></td>
			<td width="7%">${in_nhi[0].item }</td>
			<td width="15%" class="sel-com" data="${in_nhi[0].no}">${in_nhi[0].detail}</td>
			<td width="7%">${in_nhi[0].client }</td>
			<td width="8%" class="num"><fmt:formatNumber value="${in_nhi[0].sum }" groupingUsed="true"/></td>
			<td width="7%">${out_nhi[0].item }</td>
			<td width="15%" class="sel-com" data="${out_nhi[0].no}">${out_nhi[0].detail}</td>
			<td width="7%">${out_nhi[0].client }</td>
			<td width="8%" class="num"><fmt:formatNumber value="${out_nhi[0].sum}" groupingUsed="true"/></td>
			<td width="10%" class="num" rowspan="${in_nhi.size()+out_nhi.size()}"><fmt:formatNumber value="${end.nhi}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_nhi.size() + out_nhi.size())>0 ? (in_nhi.size() + out_nhi.size())-1 : (in_nhi.size()+out_nhi.size())}">
			<tr>
				<td>${in_nhi[i].item }</td>
				<td class="sel-com" data="${in_nhi[i].no}">${in_nhi[i].detail}</td>
				<td>${in_nhi[i].client }</td>
				<td class="num"><fmt:formatNumber value="${in_nhi[i].sum }" groupingUsed="true"/></td>
				<td>${out_nhi[i].item }</td>
				<td class="sel-com" data="${out_nhi[i].no}">${out_nhi[i].detail}</td>
				<td>${out_nhi[i].client }</td>
				<td class="num"><fmt:formatNumber value="${out_nhi[i].sum }" groupingUsed="true"/></td>
			</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_nhe.size()+out_nhe.size()}" style="background-color:#E0FFFF">농협(경비)</td>
			<td rowspan="${in_nhe.size()+out_nhe.size()}" class="num"><fmt:formatNumber value="${begin.nhe}" groupingUsed="true"/></td>
			<td>${in_nhe[0].item }</td>
			<td class="sel-com" data="${in_nhe[0].no }">${in_nhe[0].detail }</td>
			<td>${in_nhe[0].client }</td>
			<td class="num"><fmt:formatNumber value="${in_nhe[0].sum }" groupingUsed="true"/></td>
			<td>${out_nhe[0].item }</td>
			<td class="sel-com" data="${out_nhe[0].no }">${out_nhe[0].detail }</td>
			<td>${out_nhe[0].client }</td>
			<td class="num"><fmt:formatNumber value="${out_nhe[0].sum }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_nhe.size()+out_nhe.size()}"><fmt:formatNumber value="${end.nhe}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_nhe.size() + out_nhe.size())>0 ? (in_nhe.size() + out_nhe.size())-1 : (in_nhe.size()+out_nhe.size())}">
			<tr>
				<td>${in_nhe[i].item }</td>
				<td class="sel-com" data="${in_nhe[i].no }">${in_nhe[i].detail }</td>
				<td>${in_nhe[i].client }</td>
				<td class="num"><fmt:formatNumber value="${in_nhe[i].sum }" groupingUsed="true"/></td>
				<td>${out_nhe[i].item }</td>
				<td class="sel-com" data="${out_nhe[i].no }">${out_nhe[i].detail }</td>
				<td>${out_nhe[i].client }</td>
				<td class="num"><fmt:formatNumber value="${out_nhe[i].sum }" groupingUsed="true"/></td>
			</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_kbi.size()+out_kbi.size()}" style="background-color:#E0FFFF">기업(매출)</td>
			<td rowspan="${in_kbi.size()+out_kbi.size()}" class="num"><fmt:formatNumber value="${begin.kbi}" groupingUsed="true"/></td>
			<td>${in_kbi[0].item }</td>
			<td class="sel-com" data="${in_kbi[0].no }">${in_kbi[0].detail }</td>
			<td>${in_kbi[0].client }</td>
			<td class="num"><fmt:formatNumber value="${in_kbi[0].sum }" groupingUsed="true"/></td>
			<td>${out_kbi[0].item }</td>
			<td class="sel-com" data="${out_kbi[0].no }">${out_kbi[0].detail }</td>
			<td>${out_kbi[0].client }</td>
			<td class="num"><fmt:formatNumber value="${out_kbi[0].sum }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_kbi.size()+out_kbi.size()}"><fmt:formatNumber value="${end.kbi}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_kbi.size() + out_kbi.size())>0 ? (in_kbi.size() + out_kbi.size())-1 : (in_kbi.size()+out_kbi.size())}">
		<tr>
			<td>${in_kbi[i].item }</td>
			<td>${in_kbi[i].detail }</td>
			<td class="sel-com" data="${in_kbi[i].no }">${in_kbi[i].client }</td>
			<td class="num"><fmt:formatNumber value="${in_kbi[i].sum }" groupingUsed="true"/></td>
			<td>${out_kbi[i].item }</td>
			<td class="sel-com" data="${out_kbi[i].no }">${out_kbi[i].detail }</td>
			<td>${out_kbi[i].client }</td>
			<td class="num"><fmt:formatNumber value="${out_kbi[i].sum }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_kbe.size()+out_kbe.size()}" style="background-color:#E0FFFF">기업(경비)</td>
			<td class="num" rowspan="${in_kbe.size()+out_kbe.size()}"><fmt:formatNumber value="${begin.kbe}" groupingUsed="true"/></td>
			<td>${in_kbe[0].item }</td>
			<td class="sel-com" data="${in_kbe[0].no }">${in_kbe[0].detail }</td>
			<td>${in_kbe[0].client }</td>
			<td class="num"><fmt:formatNumber value="${in_kbe[0].sum }" groupingUsed="true"/></td>
			<td>${out_kbe[0].item }</td>
			<td class="sel-com" data="${out_kbe[0].no }">${out_kbe[0].detail }</td>
			<td>${out_kbe[0].client }</td>
			<td class="num"><fmt:formatNumber value="${out_kbe[0].sum }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_kbe.size()+out_kbe.size()}"><fmt:formatNumber value="${end.kbe}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_kbe.size() + out_kbe.size())>0 ? (in_kbe.size() + out_kbe.size())-1 : (in_kbe.size()+out_kbe.size())}">
		<tr>
			<td>${in_kbe[i].item }</td>
			<td class="sel-com" data="${in_kbe[i].no }">${in_kbe[i].detail }</td>
			<td>${in_kbe[i].client }</td>
			<td class="num"><fmt:formatNumber value="${in_kbe[i].sum }" groupingUsed="true"/></td>
			<td>${out_kbe[i].item }</td>
			<td class="sel-com" data="${out_kbe[i].no }">${out_kbe[i].detail }</td>
			<td>${out_kbe[i].client }</td>
			<td class="num"><fmt:formatNumber value="${out_kbe[i].sum }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_sh.size()+out_sh.size()}" style="background-color:#E0FFFF">신한(매출)</td>
			<td rowspan="${in_sh.size()+out_sh.size()}" class="num"><fmt:formatNumber value="${begin.sh}" groupingUsed="true"/></td>
			<td>${in_sh[0].item }</td>
			<td class="sel-com" data="${in_sh[0].no }">${in_sh[0].detail }</td>
			<td>${in_sh[0].client }</td>
			<td class="num"><fmt:formatNumber value="${in_sh[0].sum }" groupingUsed="true"/></td>
			<td>${out_sh[0].item }</td>
			<td class="sel-com" data="${out_sh[0].no }">${out_sh[0].detail }</td>
			<td>${out_sh[0].client }</td>
			<td class="num"><fmt:formatNumber value="${out_sh[0].sum }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_sh.size()+out_sh.size()}"><fmt:formatNumber value="${end.sh}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_sh.size() + out_sh.size())>0 ? (in_sh.size() + out_sh.size())-1 : (in_sh.size()+out_sh.size())}">
		<tr>
			<td>${in_sh[i].item }</td>
			<td class="sel-com" data="${in_sh[i].no }">${in_sh[i].detail }</td>
			<td>${in_sh[i].client }</td>
			<td class="num"><fmt:formatNumber value="${in_sh[i].sum }" groupingUsed="true"/></td>
			<td>${out_sh[i].item }</td>
			<td class="sel-com" data="${out_sh[i].no }">${out_sh[i].detail }</td>
			<td>${out_sh[i].client }</td>
			<td class="num"><fmt:formatNumber value="${out_sh[i].sum }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_km.size()+out_km.size()}" style="background-color:#E0FFFF">국민(매출)</td>
			<td rowspan="${in_km.size()+out_km.size()}" class="num"><fmt:formatNumber value="${begin.km}" groupingUsed="true"/></td>
			<td>${in_km[0].item }</td>
			<td class="sel-com" data="${in_km[0].no }">${in_km[0].detail }</td>
			<td>${in_km[0].client }</td>
			<td class="num"><fmt:formatNumber value="${in_km[0].sum }" groupingUsed="true"/></td>
			<td>${out_km[0].item }</td>
			<td class="sel-com" data="${out_km[0].no }">${out_km[0].detail }</td>
			<td>${out_km[0].client }</td>
			<td class="num"><fmt:formatNumber value="${out_km[0].sum }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_km.size()+out_km.size()}"><fmt:formatNumber value="${end.km}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_km.size() + out_km.size())>0 ? (in_km.size() + out_km.size())-1 : (in_km.size()+out_km.size())}">
		<tr>
			<td>${in_km[i].item }</td>
			<td class="sel-com" data="${in_km[i].no }">${in_km[i].detail }</td>
			<td>${in_km[i].client }</td>
			<td class="num"><fmt:formatNumber value="${in_km[i].sum }" groupingUsed="true"/></td>
			<td>${out_km[i].item }</td>
			<td class="sel-com" data="${out_km[i].no }">${out_km[i].detail }</td>
			<td>${out_km[i].client }</td>
			<td class="num"><fmt:formatNumber value="${out_km[i].sum }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td style="background-color:#E0FFFF">소계(원화)</td>
			<td><fmt:formatNumber value="${begin.nhi + begin.nhe + begin.kbi + begin.kbe + begin.sh + begin.km }" groupingUsed="true"/></td>
			<td colspan="4"><fmt:formatNumber value="${incomesum }" groupingUsed="true"/></td>
			<td colspan="4"><fmt:formatNumber value="${expensesum }" groupingUsed="true"/></td>
			<td><fmt:formatNumber value="${end.nhi + end.nhe + end.kbi + end.kbe + end.sh + end.km }" groupingUsed="true"/></td>
		</tr>
	</tbody>
</table>
<hr/>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body" style="padding:20px 30px; text-align: center;">
				<form role="form" id="updateModal">
					<table width="100%">
						<tr>
							<td>구분</td>
							<td><input type="text" name="div" id="div" value=""></td>
						</tr>
						<tr>
							<td>수단</td>
							<td><input type="text" name="method" id="method" value=""></td>
						</tr>
						<tr>
							<td>사용자</td>
							<td><input type="text" name="client" id="client" value=""></td>
						</tr>
						<tr>
							<td>비목</td>
							<td><input type="text" name="item" id="item" value=""></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><input type="text" name="detail" id="detail" value=""></td>
						</tr>
						<tr>
							<td>금액</td>
							<td><input type="number" name="sum" id="sum" value=""></td>
						</tr>
						<tr>
							<td>비고</td>
							<td><input type="text" name="etc" id="etc" value=""></td>
						</tr>
					</table><br/>
					<input type="hidden" name="no" id="no" value="">
					<input type="hidden" name="tran_date" id="tran_date" value="">
					<button type="button" id="updateBtn" class="btn btn-success">수정</button>
					<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
				</form>
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
function dateAddDel(sDate, nNum) {
    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(5, 2), 10);
    var dd = parseInt(sDate.substr(8), 10);
        d = new Date(yy, mm - 1, dd + nNum);
    yy = d.getFullYear();
    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
    return '' + yy + '-' +  mm  + '-' + dd;
}
$("#pre").click(function(){
	var yesterday = dateAddDel('${date}', -1);
	window.location.href="/inquiry/daily?date="+yesterday;
})
$("#next").click(function(){
	var nextday = dateAddDel('${date}', 1);
	window.location.href="/inquiry/daily?date="+nextday;
})

// 수정 modal
$(".sel-com").dblclick(function(){
	var no = $(this).attr("data");
	var date = $("#modalDate").html();
	$.getJSON("/inquiry/modify?no="+no, function(data){
		$("#div").val(data.div);
		$("#method").val(data.method);
		$("#client").val(data.client);
		$("#item").val(data.item);
		$("#detail").val(data.detail);
		$("#sum").val(data.sum);
		$("#etc").val(data.etc);
		$("#no").val(data.no);
		$("#tran_date").val(date);
		$("#myModal").modal();
	})
})

$("#updateBtn").click(function(){
	var data = $("#updateModal").serialize();
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/inquiry/update",
		"data":data,
		success:function(){
			$("#myModal").modal("hide");
			location.reload();
		}
	})
})

$("#deleteBtn").click(function(){
	if(window.confirm("정말 삭제하시겠습니까?")){
		var data = $("#updateModal").serialize();
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/inquiry/delete",
			"data":data,
			success:function(){
				$("#myModal").modal("hide");
				location.reload();
			}
		})
	}else{
		$("#myModal").modal("hide");
	}
})
</script>