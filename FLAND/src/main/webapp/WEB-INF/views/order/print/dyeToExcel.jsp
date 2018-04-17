<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<style>
#div1{
	width:595px;
	height:842px;
	border: 1px solid black;
	outline-style: solid;
    outline-color: black;
    margin: 20px;
    padding: 0px;
}
table{
	width: 96%;
	border-collapse: collapse;
}
table, th, td {
	border: 1px solid black;
	text-align: center;

}
</style>
<head>
	<script type="text/javascript">
		var fnPrint = function() {
			document.body.innerHTML = div1.innerHTML;
			window.print();
	};
	</script>
</head>
<body>
<div class="row">
	<div class="col-lg-4" align="center">
		<button type="button" class="btn btn-success" style="margin-top: 300px;" onclick="fnPrint()" >프린트</button> 
	</div>
	<div  class="col-lg-4" align="center">
		<div id="div1">
			<h2>[염색의뢰서]</h2><br/>
			<table>
				<tr>
					<th width="17%">날짜</th>
					<th width="28%">ORDER NO</th>
					<th width="17%">Sample NO</th>
					<th width="12%">담당</th>
					<th width="12%">부장</th>
					<th width="14%">대표</th>
				</tr>
				<tr>
					<td style="height: 40px;"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<table>
				<tr>
					<th colspan="2">생지출고처</th>
					<th colspan="3">염색처</th>
				</tr>
				<tr>
					<td width="17%"></td>
					<td width="28%"></td>
					<td width="17%"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th colspan="2">품명</th>
					<th>원단가공폭</th>
					<th colspan="2">원단가공중량</th>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td></td>
					<td></td>
					<td></td>
			</table>
		</div>
	</div>
	<div class="col-lg-4">
	</div>
</div>
</body>
</html>