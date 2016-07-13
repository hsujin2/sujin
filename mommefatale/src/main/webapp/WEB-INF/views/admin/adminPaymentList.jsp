<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <c:set var="userLogin" value="${sessionScope.login}"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">	
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/admin/adminpaymentlist_css.css" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	jQuery(function($){
		$('#fromDate').on('change',function(){
		 $('#toDate').prop('min',$(this).val());
	});
	
		$('#toDate').on('change',function(){
		 $('#fromDate').prop('min',$(this).val());
	});
	});
	function search(){
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		var search_id = $("#search_id").val();
		var search_no = Number($("#search_no").val());
		
		$.ajax({
			url : "/mommefatale/adminpaymentdatelist.json",
			type : "POST",
			data : {'fromDate' : fromDate, 'toDate' : toDate, 'search_id' : search_id, 'search_no' : search_no},
			async : false,
			
			success : function(response){
				var paylist = response.paymentdatelist;
				if(paylist != null){
					if(paylist.length != 0){
						var paytbody = $("<tbody>",{id:'paymentlist'});
						 for(var i=0; i<paylist.length; i++){
							 var tr = $("<tr>");
							 tr.append($("<td>",{text:paylist[i].order_date}).attr("class","firstline").append($("<br>")).append($("<a>",{text:"주문번호 : "+paylist[i].order_no})));
							 tr.append($("<td>",{text:paylist[i].user_id}).attr("class","firstline"));
							 tr.append($("<td>").attr("class","qqq").append($("<br>")).append("받는사람 : ",paylist[i].receiver,$("<br>"),"우편번호 : ",paylist[i].zip,$("<br>"),"주소 : ",paylist[i].address1,$("<br>"),"상세주소 : ",paylist[i].address2,$("<br>"),$("<br>")));
							 tr.append($("<td>",{text:paylist[i].total_price}).append("원").attr("class","firstline"));
							 tr.append($("<td>",{text:paylist[i].fee}).attr("class","firstline"));
							 tr.append($("<td>",{text:paylist[i].coupon_dis}).attr("class","firstline"));
							 tr.append($("<td>",{text:paylist[i].point}).attr("class","firstline"));
							 tr.append($("<td>",{text:paylist[i].phone}).attr("class","firstline"));
							 tr.append($("<td>").attr("class","firstline").append($('<select name="state" onchange="stateChange(this,'+paylist[i].order_no+')">').append($('<option value="입금대기중">입금대기중</option>')).append($('<option value="결제확인">결제확인</option>')).append($('<option value="배송준비중">배송준비중</option>')).append($('<option value="배송중">배송중</option>')).append($('<option value="배송완료">배송완료</option>'))));
							 tr.append($("<td>").attr("class","firstline").append($("<button>",{text:"수정"}).attr("class","btn btn-primary btn-lg").attr("value",paylist[i].order_no).attr("data-toggle","modal").attr("data-target","#myModal").attr("onclick","modifyOpen(this.value)")));
							 
							 tr.find("td select option[value='"+paylist[i].state+"']").attr('selected',true);
							 
							 paytbody.append(tr);
						 }
						 $("#paymentlist").replaceWith(paytbody);
					}else{
						alert("검색결과 없음");
					}
				}
			},
			error : function(){
				alert("주문조회 오류");
			}
		})
	}
	function modifyOpen(order_no){
		var order_no = order_no;
		
		$.ajax({
			url : "/mommefatale/adminpaymentdetaillist.json",
			type : "POST",
			data : {'order_no' : order_no},
			async : false,
			
			success : function(response){
				var detailList = response.paymentdetaillist;
					if(detailList!=null){
						if(detailList.length!=0){
						var div = $("<div>",{id:'modal-body'}).attr("class","modal-body");
						
						for(var i=0; i<detailList.length;i++){
							var form = $("<form>").attr("class","info").attr("method","post").attr("action","").attr("name","orderListForm");
							var table = $("<table>",{class:'info'});
						
							table.append($("<tr>").append($("<td>",{text:"상품번호",class:"side"})).append($("<td>").append($('<span>',{text:detailList[i].item_no,name:"item_no"}))));
							table.append($("<tr>").append($("<td>",{text:"상품명",class:"side"})).append($("<td>").append($('<span>',{text:detailList[i].item_name,name:"item_name"}))));
							table.append($("<tr>").append($("<td>",{text:"옵션",class:"side"})).append($("<td>").append($('<span>',{text:detailList[i].size,name:"size"}))));
							table.append($("<tr>").append($("<td>",{text:"판매가",class:"side"})).append($("<td>").append($('<span>',{text:detailList[i].sales,name:"sales"}))));
							table.append($("<tr>").append($("<td>",{text:"세일가",class:"side"})).append($("<td>").append($('<span>',{text:detailList[i].discount,name:"discount"}))));
							table.append($("<tr>").append($("<td>",{text:"수량",class:"side"})).append($("<td>").append($('<input>',{type:"text",value:detailList[i].quantity,name:"quantity",size:"5"}))));
							table.append($("<tr>").append($("<td>",{text:"",class:"side"})).append($("<td>").append($('<a name="confirm" onclick="update('+detailList[i].order_no+','+detailList[i].item_no+',this)">저장</a>'))));
							
							form.append(table);
							div.append(form);
						}
						$("#modal-body").replaceWith(div);
					}
				}
			},
			error:function(){
				alert("주문내역조회 오류");
			}
		})
	}
	function update(order_no,item_no,a){
		var quantity = $(a).parent().parent().parent().find("input[name='quantity']").val();
		var discount = $(a).parent().parent().parent().find("span[name='discount']").text();
		$.ajax({
			url : "/mommefatale/adminmodifypaylist.json",
			type : "POST",
			data : {'order_no' : order_no, 'item_no' : item_no, 'quantity' : quantity, 'discount' : discount},
			async : false,
			success : function(response){
				alert("수정되었습니다.");
				modifyOpen(order_no);
			},error:function(){
				alert("주문내역수정 오류");
			}
		})
		
	}
	function refresh(){
		window.location="adminpaymentlist.admin";
	}
	function stateChange(sel,order_no){
		var state = $(sel).val();
		var order_no = order_no;
		window.location="statechange.admin?state="+state+"&order_no="+order_no;
	}
