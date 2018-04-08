<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
// 편직의뢰서 01
function add_knit() {
	var my_tbody4 = document.getElementById('my-tbody4');
	var row4 = my_tbody4.insertRow(my_tbody4.rows.length);
	var cell41 = row4.insertCell(0);
	var cell42 = row4.insertCell(1);
	var cell43 = row4.insertCell(2);
	var cell44 = row4.insertCell(3);
	var cell45 = row4.insertCell(4);
	cell41.innerHTML = '<input type="text" class="form-control thread" placeholder="사종">';
	cell42.innerHTML = '<input type="number" class="form-control ratio" placeholder="%">';
	cell43.innerHTML = '<input type="number" class="form-control Knitweight" placeholder="kg">';
	cell44.innerHTML = '<input type="text" class="form-control thread_com" placeholder="원사업체">';
	cell45.innerHTML = '<input type="text" class="form-control lot" placeholder="lot">';
}
function del_knit(){
	var my_tbody4 = document.getElementById('my-tbody4');
	if (my_tbody4.rows.length < 1) return;
	my_tbody4.deleteRow( my_tbody4.rows.length-1 );
}
</script>
<style>
.col-lg-4{
    padding: 10px;
    text-align: center;
}
.table2, .table4{
	border-collapse: separate;
	border-spacing: 10px;
	width: 100%;
}
td, th{
	text-align: center;
	font-weight: bold;
}
input{
	text-align: right;
	box-sizing: border-box;
	text-align:center;
}
</style>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/">HOME</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/order/new">발주서</a></li>
			<li><a href="/order/dye">염색의뢰서</a></li>
			<li><a href="#">편직의뢰서</a></li>
		</ul>
	</div>
