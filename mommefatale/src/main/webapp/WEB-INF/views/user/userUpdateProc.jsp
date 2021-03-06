<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="userLogin" value="${sessionScope.login}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/login/join_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
    <script>
        function openDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                    document.getElementById("zip1").value = data.postcode1;
                    document.getElementById("zip2").value = data.postcode2;
                    document.getElementById("addr1").value = data.address;
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    </script>
<script type="text/javascript" src="resources/js/join_js.js"></script>

<script type="text/javascript">
	window.onload=function(){
		//비만부위
		var fat1 = "${userLogin.getFat_part1()}";
		var fat2 = "${userLogin.getFat_part2()}";
		var fat3 = "${userLogin.getFat_part3()}";
		var fat4 = "${userLogin.getFat_part4()}";
		var fat5 = "${userLogin.getFat_part5()}";
		var fat6 = "${userLogin.getFat_part6()}";
		
 		if(fat1=="상복부"){
 		document.regForm.fat_part1.checked=true;
 			}
 		if(fat2=="하복부"){
 			document.regForm.fat_part2.checked=true;
 			}
 		if(fat3=="옆구리"){
 			document.regForm.fat_part3.checked=true;
 			}
 		if(fat4=="허벅지"){
 			document.regForm.fat_part4.checked=true;
 			}
 		if(fat5=="팔뚝살"){
 			document.regForm.fat_part5.checked=true;
 			}
 		if(fat6=="종아리"){
 			document.regForm.fat_part6.checked=true;
 			}
 		
 		//활동량
 		var acv1 = "${userLogin.getActivity_code1()}";
 		var acv2 = "${userLogin.getActivity_code2()}";
 		var acv3 = "${userLogin.getActivity_code3()}";
 		var acv4 = "${userLogin.getActivity_code4()}";
 		var acv5 = "${userLogin.getActivity_code5()}";
 		
 		if(acv1==1){
 			document.regForm.activity_code1.checked=true;
 		}
 		if(acv2==2){
 			document.regForm.activity_code2.checked=true;
 		}
 		if(acv3==3){
 			document.regForm.activity_code3.checked=true;
 		}
 		if(acv4==4){
 			document.regForm.activity_code4.checked=true;
 		}
 		if(acv5==5){
 			document.regForm.activity_code5.checked=true;
 		}
 		
 		//체형
 		var shape = "${userLogin.getShape()}"
 		for(var i=0;i<7;i++){
 		if(shape==(i+1)){
 			document.regForm.shape[i].checked=true;
 			}
 		}
	}
	
	function BMIcal(){
		var height = parseInt(document.getElementById("height").value);
		var weight = parseInt(document.getElementById("weight").value);
		var bmi = weight/((height*0.01)*(height*0.01));
		bmi = Number(bmi.toFixed(1));
		document.getElementById("bmi").value = bmi;
		
	}
</script>

<script type="text/javascript">
	// 비밀번호 길이 체크(6~15자)
	function passCheck(){
		if(document.getElementById('userpass').value.length<6 || document.getElementById('userpass').value.length>15){
		alert("비밀번호를 6~15자 사이로 입력해주세요");
		document.getElementById('userpass').focus();
		document.getElementById('userpass').select();
		}
	}
	// 비밀번호 일치여부 체크
	function passCheckMessage(){
		
		if(document.getElementById('userpass').value!=document.getElementById('userpasscheck').value){
			passcheckmessage.innerHTML = "<font color='red'; size='2pt'>비밀번호가 일치하지 않습니다.</font>";
		}else{
			passcheckmessage.innerHTML = "<font color='blue' size='2pt'>비밀번호가 일치합니다.</font>";
		}
	}	
</script>
</head>

