<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css" />
<link rel="stylesheet" type="text/css" href="resources/css/admin/member_css.css" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<!-- amCharts javascript sources -->
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/pie.js"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/light.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">	
<script type="text/javascript">
window.onload=function(){
	var man;
	var woman; 
	
	$.ajax({
		url : "/mommefatale/genderStatus.json",
		type : "POST",
		async : false,
		success : function(response){
			var map = response.map;
			man = map.man;
			woman = map.woman;
		},error : function(){
			alert("성별 통계 오류");
		}
	})
	AmCharts.makeChart("chartdiv",
		{
			"type": "pie",
			"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
			"innerRadius": "40%",
			"colors": [
				"#68C5F7",
				"#FD9FF5"
			],
			"titleField": "category",
			"valueField": "column-1",
			"theme": "light",
			"allLabels": [],
			"balloon": {},
			"legend": {
				"enabled": true,
				"align": "center",
				"markerType": "circle"
			},
			"titles": [],
			"dataProvider": [
				{
					"category": "남자",
					"column-1": man
				},
				{
					"category": "여자",
					"column-1": woman
				}
			]
		}
	);
}
  function searchMemberByCategory() {
		var memberlist = $("#memberList");
		var id = $("input[name='category_id']").val();
		var name = $("input[name='category_name']").val();
		var gender = $("select[name='category_gender']").val();
		var grade = $("select[name='category_grade']").val();
		var join_date = $("input[name='category_join_date']").val();
		var last_visit_date = $("input[name='category_last_visit_date']").val();
		
      $.ajax({
          url: "/mommefatale/member.json",
          type: "post",
          dataType: "json",
          data : {	'id' : id,
        	  			'name' : name,
        	  			'gender' : gender,
        	  			'grade' : grade, 
        	  			'join_date' : join_date,
        	  			'last_visit_date' : last_visit_date
        	  			},
          async : false,
          success: function(response) {
              var memberlist = response.vo;
              if(memberlist != null){
             	 if (memberlist.length != 0) {
                  var table = $("<tbody>",{id:'memberList'});
                  for(var i =0; i<memberlist.length; i++){
                	  var tr = $("<tr>");
                       tr.append($("<td>").append($('<a href="#" onclick="updateMember('+memberlist[i].id+')" data-toggle="modal" data-target="#myModal" name="id">'+memberlist[i].id+'</a>')));
                     //  tr.append($("<td>",{text:memberlist[i].id,name:'id'}));
                       tr.append($("<td>",{text:memberlist[i].name,name:'name'}));
                       tr.append($("<td>",{text:memberlist[i].gender,name:'gender'}));
                       tr.append($("<td>",{text:memberlist[i].grade,name:'grade'}));
                       tr.append($("<td>",{text:memberlist[i].point,name:'point'}));
 					   tr.append($("<td>",{text:memberlist[i].join_date,name:'join_date'}));
                       tr.append($("<td>",{text:memberlist[i].last_visit_date,name:'last_visit_date'}));
                       table.append(tr);
                    }
                  $("#memberList").replaceWith(table);
              } else{
            	  alert("검색조건과 일치하는 회원이 없습니다.");
              }
          }
         },
          error : function(request, status, error){
              if(request.status != '0'){
                 alert("code : "+request.status +"\r\nmessage : "
                             + request.reponseText + "\r\nerror : " + error);
              }
           }
      })
}
  
function updateMember(member_id){
	var id = member_id;
	//alert(id);
	 $.ajax({
		url : "/mommefatale/updateMember.json",
		type : "POST",
		data : {'id' : id},
		async : false,
		success : function(response){
			var memberInfo = response.memberInfo;
			$('#member_id').val(memberInfo.id);
			$('#member_name').val(memberInfo.name);
			$('#member_gender').val(memberInfo.gender);
			$('#member_email').val(memberInfo.email);
			$('#member_zip').val(memberInfo.zip);
			$('#member_address1').val(memberInfo.address1);
			$('#member_address2').val(memberInfo.address2);
			$('#member_phone').val(memberInfo.phone);
			$('#member_birthday').val(memberInfo.birthday);
			$("select[name=member_grade] option[value="+memberInfo.grade+"]").attr("selected",true);
			$('#member_height').val(memberInfo.height);
			$('#member_weight').val(memberInfo.weight);
			$('#member_bmi').val(memberInfo.bmi);
			$('#member_shape').val(memberInfo.shape);
			$('#member_kcal').val(memberInfo.kcal);
			$('#member_coupon').val(memberInfo.coupon);
			$('#member_point').val(memberInfo.point);
			$('#member_join_date').val(memberInfo.join_date);
			$('#member_visit_count').val(memberInfo.visit_count);
			$('#member_last_visit_date').val(memberInfo.last_visit_date);
			$("select[name=member_state] option[value="+memberInfo.state+"]").attr("selected",true);
		},
		error : function(request, status, error){
			alert("code : "+request.status +"\r\nmessage : "
                    + request.reponseText + "\r\nerror : " + error);
		}
	}) 
}  