</nav>
<div class="row">
	<div class="col-lg-4">	
		<form action="/order/knitSearch" method="POST">
			<table class="table2" style="margin-top:50px; border-spacing: 30px;">
				<tr>
					<td width="5%"></td>
					<td width="25%">Order NO</td>
					<td width="50%"><input type="text" class="form-control" name="orderno" id="orderno" value="${map.orderno }"></td>
					<td width="20%"><button type="submit" class="btn btn-info">Search</button></td>
				</tr>
				<c:forEach var="i" begin="1" end="${list.size() }" step="1">
					<tr>
						<td colspan="4">
							<button type="button" size="5" class="btn knitBtn" value="${i }">편직의뢰서 ${i }</button>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<button type="button" size="5" class="btn" id="knitNew">NEW</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-lg-4">
		<h3 class="title">편직의뢰서 1</h3>
		<table class="table4">
			<tr>
				<td width="15%">&#10020; 절수</td>
				<td><input type="text" id="rttl" value="${list.rolltotal }class="form-control" readonly></td>
				<td width="15%">&#10020; 총중량</td>
				<td><input type="text" id="pkttl" value="${list.perkgtotal }" class="form-control" readonly></td>
			</tr>
			<tr>
				<td>편직처</td>
				<td colspan="3"><input type="text" id="knitcompany" value="${ }" class="form-control" placeholder="편직처"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td colspan="3"><input type="text" id="delivery" value="${ }" class="form-control" placeholder="출고처"></td>
			</tr>
		</table>
		<table class="table4">
			<tr>
				<td>인치</td>
				<td>게이지</td>
				<td>침수</td>
				<td>조직</td>
				<td>루프장</td>
			</tr>
			<tr>
				<td><input type="number" id="inch" value="${ }" class="form-control"></td>
				<td><input type="number" id="gage" value="${ }" class="form-control"></td>
				<td><input type="number" id="niddle" value="${ }" class="form-control"></td>
				<td><input type="text" id="organ" value="${ }" class="form-control"></td>
				<td><input type="number" id="looplength" value="${ }" class="form-control"></td>
			</tr>
		</table>
		<table class="table4">
			<tr>
				<td width="35%">사종</td>
				<td width="15%">비율</td>
				<td width="15%">중량</td>
				<td width="25%">업체</td>
				<td width="10%">CONE</td>
			</tr>	
			<tbody id="my-tbody4">
				<tr>
					<td><input type="text" class="form-control thread" value="${data.THREAD[0] }" placeholder="사종"></td>
					<td><input type="number" class="form-control ratio" id="ratio01" value="${data.RATIO[0]" placeholder="%"></td>
					<td><input type="text" class="form-control Knitweight" id="Knitweight01" value="${data.KNITWEIGHT[0] }" placeholder="kg" readonly></td>
					<td><input type="text" class="form-control thread_com" value="${data.THREAD_COM[0] }" placeholder="원사업체"></td>
					<td><input type="text" class="form-control con" value="${data.CON[0] }" placeholder="cone"></td>
				</tr>
				<tr>
					<td><input type="text" class="form-control thread" value="${data.THREAD[1] }" placeholder="사종"></td>
					<td><input type="number" class="form-control ratio" id="ratio02" value="${data.RATIO[1] }" placeholder="%"></td>
					<td><input type="text" class="form-control Knitweight" id="Knitweight02" value="${data.KNITWEIGHT[1] }" placeholder="kg" readonly></td>
					<td><input type="text" class="form-control thread_com" value="${data.THREAD_COM[1] }" placeholder="원사업체"></td>
					<td><input type="text" class="form-control con" value="${data.CON[1] }" placeholder="cone"></td>
				</tr><tr>
					<td><input type="text" class="form-control thread" value="${data.THREAD[2] }" placeholder="사종"></td>
					<td><input type="number" class="form-control ratio" id="ratio03" value="${data.RATIO[2] }" placeholder="%"></td>
					<td><input type="text" class="form-control Knitweight" id="Knitweight03" value="${data.KNITWEIGHT[2] }" placeholder="kg" readonly></td>
					<td><input type="text" class="form-control thread_com" value="${data.THREAD_COM[2] }" placeholder="원사업체"></td>
					<td><input type="text" class="form-control con" value="${data.CON[2] }" placeholder="cone"></td>
				</tr><tr>
					<td><input type="text" class="form-control thread" value="${data.THREAD[3] }" placeholder="사종"></td>
					<td><input type="number" class="form-control ratio" id="ratio04" value="${data.RATIO[3] }" placeholder="%"></td>
					<td><input type="text" class="form-control Knitweight" id="Knitweight04" value="${data.KNITWEIGHT[3] }" placeholder="kg" readonly></td>
					<td><input type="text" class="form-control thread_com" value="${data.THREAD_COM[3] }" placeholder="원사업체"></td>
					<td><input type="text" class="form-control con" value="${data.CON[3] }" placeholder="cone"></td>
				</tr><tr>
					<td><input type="text" class="form-control thread" value="${data.THREAD[4] }" placeholder="사종"></td>
					<td><input type="number" class="form-control ratio" id="ratio05" value="${data.RATIO[4] }" placeholder="%"></td>
					<td><input type="text" class="form-control Knitweight" id="Knitweight05" value="${data.KNITWEIGHT[4] }" placeholder="kg" readonly></td>
					<td><input type="text" class="form-control thread_com" value="${data.THREAD_COM[4] }" placeholder="원사업체"></td>
					<td><input type="text" class="form-control con" value="${data.CON[4] }" placeholder="cone"></td>
				</tr>
			</tbody>
		</table><hr/>
		<button type="button" class="btn btn-primary" id="knitBtn">저장</button>
	</div>
	<div class="col-lg-4">
		<div>
			<h4></h4>
		</div>
		<table class="table table-bordered">
			<tr>
				<td width="20%">컬러</td>
				<td width="20%">절수</td>
				<td width="30%">수량(KG)</td>
				<td width="30%">발주량(yard)</td>
			</tr>
			<tbody id="tbody">
			</tbody>
		</table>
	</div>
</div>
	
<script>
$(document).ready(function(){
	if($("#orderno").val()==""){
		window.alert("Order No를 입력해주세요");
	}else{
		$.ajax({
			"type":"POST",
			"async":false,
			"url":"/order/knitNew",
			"data":{
				"orderno":$("#orderno").val(),
			},
			success:function(obj){
				$("#tbody").html(obj);
				var rttl = $("#rollTotal").html();
				var pkttl = $("#perkgTotal").html();
				$("#rttl").val(rttl);
				$("#pkttl").val(pkttl);
			}
		})
	}
});
// search
$("#knitBtn").click(function(){
	var index = $(this).val();
})

// yard 중량 입력
$("#workWeight").change(function(){
	var gperyd = $("#workWeight").val();
	var width = $("#workWidth").val();
	var gperm = (parseInt(gperyd)/(0.465)/(parseInt(width)/2))*10;
	$("#mWeight").val(Math.round(gperm)+" g/m2");
	$("#workWeight").val(gperyd+" g/yd");
})
// m2 중량 입력
$("#mWeight").change(function(){
	var gperm = $("#mWeight").val();
	var width = $("#workWidth").val();
	var gperyd = (parseInt(gperm)*0.465*(parseInt(width)/2))/10;
	$("#workWeight").val(Math.round(gperyd)+" g/yd");
	$("#mWeight").val(gperm+" g/m2");
})