<body>
<%@ include file="../include/header.jsp" %>
	<form name="regForm" id="regForm" method="post" action="userUpdateProc.do"
		name="joinForm">
		<div id="wrap1">
			<nav></nav>
			<section>
			<div id="joinWrap">
				<div id="joinmain">
					<h1>&bull;회원정보수정</h1>
					<p></p>
					<div id="joinArea">
						<p>
							<img src="resources/images/login/joinimg.png" alt="" id="img">
						</p>
							<table>
								<tr>
									<td width="30%">이름</td>
									<td width="70%"><input type="text" name="username"
										size="13" class="textin" tabindex="1" value="${userLogin.getName()}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><input type="text" name="gender" value="${userLogin.getGender()}" readonly="readonly" size="3"></td>
								</tr>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="userid" id="userid" size="13" class="textin" value="${userLogin.getUserid()}" readonly="readonly"></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">비밀번호</td>
									<td><input type="password" name="userpass" id="userpass" size="13"
										maxlength="15" class="textin" onblur="passCheck()" tabindex="1" required> <font size="2">문자와
											숫자를 조합하여 6~15자리로 만들어주세요.</font></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">비밀번호확인</td>
									<td><input type="password" name="userpasscheck" id="userpasscheck" size="13"
										maxlength="12" class="textin" onblur="passCheckMessage()" tabindex="2" required>
										<span id="passcheckmessage"></span></td>
								</tr>

								<tr>
									<td>생년월일</td>
									<td>
									<input type="text" name="birth1" id="birth1" class="textin" value="${fn:substring(userLogin.getBirthday(),0,4)}" size="3" readonly="readonly">&nbsp;년&nbsp;
									<input type="text" name="birth1" id="birth1" class="textin" value="${fn:substring(userLogin.getBirthday(),5,7)}" size="3" readonly="readonly">&nbsp;월&nbsp;
									<input type="text" name="birth1" id="birth1" class="textin" value="${fn:substring(userLogin.getBirthday(),8,10)}" size="3" readonly="readonly">&nbsp;일&nbsp;
									</td>

								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">휴대폰</td>
									<td>
									<c:set var="tel" value="${userLogin.getTel()}"/>
									<input type="text" name="num1" size="3" maxlength="3"
										class="textin" required value="${fn:substring(tel,0,3)}" tabindex="3">-
										<input type="text" name="num2" size="3" maxlength="4"
										class="textin" required value="${fn:substring(tel,3,7)}" tabindex="4">-<input type="text"
										name="num3" size="3" maxlength="4" class="textin" required value="${fn:substring(tel,7,11)}" tabindex="5"></td>
								</tr>
								
								<tr>
									<td><img src="resources/images/login/required.gif"
										required>이메일</td>
									<td>
										<c:set var="email" value="${userLogin.getUseremail()}"/>
										<c:set var="ecut" value="@"/>
										<input type="text" name="useremail1" size="13"class="textin" value=${fn:substringBefore(email,ecut) } tabindex="6"> @ 
										<input type="text" name="useremail2" id="useremail2" value=${fn:substringAfter(email,ecut) } tabindex="7">
										
										</td>
								</tr>
								
								<tr>
									<td><img src="resources/images/login/required.gif">우편번호</td>
									<td><input type="text" name="zip1" id="zip1" size="1"
										maxlength="4" class="textin" value="${fn:substring(userLogin.getZipcode(),0,3)}">-<input type="text"
										name="zip2" id="zip2" size="1" maxlength="4" class="textin"  value="${fn:substring(userLogin.getZipcode(),3,6)}">&nbsp;<input
										type="button" value="우편번호찾기" class="jbtn" onclick="openDaumPostcode()" tabindex="8"></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">주소</td>
									<td><input type="text" name="addr1" id="addr1" size="70"
										class="textin" value="${userLogin.getAddress1() }" required></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif"
										>상세주소</td>
									<td><input type="text" name="addr2" id="addr2" size="70"
										class="textin" value="${userLogin.getAddress2() }"  tabindex="9" required></td>
								</tr>
								<tr>
									<td colspan="3" align="center">키 : <input type="text" name="height" id="height"
										size="2" value="${userLogin.getHeight() }"  tabindex="10">&nbsp;cm&nbsp;&nbsp;&nbsp;&nbsp;몸무게 : <input type="text" name="weight" id="weight"
										size="2" onkeyup="BMIcal()"  value="${userLogin.getWeight() }"  tabindex="11">&nbsp;kg&nbsp;&nbsp;&nbsp;&nbsp;BMI : <input type="text" name="bmi" id="bmi" size="4" readonly="readonly"  value="${userLogin.getBmi() }"></td>
								</tr>
								<tr>
									<td>체형</td>
									<td><input type="radio" name="shape" value="1">마른<input
										type="radio" name="shape" checked="checked" value="2" >표준<input type="radio"
										name="shape" value="3">비만<input type="radio" name="shape" value="4">고도비만<input
										type="radio" name="shape" value="5">마른비만<input
										type="radio" name="shape" value="6">근육질</td>
								</tr>
								<tr>
									<td>비만부위(중복가능)</td>
									<td><input type="checkbox" name="fat_part1" value="상복부">상복부<input
										type="checkbox" name="fat_part2" value="하복부">하복부<input type="checkbox" name="fat_part3" value="옆구리">옆구리<input
										type="checkbox" name="fat_part4" value="허벅지">허벅지<input type="checkbox" name="fat_part5" value="팔뚝살">팔뚝살<input
										type="checkbox" name="fat_part6" value="종아리">종아리</td>
								</tr>
								<tr>
									<td>활동량(중복가능)</td>
									<td><input type="checkbox" name="activity_code1" value="1">산책<input
										type="checkbox" name="activity_code2" id="activity_code2" value="2">대중교통이용<input type="checkbox" name="activity_code3" value="3">규칙적운동<input
										type="checkbox" name="activity_code4" value="4">계단이용<input type="checkbox" name="activity_code5" value="5">신체활용업무
										</td>
								</tr>
								<tr>
									<td colspan="3" align="center"><br> 
									<input type="submit" name="sub" id="sub" value="수정" class="jbtn" tabindex="11">&nbsp;&nbsp;
									<input type="button" name="cancle" value="취소" class="jbtn" onclick="location.href='mypage.do'"><br>
										<br></td>
								</tr>
							</table>
					</div>
				</div>
			</div>
			</section>

		</div>
	</form>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>