</script>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
	<section class="content">
	<div class="subject">주 문 관 리</div>
	
	<div class="cal">
			<div class="calen">
			<label for="fromDate">주문번호 </label> <input type="text" name="search_no" id="search_no"> <label for="fromDate">아이디</label> <input type="text" name="search_id" id="search_id">
			<label for="fromDate">날짜</label> <input type="date" id="fromDate"
				size="1px" style="height:20px;"> <label for="toDate">~</label> <input
				type="date" id="toDate" style="height:20px;"> <input type="button"
				value="조회" class="but" onclick="search()">
		</div>
	</div>
	<br />
	<br />



	<ul class="war">
		<li>기간검색시 지난 주문내역을 조회하실 수 있습니다.</li>
		<li>상세정보를 클릭하시면 해당 주문에대한 상세내역을 확인하실수 있습니다.</li>
	</ul>
	<div class="list">주문 상품 정보</div>
	<table class="menu">

		<tr id="menu2">
			<td width="100px" class="firstline"><span class="aaaa"><strong>주문일자<br />
						[주문번호]
				</strong></span></td>
			<td width="120px" class="firstline"><span class="aaaa"><strong>아이디</strong></span></td>
			<td width="240px" class="firstline"><span class="aaaa"><strong>배송지</strong></span></td>
			<td width="70px" class="firstline"><span class="aaaa"><strong>총액</strong></span></td>
			<td width="70px" class="firstline"><span class="aaaa"><strong>배송비</strong></span></td>
			<td width="70px" class="firstline"><span class="aaaa"><strong>쿠폰할인</strong></span></td>
			<td width="50px" class="firstline"><span class="aaaa"><strong>총적립금</strong></span></td>
			<td width="100px" class="firstline"><span class="aaaa"><strong>전화번호</strong></span></td>
			<td class="firstline"><span class="aaaa"><strong>주문처리상태</strong></span></td>
			<td width="80px" class="firstline"><span class="aaaa"><strong>주문내역</strong></span></td>
		</tr>
	
	<tbody class="menu" id="paymentlist" name="paymentlist">
		<c:forEach var="vo" items="${paymentlist }">
			<tr>
				<td class="firstline">${vo.order_date }<br />
				<a href="#">주문번호 : ${vo.order_no }</a></td>
				<td class="firstline">${vo.user_id }</td>
				<td class="qqq"><br><br>받는사람 : ${vo.receiver} <br>우편번호 : ${vo.zip }
					<br />주소 : ${vo.address1 }<br>상세주소 : ${vo.address2 }<br><br>
				</td>
				<td class="firstline">${vo.total_price }원</td>
				<td class="firstline">${vo.fee }원</td>
				<td class="firstline">-${vo.coupon_dis }</td>
				<td class="firstline">${vo.point }p</td>
				<td class="firstline">${vo.phone}</td>
				<td class="firstline">
					<select name="state" onchange="stateChange(this,${vo.order_no })">
						<option value="입금대기중"
							<c:if test="${vo.state eq '입금대기중'}">
								 selected="selected"
							</c:if>
						>입금대기중</option>
						<option value="결제확인"
							<c:if test="${vo.state eq '결제확인'}">
								 selected="selected"
							</c:if>
						>결제확인</option>
						<option value="배송준비중"
							<c:if test="${vo.state eq '배송준비중'}">
								 selected="selected"
							</c:if>
						>배송준비중</option>
						<option value="배송중"
							<c:if test="${vo.state eq '배송중'}">
								 selected="selected"
							</c:if>
						>배송중</option>
						<option value="배송완료"
							<c:if test="${vo.state eq '배송완료'}">
								 selected="selected"
							</c:if>
						>배송완료</option>
					</select>
				</td>
				<td class="firstline"><button class="btn btn-primary btn-lg" value=${vo.order_no } data-toggle="modal" data-target="#myModal" onclick="modifyOpen(this.value)">수정</button>
		                    	</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	</section>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">
		<div class="sub">
        	<span class="col">▶</span> 주문내역수정
        </div></h4>
       </div>
       <div class="modal-body" id="modal-body">
	      <form action="" method="post" name="orderListForm" id="orderListForm" class="info">
	      </form>
	   </div>
       <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="refresh()">Close</button>
      </div>
     </div>
    </div>
    </div>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>
