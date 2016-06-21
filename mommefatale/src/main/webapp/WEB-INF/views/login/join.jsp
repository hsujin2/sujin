<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/login/join_css.css">
</head>

<body>
	<div id="wrap">
		<nav></nav>
		<section>
		<div id="joinWrap">
			<div id="joinmain">
				<h1>&bull;회원가입</h1>
				<p>회원가입 하시면 다양한 혜택을 드립니다.</p>
				<div id="joinArea">
					<p>
						<img src="images/login/joinimg.png" alt="">
					</p>
					<form>
						<table>
							<tr>
								<td width="30%"><img src="images/login/required.gif">이름</td>
								<td width="70%"><input type="text" name="username" size="8"
									class="textin" tabindex="1" required></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input type="radio" name="gender" value="male">
									남 <input type="radio" name="gender" value="female"> 여</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="userid" size="8"
									placeholder="아이디" class="textin">&nbsp;&nbsp;<input
									type="button" value="중복확인" onClick="alert('아이디 중복 확인입니다.')"
									required class="jbtn"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="userpass" size="8"
									maxlength="12" class="textin" required> <font size="2">문자와
										숫자를 조합하여 2~12자리로 만들어주세요.</font></td>
							</tr>
							<tr>
								<td>비밀번호확인</td>
								<td><input type="password" name="userpass" size="8"
									maxlength="12" class="textin" required></td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td><input type="text" name="usernick" size="8"
									class="textin" required>&nbsp;&nbsp;<input
									type="button" value="중복확인" onClick="alert('닉네임 중복 확인입니다.')"
									class="jbtn"><br> <font size="2">커뮤니티에서 사용
										될 닉네임을 적어주세요.</font></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><select name="birth1" required>
										<option>1950</option>
										<option>1951</option>
										<option>1952</option>
										<option>1953</option>
										<option>1954</option>
										<option>1955</option>
										<option>1956</option>
										<option>1957</option>
										<option>1958</option>
										<option>1959</option>
										<option>1960</option>
										<option>1961</option>
										<option>1962</option>
										<option>1963</option>
										<option>1964</option>
										<option>1965</option>
										<option>1966</option>
										<option>1967</option>
										<option>1968</option>
										<option>1969</option>
										<option>1970</option>
										<option>1971</option>
										<option>1972</option>
										<option>1973</option>
										<option>1974</option>
										<option>1975</option>
										<option>1976</option>
										<option>1977</option>
										<option>1978</option>
										<option>1979</option>
										<option>1980</option>
										<option>1981</option>
										<option>1982</option>
										<option>1983</option>
										<option>1984</option>
										<option>1985</option>
										<option>1986</option>
										<option>1987</option>
										<option>1988</option>
										<option>1989</option>
										<option>1990</option>
										<option>1991</option>
										<option>1992</option>
										<option>1993</option>
										<option>1994</option>
										<option>1995</option>
										<option>1996</option>
										<option>1997</option>
										<option>1998</option>
										<option>1999</option>
										<option>2000</option>
										<option>2001</option>
										<option>2002</option>
										<option>2003</option>
										<option>2004</option>
										<option>2005</option>
										<option>2006</option>
								</select>&nbsp;<select name="birth2" required>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
								</select>&nbsp;<select name="birth3" required>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
								</select></td>
								<td>&nbsp;<br><font
									size="2">14세미만 가입안내</font></td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td><select name="num1" required>
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
								</select> <input type="text" name="num2" size="3" maxlength="4"
									class="textin">-<input type="text" name="num3" size="3"
									maxlength="4" class="textin"></td>
							</tr>
							<tr>
								<td>SMS수신</td>
								<td><input type="radio" name="sms"> 받습니다. <input
									type="radio" name="sms"> 받지 않습니다.<br> <font
									size="2">동의하실 경우 다양한 이벤트 정보 및 쿠폰을 받아보실 수 있습니다.</font></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="useremail1" size="6"
									class="textin"> @ <select name="usermail2">
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>nate.com</option>
										<option>daum.net</option>
										<option>lycos.co.kr</option>
								</select> <input type="button" value="중복확인"
									onClick="alert('메일 중복 확인입니다.')" class="jbtn"></td>
							</tr>
							<tr>
								<td>메일정보수신</td>
								<td><input type="radio" name="sms"> 받습니다. <input
									type="radio" name="sms"> 받지 않습니다.<br> <font
									size="2">동의하실 경우 다양한 이벤트 정보 및 쿠폰을 받아보실 수 있습니다.</font></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input type="text" name="adr1" size="1" maxlength="4"
									class="textin">-<input type="text" name="adr2" size="1"
									maxlength="4" class="textin">&nbsp;<input type="button"
									value="우편번호찾기" class="jbtn"></td>
							</tr>
							<tr>
								<td>집주소</td>
								<td><input type="text" name="adress" size="30"
									class="textin"></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td><input type="text" name="adress2" size="30"
									class="textin"></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><hr></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><input type="submit"
									name="sub" value="회원가입" class="jbtn">&nbsp;&nbsp;<input
									type="reset" name="cancle" value="취소" class="jbtn"></td>
							</tr>
							<tr>
								<td>키 : <input type="text" name="height"> 몸무게 : <input type="text" name="weight"> BMI : <input type="text" name="bmi"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		</section>

	</div>
</body>
</html>