function memberSave(){
	var form = document.memberUpdateForm;
	
	if(form.member_grade.value == ""){
		alert("회원의 등급을 선택해주세요");
		return;
	}
	document.memberUpdateForm.submit();
}

</script>
</head>
<body>
 <div id="wrap">
      <%@ include file="../include/header.jsp"%>
      <div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
<div class="member_table">
<label for="category_id">아이디: </label><input type="text" name="category_id" id="category_id">
<label for="category_name">이름: </label><input type="text" name="category_name" id="category_name">
<label for="category_gender">성별: </label><select name="category_gender" id="category_gender">
	<!-- <optgroup label="성별"></optgroup> -->
	<option value="">전체</option>
	<option value="남">남자</option>
	<option value="여">여자</option>
</select>
<label for="category_grade">등급: </label><select name="category_grade" id="category_grade">
	<!-- <optgroup label="등급"></optgroup> -->
	<option value="">전체</option>
	<option value="bronze">bronze</option>
	<option value="silver">silver</option>
	<option value="gold">gold</option>
	<option value="diamond">diamond</option>
</select>
<br>
<label for="category_join_date">가입일자: </label><input type="date" name="category_join_date" id="category_join_date">
<label for="category_last_visit_date">최근방문일: </label><input type="date" name="category_last_visit_date" id="category_last_visit_date">
<input type="button" value="조회" onclick="searchMemberByCategory()">


<h2 class="title">회원 목록</h2>
<span>회원수 : ${page_count}</span>
 <table summary="member_list" id="member_list">
            <colgroup>
               <col width="15%">
               <col width="10%">
               <col width="10%">
               <col width="12%">
               <col width="15%">
               <col width="19%">
               <col width="19%">
            </colgroup>
            <thead>
               <tr>
                  <th scope="col">아이디</th>
                  <th scope="col">이름</th>
                  <th scope="col">성별</th>
                  <th scope="col">등급</th>
                  <th scope="col">포인트</th>
                  <th scope="col">가입일자</th>
                  <th scope="col">최근방문일</th>
               </tr>
            </thead>
			<tbody class="list" id="memberList">
				<c:if test="${count == 0}">
                	<tr>
                		<td>가입한 회원이 없습니다.</td>
                	</tr>
                </c:if>
                <c:if test="${count != 0}">
	                <c:forEach var="member" items="${memberList}">
		                <tr>
							<td><a href="#" onclick="updateMember('${member.id}')" data-toggle="modal" data-target="#myModal">${member.id}</a></td>
		                    <td>${member.name}</td>
							<td>${member.gender}</td>
							<td>${member.grade}</td>
							<td align="right"><fmt:formatNumber value="${member.point}" pattern="#,###.##P"/></td>
							<td>${member.join_date}</td>
							<td>${member.last_visit_date}</td>
						</tr>
					</c:forEach>
				</c:if>	
			</tbody>
</table>
			<div class="footList">
				<c:if test="${paging.isPre()}">
					<a href="member.admin?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
				<c:forEach var="counter" begin="${paging.getPage_Start()}"
					end="${paging.getPage_End()}">
					<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
					<c:if test="${paging.getCur_Page() ne counter}">
						<a href="javascript:window.location='member.admin?pageNum=${counter}'">[${counter}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.isNext()}">
					<a href="member.admin?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
				</c:if>
			</div>

			<h2 class="title">탈퇴 회원</h2>
