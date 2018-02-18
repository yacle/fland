<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<h1 align="center"><span id="month">${month}</span>월 입출금 통계표<small><a href="/inquiry/month?month=${month}">[내역표]</a></small></h1>

<div id="columnchart_values" align="center"></div><br/><br/>
<script>
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      
      var x = [
               ["Element", "금액", { role: "style" } ],
               ["수입합계",${incomeTotal}, "#0000FF"],
               ["지출합계",${-expenseTotal}, "#ff0000"],
               ["매출",${item01Sum}, "#0000FF"],
               ["업체환급",${item02Sum}, "#0000FF"],
               ["수입이체",${item03Sum}, "#0000FF"],
               ["금융이자",${item04Sum}, "#0000FF"],
               ["차입금",${item05Sum}, "#0000FF"],
               ["카드취소",${item06Sum}, "#0000FF"],
               ["세금환급",${item07Sum}, "#0000FF"],
               ["거래처결재",${-item08Sum}, "#ff0000"],
               ["지출이체",${-item09Sum}, "#ff0000"],
               ["경비",${-item10Sum}, "#ff0000"],
               ["접대비",${-item11Sum}, "#ff0000"],
               ["대표자경비",${-item12Sum}, "#ff0000"],
               ["대표자차량",${-item13Sum}, "#ff0000"],
               ["원단물류비",${-item14Sum}, "#ff0000"],
               ["기타",${-item15Sum}, "#ff0000"],
               ["식대",${-item16Sum}, "#ff0000"],
               ["한정신차량",${-item17Sum}, "#ff0000"],
               ["박성진차량",${-item18Sum}, "#ff0000"],
               ["박성진경비",${-item19Sum}, "#ff0000"],
               ["박성진식대",${-item20Sum}, "#ff0000"],
               ["임대관리비",${-item21Sum}, "#ff0000"],
               ["급여",${-item22Sum}, "#ff0000"],
               ["차입금상환",${-item23Sum}, "#ff0000"],
               ["대출",${-item24Sum}, "#ff0000"],
               ["세금",${-item25Sum}, "#ff0000"],
               ["4대보험",${-item26Sum}, "#ff0000"]
             ];
      
      var data = google.visualization.arrayToDataTable(x);
 
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
 
      var options = {
        title: $("#month").html(),
        width: 2400,
        height: 1000,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
</script>