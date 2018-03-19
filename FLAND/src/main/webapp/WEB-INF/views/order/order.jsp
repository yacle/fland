<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
// 발주서 컬러별 수량
function add_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	var row = my_tbody1.insertRow(my_tbody1.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	cell1.innerHTML = '<input type="text" class="form-control color">' ;
	cell2.innerHTML = '<input type="number" class="form-control ttl" placeholder="YD">';
    cell3.innerHTML = '<input type="text" class="form-control colorBt">';
}
function del_row() {
	var my_tbody1 = document.getElementById('my-tbody1');
	if (my_tbody1.rows.length < 1) return;
	my_tbody1.deleteRow( my_tbody1.rows.length-1 );
}	
// 염색의뢰서 테스트 의뢰  
function add_test(){
	var test_tbody = document.getElementById('test-tbody');
	var test_row = test_tbody.insertRow(test_tbody.rows.length);
	var cell1 = test_row.insertCell(0);
	var cell2 = test_row.insertCell(1);
	cell1.innerHTML = '<input type="text" size="5" class="form-control testColor" style="text-align: center; box-sizing: border-box;">';
	cell2.innerHTML = '<input type="text" class="form-control test">';
}
function del_test(){
	var test_tbody = document.getElementById('test-tbody');
	if (test_tbody.rows.length < 1) return;
	test_tbody.deleteRow( test_tbody.rows.length-1 );
}
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
.table1, .table2, .table3, .table4, .table5{
	border-collapse: separate;
	border-spacing: 10px;
	width: 95%;
}
.center{
	border-left: 1px dotted blue;
	border-right: 1px dotted blue;
}
.table5{
	display: none;
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
.title{
	width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    background-color: #A9A9A9;
    color: black;
    text-align: center;
}
</style>
<div class="row">
	<div class="col-lg-4">	
		<h3 class="title">발주서</h3>
		<table class="table1">
		<tbody>
			<tr>
				<td width=30%>Order No</td>
				<td colspan="2"><input type="text" class="form-control" id="orderNo" required></td>
			</tr>
			<tr>
				<td>발주처</td>
				<td><input type="text" class="form-control" id="company" placeholder="발주회사"></td>
				<td><input type="text" class="form-control" id="person" placeholder="담당자"></td>
			</tr>
			<tr>
				<td>S/#</td>
				<td colspan="2"><input type="text" class="form-control" id="serial"></td>
			</tr>
			<tr>
				<td>발주일</td>
				<td colspan="2"><input type="date" class="form-control" id="orderDate"></td>
			</tr>
			<tr>
				<td>납기일</td>
				<td colspan="2"><input type="date" class="form-control" id="endDate"></td>
			</tr>
			<tr>
				<td>원단명</td>
				<td colspan="2"><input type="text" class="form-control" id="fabric"></td>
			</tr>
			<tr>
				<td>가공폭</td>
				<td colspan="2"><input type="number" class="form-control" id="workWidth"></td>
			</tr>
			<tr>
				<td>가공중량</td>
				<td colspan="2"><input type="number" class="form-control" id="workWeight" placeholder="g/yd" required></td>
			</tr>
			<tr align="center">
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">
					컬러
					<button type="button" onclick="add_row()" style="border-radius:5px; font-size: 10px;">+</button>&nbsp;
					<button type="button" onclick="del_row()" style="border-radius:5px; font-size: 10px;">&#8210;</button>
				</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">Order Length</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">BT No.</td>
			</tr>
			</tbody>
			<tbody id="my-tbody1">
				<tr>
					<td><input type="text" class="form-control color"></td>
					<td><input type="number" class="form-control ttl" placeholder="YD"></td>
					<td><input type="text" class="form-control colorBt"></td>
				</tr>
			</tbody>
			<tbody>
			<tr>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;"><b>Order Total</b></td>
				<td style="border-bottom: 1px solid blue; padding:0px 0px 5px;"><span id="ttl" style="color: red;"></span></td>
				<td  style="border-bottom: 1px solid blue; padding:0px 0px 5px; text-align:left;">YD</td>
			</tr>
			<tr>
				<td>단가</td>
				<td colspan="2"><input type="text" class="form-control" id="price"></td>
			</tr>
			<tr>
				<td>기타</td>
				<td colspan="2"><textarea class="form-control" id="etc"></textarea></td>
			</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-primary" id="orderBtn">저장</button>
	</div>
	<div class="col-lg-4 center">
		<h3 class="title">염색의뢰서</h3>
		<table class="table2">
			<tr>
				<td width="30%">LOSS %</td>
				<td width="30%"><input type="number" class="form-control" id="loss" placeholder="ex)1.15"></td>
				<td rowspan="2"><button type="button" id="dyeSum" class="btn btn-success">계산</button></td>
			</tr>
			<tr>
				<td>KG/절</td>
				<td ><input type="number" class="form-control" id="perkg"></td>
			</tr>
			<tr align="center">
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">컬러</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">절수</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">수량(KG)</td>
			</tr>
			<tbody id="my-tbody2">
			</tbody>
			<tr>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;">원단혼용율</td>
				<td style="border-top: 1px solid blue; padding:5px 0px 0px;" colspan="2">
					<input type="text" id="mixed" class="form-control">
				</td>
			</tr>
			<tr>
				<td>가공방법</td>
				<td colspan="2"><input type="text" id="method" class="form-control"></td>
			</tr>
			<tr>
				<td>세부사항</td>
				<td colspan="2"><input type="text" id="detail" class="form-control"></td>
			</tr>
			<tr>
		</table>
		<table class="table3">
			<tr>
				<td width="30%">시험의뢰&nbsp;
					<button type="button" onclick="add_test()" style="border-radius:5px; font-size: 10px;">+</button>&nbsp;
					<button type="button" onclick="del_test()" style="border-radius:5px; font-size: 10px;">&#8210;</button>
				</td>
				<td>염색견뢰도/축률/필링/사행도</td>
			</tr>
			<tbody id="test-tbody">
				<tr>
					<td><input type="text" size="5" class="form-control testColor" placeholder="컬러명"></td>
					<td><input type="text" class="form-control test" placeholder="테스트내용"></td>
				</tr>
			</tbody>
			<tr>
				<td>기타사항</td>
				<td><textarea id="dyeetc" class="form-control" rows="3">야드지 요청 : 퀄리티 컨펌용 3yd / 컬러컨펌용 1yd/ 자체 시험성적 결과 회신 바람</textarea></td>
			</tr>
			<tr>
				<td>주의사항</td>
				<td><textarea id="caution" class="form-control" rows="2">포장전 B/T 색상과 자체 비교 요망</textarea></td>
			</tr>
			<tr>
				<td>생지출고처</td>
				<td><input type="text" id="knitcompany" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>염색처</td>
				<td><input type="text" id="dyecompany" class="form-control" style="text-align:left;"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td><input type="text" id="delivery" class="form-control" style="text-align:left;"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="dyeBtn">저장</button>
	</div>
	<div class="col-lg-4">
		<h3 class="title">편직의뢰서</h3>
		<table class="table4">
			<tr>
				<td width="15%">&#10020; 절수</td>
				<td><input type="number" id="roll"class="form-control" placeholder="절" readonly></td>
				<td width="15%">&#10020; 총중량</td>
				<td><input type="number" id="kgttl"class="form-control" placeholder="kg" readonly></td>
			</tr>
			<tr>
				<td>편직처</td>
				<td colspan="3"><input type="text" id="knitcompany" class="form-control" placeholder="편직처"></td>
			</tr>
			<tr>
				<td>출고처</td>
				<td colspan="3"><input type="text" id="delivery" class="form-control" placeholder="출고처"></td>
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
				<td><input type="number" id="inch" class="form-control"></td>
				<td><input type="number" id="gage" class="form-control"></td>
				<td><input type="number" id="niddle" class="form-control"></td>
				<td><input type="text" id="organ" class="form-control"></td>
				<td><input type="number" id="loop" class="form-control"></td>
			</tr>
		</table>
		<table class="table4">
			<tr>
				<td width="35%">사종
					<button type="button" onclick="add_knit()" style="border-radius:5px; font-size: 10px;">+</button>
					<button type="button" onclick="del_knit()" style="border-radius:5px; font-size: 10px;">&#8210;</button>
				</td>
				<td width="15%">비율</td>
				<td width="15%">중량</td>
				<td width="25%">업체</td>
				<td width="10%">LOT</td>
			</tr>	
			<tbody id="my-tbody4">
				<tr>
					<td><input type="text" class="form-control thread" placeholder="사종"></td>
					<td><input type="number" class="form-control ratio" placeholder="%"></td>
					<td><input type="number" class="form-control Knitweight" placeholder="kg"></td>
					<td><input type="text" class="form-control thread_com" placeholder="원사업체"></td>
					<td><input type="text" class="form-control lot" placeholder="lot"></td>
				</tr>
			</tbody>
		</table><hr/>
		<button type="button" class="btn btn-primary" id="knitBtn">저장</button>
	</div>
</div>
	
<script>
$(document).on('change','.ttl', function(){
	var total=0;
	var sum=document.getElementsByClassName("ttl");
	for(var i=0; i<sum.length; i++){
		var s = sum[i].value;
		total += parseInt(s);
	};
	$("#ttl").html("<b>"+total+"</b>");
})

// 발주서 저장버튼
$("#orderBtn").click(function(){
	var colorList=document.getElementsByClassName("color");
	var orderLengthList=document.getElementsByClassName("ttl");
	var colorBtList=document.getElementsByClassName("colorBt");
	var color = colorList[0].value;;
	var orderLength = orderLengthList[0].value;
	var colorBt = colorBtList[0].value;
	for(var i=1; i<colorList.length; i++){
		color += "/"+colorList[i].value;
		orderLength += "/"+orderLengthList[i].value;
		colorBt += "/"+colorBtList[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/order",
		"data":{
			"orderno":$("#orderNo").val(),
			"company":$("#company").val(),
			"person":$("#person").val(),
			"serial":$("#serial").val(),
			"orderdate":$("#orderDate").val(),
			"enddate":$("#endDate").val(),
			"fabric":$("#fabric").val(),
			"workwidth":$("#workWidth").val(),
			"workweight":$("#workWeight").val(),
			"price":$("#price").val(),
			"color":color,
			"orderlength":orderLength,
			"colorbt":colorBt,
			"etc":$("#etc").html()
		},
		success:function(obj){
			if(obj=='new'){
				window.alert("신규저장 완료");
			}else{
				window.alert("업데이트 완료");
			}
			$("#orderNo").attr("disabled", true);
		}
	})
})
// 염색의뢰서 컬러별 절수계산 버튼
$("#dyeSum").click(function(){
	var colorList=document.getElementsByClassName("color");
	var orderLengthList=document.getElementsByClassName("ttl");
	var color = colorList[0].value;;
	var orderLength = orderLengthList[0].value;
	for(var i=1; i<colorList.length; i++){
		color += "/"+colorList[i].value;
		orderLength += "/"+orderLengthList[i].value;
	}
	var workWeight = $("#workWeight").val();
	var loss = $("#loss").val();
	var perkg = $("#perkg").val();
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/dyeSum",
		"data":{
			"loss": loss,
			"perkg": perkg,
			"color":color,
			"orderLength":orderLength,
			"workWeight": workWeight
		},
		success:function(obj){
			$("#my-tbody2").html(obj);
		}
	})
})
// 염색의뢰서 저장 버튼
$("#dyeBtn").click(function(){
	var testColorList=document.getElementsByClassName("testColor");
	var testList=document.getElementsByClassName("test");
	var testColor = testColorList[0].value;
	var test = testList[0].value;
	for(var i=1; i<testColorList.length; i++){
		testColor += "&"+testColorList[i].value;
		test += "&"+ testList[i].value;
	}
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/dyeAdd",
		"data":{
			"orderno":$("#orderNo").val(),
			"loss":$("#loss").val(),
			"perkg":$("#perkg").val(),
			"mixed":$("#mixed").val(),
			"method":$("#method").val(),
			"detail":$("#detail").val(),
			"dyeetc":$("#dyeetc").html(),
			"caution":$("#caution").html(),
			"knitcompany":$("#knitcompany").val(),
			"dyecompany":$("#dyecompany").val(),
			"delivery":$("#delivery").val(),
			"testcolor":testColor,
			"test":test
		},
		success:function(){
			var rollTotal = $("#rollTotal").html();
			var perkgTotal = $("#perkgTotal").html();
			$("#roll").val(rollTotal);
			$("#kgttl").val(perkgTotal);
		}
	})
})
// 편직의뢰서 저장 function
function knitAdd1(){
	var thread=[];
	var ratio=[];
	var weight=[];
	var thread_com=[];
	var lot=[];
	var thread1 = document.getElementsByClassName("thread");
	var ratio1 = document.getElementsByClassName("ratio");
	var weight1 = document.getElementsByClassName("knitweight");
	var thread_com1 = document.getElementsByClassName("thread_com");
	var lot1 = document.getElementsByClassName("lot");
	for(var i=0; i<thread1.length; i++){
		thread.push(thread1[i].value);
		ratio.push(ratio1[i].value);
		weight.push(weight1[i].value);
		thread_com.push(thread_com1[i].value);
		lot.push(lot1[i].value);
	}
	var thread1_json = JSON.stringify(thread);
	var ratio1_json = JSON.stringify(ratio);
	var weitht1_json = JSON.stringify(weight)
	var thread_com1_json = JSON.stringify(thread_com);
	var lot1_json = JSON.stringify(lot);
	$.ajax({
		"type":"POST",
		"async":false,
		"url":"/order/knitAdd",
		"data":{
			"orderno":$("#orderNo").val(),
			"thread":thread1_json,
			"ratio":ratio1_json,
			"weight":weight_json,
			"thread_com":thread_com1_json,
			"lot":lot1_json,
			"roll":$("#roll").val(),
			"kgttl":$("#kgttl").val(),
			"knitcompany":$("#knitcompany").val(),
			"delivery":$("#delivery").val(),
			"inch":$("#inch").val(),
			"gage":$("#gage").val(),
			"niddle":$("#niddle").val(),
			"organ":$("#organ").val(),
			"loop":$("#loop").val()
		},
		success:function(){
			
		}
	})
}
// 편직의뢰서 저장버튼
$("#knitBtn").click(function(){
	var ratio = document.getElementsByClassName("ratio");
	var total = 0;
	for(var i=0; i<ratio.length; i++){
		total += parseInt(ratio[i].value);
	}
	knitAdd1();
})
</script>