<table summary="memberBye_list" id="memberBye_list">
            <colgroup>
               <col width="15%">
               <col width="10%">
               <col width="10%">
               <col width="12%">
               <col width="15%">
               <col width="19%">
               <col width="19%">
            </colgroup>
            <thead>
               <tr>
                  <th scope="col">아이디</th>
                  <th scope="col">이름</th>
                  <th scope="col">성별</th>
                  <th scope="col">등급</th>
                  <th scope="col">포인트</th>
                  <th scope="col">가입일자</th>
                  <th scope="col">탈퇴일자</th>
               </tr>
            </thead>
<tbody class="list" id="memberByeList">
		<c:if test="${count == 0}">
                	<tr>
                		<td>탈퇴한 회원이 없습니다.</td>
                	</tr>
                </c:if>
                <c:if test="${count != 0}">
	                <c:forEach var="member" items="${memberByeList}">
		                <tr>
							<td><a href="#" onclick="updateMember('${member.id}')" data-toggle="modal" data-target="#myModal">${member.id}</a></td>
		                    <td>${member.name}</td>
							<td>${member.gender}</td>
							<td>${member.grade}</td>
							<td align="right"><fmt:formatNumber value="${member.point}" pattern="#,###P"/></td>
							<td>${member.join_date}</td>
							<td>${member.last_visit_date}</td>
						</tr>
					</c:forEach>
				</c:if>	
</tbody>
</table>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"><div class="sub">
        	<span class="col">▶</span> 회원정보 수정
        </div></h4>
	      </div>
	      <div class="modal-body">
	      <form action="memberUpdate.admin" method="post" name="memberUpdateForm" id="memberUpdateForm" class="info">
			<table id="modifytable">
			<tr>
				<td class="itemInfo">아이디</td>
				<td><input type="text" id="member_id" name="member_id" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">이&nbsp;&nbsp;름</td>
				<td><input type="text" name="member_name" id="member_name"  readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">성&nbsp;&nbsp;별</td>
				<td><input type="text" name="member_gender" id="member_gender"  readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">이메일</td>
				<td><input type="text" name="member_email" id="member_email"  readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">우편번호</td>
				<td><input type="text" name="member_zip" id="member_zip"  readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">주&nbsp;&nbsp;소</td>
				<td><input type="text" name="member_address1" id="member_address1"  readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">상세주소</td>
				<td><input type="text" name="member_address2" id="member_address2"  readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">휴대폰</td>
				<td ><input type="text" name="member_phone" id="member_phone" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">생&nbsp;&nbsp;일</td>
				<td><input type="text" name="member_birthday" id="member_birthday" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo">등&nbsp;&nbsp;급</td>
				<td><select name="member_grade" id="member_grade">
						<option value="">선택</option>
						<option value="bronze">bronze</option>
						<option value="silver">silver</option>
						<option value="gold">gold</option>
						<option value="diamond">diamond</option>
				</select></td>
			</tr>
			<tr>
				<td class="itemInfo">키</td>
				<td><input type="text"  name="member_height" id="member_height" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">몸무게</td>
				<td><input type="text" name="member_weight" id="member_weight" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">BMI지수</td>
				<td><input type="text" name="member_bmi" id="member_bmi" readonly="readonly"/></td>
				
			</tr>
			<tr>
				<td class="itemInfo">체&nbsp;&nbsp;형</td>
				<td><input type="text" name="member_shape" id="member_shape" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">권장칼로리</td>
				<td><input type="text" name="member_kcal" id="member_kcal" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">쿠&nbsp;&nbsp;폰</td>
				<td><input type="text" name="member_coupon" id="member_coupon" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">포인트</td>
				<td><input type="text" name="member_point" id="member_point"/></td>
			</tr>
			<tr>
				<td class="itemInfo">가입일자</td>
				<td><input type="text" name="member_join_date" id="member_join_date" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">방문수</td>
				<td><input type="text" name="member_visit_count" id="member_visit_count" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">최근방문일</td>
				<td><input type="text" name="member_last_visit_date" id="member_last_visit_date" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="itemInfo">상&nbsp;&nbsp;태</td>
				<td><select name="member_state" id="member_state">
						<option value="">선택</option>
						<option value="1">회원</option>
						<option value="0">회원정지/탈퇴</option>
				</select></td>
			</tr>
						
		</table>
		</form>
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		<button type="button" class="btn btn-primary" onclick="memberSave()">수정</button>
	      </div>
	    </div>
	  </div>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->	  
</div>
<%@ include file="../include/footer.jsp"%>
 </div>
</body>
</html>