$(document).on('change','.ttl', function(){
	var total=0;
	var sum=document.getElementsByClassName("ttl");
	for(var i=0; i<sum.length; i++){
		var s = sum[i].value;
		total += parseInt(s);
	};
	$("#ttl").html("<b>"+total+"</b>");
})


// 편직의뢰서 저장 function
function knitAdd1(){
	var thread=[];
	var ratio=[];
	var weight=[];
	var thread_com=[];
	var con=[];
	var threadArr = document.getElementsByClassName("thread");
	var ratioArr = document.getElementsByClassName("ratio");
	var weightArr = document.getElementsByClassName("knitweight");
	var thread_comArr = document.getElementsByClassName("thread_com");
	var conArr = document.getElementsByClassName("con");
	for(var i=0; i<threadArr.length; i++){
		thread.push(threadArr[i].value);
		ratio.push(ratioArr[i].value);
		weight.push(weightArr[i].value);	
		thread_com.push(thread_comArr[i].value);
		con.push(conArr[i].value);
	}
	var thread_json = JSON.stringify(thread);
	var ratio_json = JSON.stringify(ratio);
	var weight_json = JSON.stringify(weight)
	var thread_com_json = JSON.stringify(thread_com);
	var con_json = JSON.stringify(con);
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/knitAdd",
		"data":{
			"orderno":$("#orderno").val(),
			"thread":thread_json,
			"ratio":ratio_json,
			"weight":weight_json,
			"thread_com":thread_com_json,
			"con":con_json,
			"rolltotal":parseInt($("#rolltotal").val()),
			"perkgtotal":parseInt($("#perkgtotal").val()),
			"knitcompany":$("#knitcompany").val(),
			"delivery":$("#delivery").val(),
			"inch":$("#inch").val(),
			"gage":$("#gage").val(),
			"niddle":$("#niddle").val(),
			"organ":$("#organ").val(),
			"looplength":$("#looplength").val()
		},
		success:function(map){
			window.location.href="/order/thread?orderno="$("#orderno").val();
		}
	})
}

// 편직의뢰서 저장버튼
$("#ratio01").change(function(){
	var kgttl = $("#pkttl").val();
	var ratio01 = $("#ratio01").val();
	var weight = parseInt(ratio01)*parseInt(kgttl)/100;
	$("#Knitweight01").val(Math.round(weight));
})
$("#ratio02").change(function(){
	var kgttl = $("#pkttl").val();
	var ratio02 = $("#ratio02").val();
	var weight2 = parseInt(ratio02)*parseInt(kgttl)/100;
	$("#Knitweight02").val(Math.round(weight2));
})
$("#ratio03").change(function(){
	var kgttl = $("#pkttl").val();
	var ratio03 = $("#ratio03").val();
	var weight3 = parseInt(ratio03)*parseInt(kgttl)/100;
	$("#Knitweight03").val(Math.round(weight3));
})
$("#ratio04").change(function(){
	var kgttl = $("#pkttl").val();
	var ratio04 = $("#ratio04").val();
	var weight4 = parseInt(ratio04)*parseInt(kgttl)/100;
	$("#Knitweight04").val(Math.round(weight4));
})
$("#ratio05").change(function(){
	var kgttl = $("#pkttl").val();
	var ratio05 = $("#ratio05").val();
	var weight5 = parseInt(ratio05)*parseInt(kgttl)/100;
	$("#Knitweight05").val(Math.round(weight5));
})
$("#knitBtn").click(function(){
	var ratio01 = $("#ratio01").val();
	var ratio02 = $("#ratio02").val();
	var ratio03 = $("#ratio03").val();
	var ratio04 = $("#ratio04").val();
	var ratio05 = $("#ratio05").val();
	var total = parseInt(ratio01);
	if($("#ratio02").val()!=""){
		total+=parseInt(ratio02);
	}
	if($("#ratio03").val()!=""){
		total+=parseInt(ratio03);
	}
	if($("#ratio04").val()!=""){
		total+=parseInt(ratio04);
	}
	if($("#ratio05").val()!=""){
		total+=parseInt(ratio05);
	}
	if(total!=100){
		window.alert(total+"/비율 합계가 100% 가 아닙니다. 확인바랍니다.");
	}else{
		knitAdd1();
	}
})
</script>