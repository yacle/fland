<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<script src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
</head>
<style>
table{
	border-collapse: collapse;
}
.mainTbl{
	 border: none;
	 cellspacing: 0;
	 cellpadding: 0;
}
td{
	padding:0px;
	text-align:center;
	font-size:13px;
}
.hover:hover {background-color:#ADFF2F;}
th{
	text-align: center;
	font-size:12px;
	background-color: #FFFF00;
}
tr{
	height: 25px;
}
#tablefixed {table-layout:fixed;}
</style>
<nav class="navbar navbar-inverse">
	<ul class="nav navbar-nav">
	    <li><a id="date" href="">일별</a></li>
	    <li class="active"><a href="">월별</a></li>
	    <li><a href="/inquiry/yearly?year=2018">연별</a></li>
		<form class="navbar-form navbar-right" action="/inquiry/monthly">
			<div class="form-group">
				<input type="month" name="month" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">조회</button>
		</form>
	</ul>
</nav>
<div class="row">
	<div class="col-lg-1"><button type="button" class="btn btn-success" id="print">EXCEL</button></div>
	<div class="col-lg-10" align="center">
		<h2>[<span id="mon">${month}</span>월 자금 실적서]<small><a href="/inquiry/state?month=${month}">[통계자료]</a></small></h2>
	</div>
</div>
<div>
<table class=" mainTbl" id="tablefixed">
	<tr valign="top">
		<td align="right">
			<table id="export1" border="1" style="margin-right:-2; background-color:#E0FFFF;" width="220px">
				<tr>
					<th width="50px">구분</th>
					<th colspan="2">내역</th>
                </tr>
                <tr>
                	<td colspan="3" style="padding:2px;">기초잔액(A)</td>
                </tr>
                <tr>
                	<td rowspan="7">입 금</td>
					<td width="80px" rowspan="2">영업수입</td>
					<td width="90px">매출</td>
                </tr>
                <tr>
                	<td>업체환급</td>
                </tr>
				<tr>
					<td rowspan="4">영업외수입</td>
					<td>금융이자</td>
				</tr>
				<tr>
					<td>차입금</td>
				</tr>
				<tr>
					<td>카드취소</td>
				</tr>
				<tr>
					<td>세금환급</td>
				</tr>
				<tr>
					<td colspan="2">입금계(B)</td>
				</tr>
				<tr>
					<td rowspan="20">출 금</td>
					<td rowspan="3">매입출금</td>
					<td>대금결제</td>
				</tr>
				<tr>
					<td>물류비</td>
				</tr>
				<tr>
					<td>물류비(에어)</td>
				</tr>
				<tr>
					<td rowspan="5">고정비</td>
					<td>임대관리비</td>
				</tr>
				<tr>
					<td>급여</td>
				</tr>
				<tr>
					<td>차입금상환</td>
				</tr>
				<tr>
					<td>세금</td>
				</tr>
				<tr>
					<td>4대보험</td>
				</tr>
				<tr>
					<td rowspan="11">변동비</td>
					<td>접대비</td>
				</tr>
				<tr>
					<td>대표자-차량</td>
				</tr>
				<tr>
					<td>대표자-경비</td>
				</tr>
				<tr>
					<td>박성진-차량</td>
				</tr>
				<tr>
					<td>박성진-식대</td>
				</tr>
				<tr>
					<td>박성진-경비</td>
				</tr>
				<tr>
					<td>한정신-차량</td>
				</tr>
				<tr>
					<td>한정신-식대</td>
				</tr>
				<tr>
					<td>한정신-경비</td>
				</tr>
				<tr>
					<td>공용-식대</td>
				</tr>
				<tr>
					<td>공용-경비</td>
				</tr>
				<tr>
					<td colspan="2">출금계(C)</td>
				</tr>
				<tr>
					<td colspan="3">자금과부족(B-C)</td>
				</tr>
				<tr>
					<td colspan="3">기말잔액(A+B-C)</td>
				</tr>
            </table>
        </td>
        <td align="left">
            <div style="width:1600px; overflow-x: auto;">
				<table id="export2" border="1">
					<tr class="hover">
						<th width="90px">합계</th>
						<c:forEach var="i" begin="1" end="31">
							<th class="sel-date" value="${i}">${i}</th>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td width="90px"></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${begin[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item01Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item01[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item02Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item02[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item03Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item03[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item04Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item04[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item05Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item05[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item06Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item06[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${incomeTotal}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${incomeSum[i] }" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item07Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item07[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item08Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item08[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item081Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item081[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item09Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item09[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item10Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item10[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item11Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item11[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item12Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item12[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item13Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item13[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item14Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item14[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item15Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item15[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item16Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item16[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item17Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item17[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item18Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item18[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item19Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item19[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item20Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item20[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item21Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item21[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item22Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item22[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item23Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item23[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item24Sum}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${item24[i]}" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${expenseTotal}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${expenseSum[i] }" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${incomeTotal + expenseTotal}" groupingUsed="true"/></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px; color:red;"><fmt:formatNumber value="${incomeSum[i] + expenseSum[i] }" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
					<tr class="hover">
						<td></td>
						<c:forEach var="i" begin="0" end="30">
							<td style="text-align:right; padding:3px;"><fmt:formatNumber value="${end[i] }" groupingUsed="true"/></td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
</div><hr/>
<script>
// 일일 조회로 이동
	var date=new Date();
	var yy=date.getFullYear();
	var mm=date.getMonth()+1;
	if(mm<10){
		mm = '0'+mm;
	}
	var dd=date.getDate();
	if(dd<10){
		dd = '0'+dd;
	}
	document.getElementById("date").href="/inquiry/daily?date="+yy+"-"+mm+"-"+dd;
	
// 선택일자로 이동
	$(".sel-date").dblclick(function(){
		var day = this.innerHTML;
		if(day<10){
			day = "0"+day;
		}
		var mon = $("#mon").html();
		window.location ="/inquiry/daily?date="+mon+"-"+day;
	})
// excel file 출력
	$("#print").click(function(e){
		$(function() {
			$("#export1").table2excel({
				name: "Excel Document Name",
				filename: "myFileName" + new Date().toISOString().replace(/[\-\:\.]/g, ""),
				fileext: ".xls",
				exclude_img: true,
				exclude_links: true,
				exclude_inputs: true
			});
		});
		$(function() {
			$("#export2").table2excel({
				name: "Excel Document Name",
				filename: "myFileName" + new Date().toISOString().replace(/[\-\:\.]/g, ""),
				fileext: ".xls",
				exclude_img: true,
				exclude_links: true,
				exclude_inputs: true
			});
		});
	})
</script>