<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <link href="/resources_css/multiSelect.css" rel="stylesheet" type="text/css">
  </head>
<dl class="dropdown"> 
    <dt>
	    <a href="#">
	      <span class="hida">Select</span>    
	      <p class="multiSel"></p>  
	    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect">
            <ul>
                <li>
                    <input type="checkbox" value="염색견뢰도" />염색견뢰도</li>
                <li>
                    <input type="checkbox" value="축률" />축률</li>
                <li>
                    <input type="checkbox" value="필링" />필링</li>
                <li>
                    <input type="checkbox" value="사행도" />사행도</li>
            </ul>
        </div>
    </dd>
</dl>
<script>
$(".dropdown dt a").on('click', function() {
	  $(".dropdown dd ul").slideToggle('fast');
	});

	$(".dropdown dd ul li a").on('click', function() {
	  $(".dropdown dd ul").hide();
	});

	function getSelectedValue(id) {
	  return $("#" + id).find("dt a span.value").html();
	}

	$(document).bind('click', function(e) {
	  var $clicked = $(e.target);
	  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
	});

	$('.mutliSelect input[type="checkbox"]').on('click', function() {

	  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
	    title = $(this).val() + ",";

	  if ($(this).is(':checked')) {
	    var html = '<span title="' + title + '">' + title + '</span>';
	    $('.multiSel').append(html);
	    $(".hida").hide();
	  } else {
	    $('span[title="' + title + '"]').remove();
	    var ret = $(".hida");
	    $('.dropdown dt a').append(ret);

	  }
	});
</script>