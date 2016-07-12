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
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
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
                	  // join_date   json=>string --------------------------------
                	  var joinDate = memberlist[i].last_visit_date;
                	  var year = joinDate.year + 1900;
                      var month = joinDate.month + 1;
                      if(month <10){
                    	  month = '0'+month;
                      }
                      var date = joinDate.date;
                      if(date <10){
                    	  date = '0'+date;
                      }
                      var stringJoinDate = year + "-" + month +"-" + date;
                	  //-------------------------------------------------------------   
         
                     // last_visit_date   json=>string -----------------------------
                	  var lastDate = memberlist[i].last_visit_date;
                	  var year2 = lastDate.year + 1900;
                      var month2 = lastDate.month + 1;
                      if(month2 <10){
                    	  month2 = '0'+month2;
                      }
                      var date2 = lastDate.date;
                      if(date2 <10){
                    	  date2 = '0'+date2;
                      }
                      var stringLastDate = year2 + "-" + month2 +"-" + date2;
                	  //------------------------------------------------------------- 
                	  var tr = $("<tr>");
                       tr.append($("<td>").append($('<input type="checkbox">')));
                       tr.append($("<td>",{text:memberlist[i].id,name:'id'}));
                       tr.append($("<td>",{text:memberlist[i].name,name:'name'}));
                       tr.append($("<td>",{text:memberlist[i].gender,name:'gender'}));
                       tr.append($("<td>",{text:memberlist[i].grade,name:'grade'}));
                       tr.append($("<td>",{text:memberlist[i].point,name:'point'}));
 					   tr.append($("<td>",{text:stringJoinDate,name:'join_date'}));
                       tr.append($("<td>",{text:stringLastDate,name:'last_visit_date'}));
                       table.append(tr);
                    }
                  $("#memberList").replaceWith(table);
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
</script>
</head>
<body>
 <div id="wrap">
      <%@ include file="../include/header.jsp"%>
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
<label for="category_last_visit_date">최종방문일: </label><input type="date" name="category_last_visit_date" id="category_last_visit_date">
<input type="button" value="검색" onclick="searchMemberByCategory()">


<h2 class="title">회원 목록</h2>
<span>회원수 : ${page_count}</span>
 <table summary="member_list" id="member_list">
            <colgroup>
               <col width="2%">
               <col width="18%">
               <col width="10%">
               <col width="10%">
               <col width="12%">
               <col width="12%">
               <col width="18%">
               <col width="18%">
            </colgroup>
            <thead>
               <tr>
               	  <th></th>
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
		                	<td><input type="checkbox"/></td>
							<td><a href="#">${member.id}</a></td>
		                    <td>${member.name}</td>
							<td>${member.gender}</td>
							<td>${member.grade}</td>
							<td align="right"><fmt:formatNumber value="${member.point}" pattern="#,###.##"/></td>
							<td><fmt:formatDate value="${member.join_date}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${member.last_visit_date}" pattern="yyyy-MM-dd"/></td>
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
				<col width="2%">
               <col width="18%">
               <col width="10%">
               <col width="10%">
               <col width="12%">
               <col width="12%">
               <col width="18%">
               <col width="18%">
            </colgroup>
            <thead>
               <tr>
               	  <th></th>
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
		                    <td><input type="checkbox"/></td>
							<td><a href="#">${member.id}</a></td>
		                    <td>${member.name}</td>
							<td>${member.gender}</td>
							<td>${member.grade}</td>
							<td align="right"><fmt:formatNumber value="${member.point}" pattern="#,###.##"/></td>
							<td><fmt:formatDate value="${member.join_date}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${member.last_visit_date}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</c:if>	
</tbody>
</table>
</div>
<%@ include file="../include/footer.jsp"%>
   </div>
</body>
</html>