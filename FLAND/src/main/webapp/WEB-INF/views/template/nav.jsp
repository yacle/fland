<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">FABRIC-LAND</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>입력</b>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/income/add">수입</a></li>
          <li><a href="#">지출</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>조회</b>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/income/list">전체</a></li>
          <li><a href="#">월별</a></li>
        </ul>
      </li>
      <li><a href="#"><b>거래처</b></a></li>
      <li><a href="#"><b>계좌관리</b></a></li>
    </ul>
  </div>
</nav>
