<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
	function idCheck(userid) {
		if (userid == "") {
			alert("아이디를 입력해주세요");
			document.regForm.userid.focus();
		} else {
			url = "idCheck.do?userid=" + userid;
			window.open(url, "get", "width=300,height=180", "status=no",
					"toolbar=no");

		}
	}
	function emailCheck(useremail1) {
		var useremail2select = document.getElementById("useremail2")
		var useremail2option = useremail2select.options[useremail2select.selectedIndex].value;
		var useremail =useremail1+"@"+useremail2option
		if (useremail1 == "") {
			alert("메일을 입력해주세요");
			document.regForm.useremail1.focus();
		} else {
			url = "emailCheck.do?useremail="+useremail;
			window.open(url, "get", "width=300,height=180", "status=no",
					"toolbar=no");

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
</head>

<body>
<%@ include file="../include/header.jsp" %>
	<form name="regForm" method="get" action="joincomplete.do"
		name="joinForm">
		<div id="wrap1">
			<nav></nav>
			<section>
			<div id="joinWrap">
				<div id="joinmain">
					<h1>&bull;회원가입</h1>
					<p>회원가입 하시면 다양한 혜택을 드립니다.</p>
					<div id="joinArea">
						<p>
							<img src="resources/images/login/joinimg.png" alt="">
						</p>
						<form>
							<table>
								<tr>
									<td width="30%"><img
										src="resources/images/login/required.gif">이름</td>
									<td width="70%"><input type="text" name="username"
										size="13" class="textin" tabindex="1" required></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">성별</td>
									<td><input type="radio" name="gender" value="남" checked="checked">
										남 <input type="radio" name="gender" value="여"> 여</td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">아이디</td>
									<td><input type="text" name="userid" id="userid" size="13"
										placeholder="아이디" class="textin">&nbsp;<input
										type="button" value="중복확인"
										onclick="idCheck(this.form.userid.value)"></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">비밀번호</td>
									<td><input type="password" name="userpass" size="13"
										maxlength="15" class="textin" required> <font size="2">문자와
											숫자를 조합하여 2~15자리로 만들어주세요.</font></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">비밀번호확인</td>
									<td><input type="password" name="userpasscheck" size="8"
										maxlength="12" class="textin" required></td>
								</tr>

								<tr>
									<td><img src="resources/images/login/required.gif">생년월일</td>
									<td><select name="birth1" required>
											<option value="">선택</option>
											<option value="2016">2016</option>
											<option value="2015">2015</option>
											<option value="2014">2014</option>
											<option value="2013">2013</option>
											<option value="2012">2012</option>
											<option value="2011">2011</option>
											<option value="2010">2010</option>
											<option value="2009">2009</option>
											<option value="2008">2008</option>
											<option value="2007">2007</option>
											<option value="2006">2006</option>
											<option value="2005">2005</option>
											<option value="2004">2004</option>
											<option value="2003">2003</option>
											<option value="2002">2002</option>
											<option value="2001">2001</option>
											<option value="2000">2000</option>
											<option value="1999">1999</option>
											<option value="1998">1998</option>
											<option value="1997">1997</option>
											<option value="1996">1996</option>
											<option value="1995">1995</option>
											<option value="1994">1994</option>
											<option value="1993">1993</option>
											<option value="1992">1992</option>
											<option value="1991">1991</option>
											<option value="1990" selected="selected">1990</option>
											<option value="1989">1989</option>
											<option value="1988">1988</option>
											<option value="1987">1987</option>
											<option value="1986">1986</option>
											<option value="1985">1985</option>
											<option value="1984">1984</option>
											<option value="1983">1983</option>
											<option value="1982">1982</option>
											<option value="1981">1981</option>
											<option value="1980">1980</option>
											<option value="1979">1979</option>
											<option value="1978">1978</option>
											<option value="1977">1977</option>
											<option value="1976">1976</option>
											<option value="1975">1975</option>
											<option value="1974">1974</option>
											<option value="1973">1973</option>
											<option value="1972">1972</option>
											<option value="1971">1971</option>
											<option value="1970">1970</option>
											<option value="1969">1969</option>
											<option value="1968">1968</option>
											<option value="1967">1967</option>
											<option value="1966">1966</option>
											<option value="1965">1965</option>
											<option value="1964">1964</option>
											<option value="1963">1963</option>
											<option value="1962">1962</option>
											<option value="1961">1961</option>
											<option value="1960">1960</option>
											<option value="1959">1959</option>
											<option value="1958">1958</option>
											<option value="1957">1957</option>
											<option value="1956">1956</option>
											<option value="1955">1955</option>
											<option value="1954">1954</option>
											<option value="1953">1953</option>
											<option value="1952">1952</option>
											<option value="1951">1951</option>
											<option value="1950">1950</option>
											<option value="1949">1949</option>
											<option value="1948">1948</option>
											<option value="1947">1947</option>
											<option value="1946">1946</option>
											<option value="1945">1945</option>
											<option value="1944">1944</option>
											<option value="1943">1943</option>
											<option value="1942">1942</option>
											<option value="1941">1941</option>
											<option value="1940">1940</option>
											<option value="1939">1939</option>
											<option value="1938">1938</option>
											<option value="1937">1937</option>
											<option value="1936">1936</option>
											<option value="1935">1935</option>
											<option value="1934">1934</option>
											<option value="1933">1933</option>
											<option value="1932">1932</option>
											<option value="1931">1931</option>
											<option value="1930">1930</option>
									</select>&nbsp;<select name="birth2" required>
											<option value="">선택</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
									</select>&nbsp;<select name="birth3" required>
											<option value="">선택</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
									</select></td>

								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">휴대폰</td>
									<td><select name="num1" required>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select> <input type="text" name="num2" size="3" maxlength="4"
										class="textin" required>-<input type="text"
										name="num3" size="3" maxlength="4" class="textin" required></td>
								</tr>
								<tr>
									<td>SMS수신</td>
									<td><input type="radio" name="sms" checked="checked"> 받습니다. <input
										type="radio" name="sms"> 받지 않습니다.<br> <font
										size="2">동의하실 경우 다양한 이벤트 정보 및 쿠폰을 받아보실 수 있습니다.</font></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif"
										required>이메일</td>
									<td><input type="text" name="useremail1" size="13"
										class="textin"> @ <select name="useremail2" id="useremail2">
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="daum.net">daum.net</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
									</select> <input type="button" value="중복확인"
										onClick="emailCheck(this.form.useremail1.value)" class="jbtn">
										
										</td>
								</tr>
								<tr>
									<td>메일정보수신</td>
									<td><input type="radio" name="msms" checked="checked"> 받습니다. <input
										type="radio" name="msms"> 받지 않습니다.<br> <font
										size="2">동의하실 경우 다양한 이벤트 정보 및 쿠폰을 받아보실 수 있습니다.</font></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif">우편번호</td>
									<td><input type="text" name="zip1" id="zip1" size="1"
										maxlength="4" class="textin">-<input type="text"
										name="zip2" id="zip2" size="1" maxlength="4" class="textin">&nbsp;<input
										type="button" value="우편번호찾기" class="jbtn" onclick="openDaumPostcode()"></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif"
										required>주소</td>
									<td><input type="text" name="addr1" id="addr1" size="70"
										class="textin"></td>
								</tr>
								<tr>
									<td><img src="resources/images/login/required.gif"
										required>상세주소</td>
									<td><input type="text" name="addr2" id="addr2" size="70"
										class="textin"></td>
								</tr>
								<tr>
									<td colspan="3" align="center">키 : <input type="text" name="height" id="height"
										size="2">&nbsp;cm&nbsp;&nbsp;&nbsp;&nbsp;몸무게 : <input type="text" name="weight" id="weight"
										size="2" onkeyup="BMIcal()">&nbsp;kg&nbsp;&nbsp;&nbsp;&nbsp;BMI : <input type="text" name="bmi" id="bmi" size="4" readonly="readonly" ></td>
								</tr>
								<tr>
									<td>체형</td>
									<td><input type="radio" name="shape" value="1">마른<input
										type="radio" name="shape" checked="checked" value="2">표준<input type="radio"
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
										type="checkbox" name="activity_code2" value="2">대중교통이용<input type="checkbox" name="activity_code3" value="3">규칙적운동<input
										type="checkbox" name="activity_code4" value="4">계단이용<input type="checkbox" name="activity_code5" value="5">신체활용업무</td>
								</tr>
								<tr>
									<td colspan="3" align="center"><br> <input
										type="submit" name="sub" id="sub" value="회원가입" class="jbtn">&nbsp;&nbsp;<input
										type="button" name="cancle" value="취소" class="jbtn" onclick="location.href='login.do'"><br>
										<br></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			</section>

		</div>
	</form>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>