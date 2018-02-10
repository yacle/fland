<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</style>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li class="active"><a href="">일일</a></li>
    <li><a href="/inquiry/list">종합</a></li>
    <form class="navbar-form navbar-right" action="/inquiry/daily">
      <div class="form-group">
        <input type="date" name="date" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">조회</button>
    </form>
  </ul>
</nav>
<div class="title">
	<h2><b>일일자금수지 실적표</b> [${date}]</h2>
	<ul class="pager">
		<li class="previous" id="pre"><a href="#">Previous</a></li>
		<li class="next" id="next"><a href="#">Next</a></li>
	</ul>
</div>
<div align="center">
<table border="1" width="90%">
	<thead>
		<tr>
			<th rowspan="2">은행구분</th>
			<th rowspan="2">기초잔액</th>
			<th colspan="4">수입</th>
			<th colspan="4">지출</th>
			<th rowspan="2">기말잔액</th>
		</tr>
		<tr>
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
			<td width="8%" rowspan="${in_nhi.size()+out_nhi.size()}">농협(매출)</td>
			<td width="8%" class="num" rowspan="${in_nhi.size()+out_nhi.size()}"><fmt:formatNumber value="${begin.nhi}" groupingUsed="true"/></td>
			<td width="7%">${in_nhi[0].ITEM }</td>
			<td width="15%">${in_nhi[0].DETAIL }</td>
			<td width="7%">${in_nhi[0].CLIENT }</td>
			<td width="8%" class="num"><fmt:formatNumber value="${in_nhi[0].SUM }" groupingUsed="true"/></td>
			<td width="7%">${outnhi[0].ITEM }</td>
			<td width="15%">${outnhi[0].DETAIL }</td>
			<td width="7%">${outnhi[0].CLIENT }</td>
			<td width="8%" class="num"><fmt:formatNumber value="${outnhi[0].SUM }" groupingUsed="true"/></td>
			<td width="10%" class="num" rowspan="${in_nhi.size()+out_nhi.size()}"><fmt:formatNumber value="${end.nhi}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_nhi.size() + out_nhi.size())>0 ? (in_nhi.size() + out_nhi.size())-1 : (in_nhi.size()+out_nhi.size())}">
		<tr>
			<td>${in_nhi[i].ITEM }</td>
			<td>${in_nhi[i].DETAIL }</td>
			<td>${in_nhi[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_nhi[i].SUM }" groupingUsed="true"/></td>
			<td>${outnhi[i].ITEM }</td>
			<td>${outnhi[i].DETAIL }</td>
			<td>${outnhi[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${outnhi[i].SUM }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_nhe.size()+out_nhe.size()}">농협(경비)</td>
			<td rowspan="${in_nhe.size()+out_nhe.size()}" class="num"><fmt:formatNumber value="${begin.nhe}" groupingUsed="true"/></td>
			<td>${in_nhe[0].ITEM }</td>
			<td>${in_nhe[0].DETAIL }</td>
			<td>${in_nhe[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_nhe[0].SUM }" groupingUsed="true"/></td>
			<td>${out_nhe[0].ITEM }</td>
			<td>${out_nhe[0].DETAIL }</td>
			<td>${out_nhe[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_nhe[0].SUM }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_nhe.size()+out_nhe.size()}"><fmt:formatNumber value="${end.nhe}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_nhe.size() + out_nhe.size())>0 ? (in_nhe.size() + out_nhe.size())-1 : (in_nhe.size()+out_nhe.size())}">
		<tr>
			<td>${in_nhe[i].ITEM }</td>
			<td>${in_nhe[i].DETAIL }</td>
			<td>${in_nhe[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_nhe[i].SUM }" groupingUsed="true"/></td>
			<td>${out_nhe[i].ITEM }</td>
			<td>${out_nhe[i].DETAIL }</td>
			<td>${out_nhe[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_nhe[i].SUM }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_kbi.size()+out_kbi.size()}">기업(매출)</td>
			<td rowspan="${in_kbi.size()+out_kbi.size()}" class="num"><fmt:formatNumber value="${begin.kbi}" groupingUsed="true"/></td>
			<td>${in_kbi[0].ITEM }</td>
			<td>${in_kbi[0].DETAIL }</td>
			<td>${in_kbi[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_kbi[0].SUM }" groupingUsed="true"/></td>
			<td>${out_kbi[0].ITEM }</td>
			<td>${out_kbi[0].DETAIL }</td>
			<td>${out_kbi[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_kbi[0].SUM }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_kbi.size()+out_kbi.size()}"><fmt:formatNumber value="${end.kbi}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_kbi.size() + out_kbi.size())>0 ? (in_kbi.size() + out_kbi.size())-1 : (in_kbi.size()+out_kbi.size())}">
		<tr>
			<td>${in_kbi[i].ITEM }</td>
			<td>${in_kbi[i].DETAIL }</td>
			<td>${in_kbi[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_kbi[i].SUM }" groupingUsed="true"/></td>
			<td>${out_kbi[i].ITEM }</td>
			<td>${out_kbi[i].DETAIL }</td>
			<td>${out_kbi[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_kbi[i].SUM }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_kbe.size()+out_kbe.size()}">기업(경비)</td>
			<td class="num" rowspan="${in_kbe.size()+out_kbe.size()}"><fmt:formatNumber value="${begin.kbe}" groupingUsed="true"/></td>
			<td>${in_kbe[0].ITEM }</td>
			<td>${in_kbe[0].DETAIL }</td>
			<td>${in_kbe[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_kbe[0].SUM }" groupingUsed="true"/></td>
			<td>${out_kbe[0].ITEM }</td>
			<td>${out_kbe[0].DETAIL }</td>
			<td>${out_kbe[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_kbe[0].SUM }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_kbe.size()+out_kbe.size()}"><fmt:formatNumber value="${end.kbe}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_kbe.size() + out_kbe.size())>0 ? (in_kbe.size() + out_kbe.size())-1 : (in_kbe.size()+out_kbe.size())}">
		<tr>
			<td>${in_kbe[i].ITEM }</td>
			<td>${in_kbe[i].DETAIL }</td>
			<td>${in_kbe[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_kbe[i].SUM }" groupingUsed="true"/></td>
			<td>${out_kbe[i].ITEM }</td>
			<td>${out_kbe[i].DETAIL }</td>
			<td>${out_kbe[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_kbe[i].SUM }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_sh.size()+out_sh.size()}">신한(매출)</td>
			<td rowspan="${in_sh.size()+out_sh.size()}" class="num"><fmt:formatNumber value="${begin.sh}" groupingUsed="true"/></td>
			<td>${in_sh[0].ITEM }</td>
			<td>${in_sh[0].DETAIL }</td>
			<td>${in_sh[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_sh[0].SUM }" groupingUsed="true"/></td>
			<td>${out_sh[0].ITEM }</td>
			<td>${out_sh[0].DETAIL }</td>
			<td>${out_sh[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_sh[0].SUM }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_sh.size()+out_sh.size()}"><fmt:formatNumber value="${end.sh}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_sh.size() + out_sh.size())>0 ? (in_sh.size() + out_sh.size())-1 : (in_sh.size()+out_sh.size())}">
		<tr>
			<td>${in_sh[0].ITEM }</td>
			<td>${in_sh[0].DETAIL }</td>
			<td>${in_sh[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_sh[0].SUM }" groupingUsed="true"/></td>
			<td>${out_sh[0].ITEM }</td>
			<td>${out_sh[0].DETAIL }</td>
			<td>${out_sh[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_sh[0].SUM }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td rowspan="${in_km.size()+out_km.size()}">국민(매출)</td>
			<td rowspan="${in_km.size()+out_km.size()}" class="num"><fmt:formatNumber value="${begin.km}" groupingUsed="true"/></td>
			<td>${in_km[0].ITEM }</td>
			<td>${in_km[0].DETAIL }</td>
			<td>${in_km[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_km[0].SUM }" groupingUsed="true"/></td>
			<td>${out_km[0].ITEM }</td>
			<td>${out_km[0].DETAIL }</td>
			<td>${out_km[0].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_km[0].SUM }" groupingUsed="true"/></td>
			<td class="num" rowspan="${in_km.size()+out_km.size()}"><fmt:formatNumber value="${end.km}" groupingUsed="true"/></td>
		</tr>
		<c:forEach var="i" begin="1" end="${(in_km.size() + out_km.size())>0 ? (in_km.size() + out_km.size())-1 : (in_km.size()+out_km.size())}">
		<tr>
			<td>${in_km[i].ITEM }</td>
			<td>${in_km[i].DETAIL }</td>
			<td>${in_km[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${in_km[i].SUM }" groupingUsed="true"/></td>
			<td>${out_km[i].ITEM }</td>
			<td>${out_km[i].DETAIL }</td>
			<td>${out_km[i].CLIENT }</td>
			<td class="num"><fmt:formatNumber value="${out_km[i].SUM }" groupingUsed="true"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
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
</script>