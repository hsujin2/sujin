<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록</title>
<script type="text/javascript" src="resources/js/item/itemscript_js.js"></script>
</head>
<body>
<div id="wrapper">
	<form action="insertItem.admin" method="post" enctype="multipart/form-data" name="itemAddForm" id="itemAddForm">
	<fieldset style="margin-left:150px">
		<legend>상품 등록</legend>
		<table>
			<tr>
				<td class="itemInfo">카테고리</td>
				<td><select name="category">
						<option value=1>Equipment - 런닝머신</option>
						<option value=2>Equipment - 웨이트기구</option>
						<option value=3>Equipment - 헬스사이클</option>
						<option value=4>Equipment - 아령</option>
						<option value=5>Equipment - 기타</option>
						<option value=6>SportsWear - 운동복</option>
						<option value=7>SportsWear - 운동화/런닝화</option>
						<option value=8>SportsWear - 스포츠브라</option>
						<option value=9>SportsWear - 기타</option>
						<option value=10>Food - 보충제</option>
						<option value=11>Food - 영양제</option>
						<option value=12>Food - 기타식품</option>
				</select></td>
			</tr>

			<tr>
				<td class="itemInfo">상품명</td>
				<td><input type="text" size="20" maxlength="15" name="name"/></td>
			</tr>
			<tr>
				<td class="itemInfo">브랜드</td>
				<td><input type="text" size="10" maxlength="15" name="brand"/></td>
			</tr>
			<tr>
				<td class="itemInfo">원산지</td>
				<td><input type="text" size="10" maxlength="15" name="origin"/></td>
			</tr>
			<tr>
				<td class="itemInfo">원가</td>
				<td><input type="text" size="10" maxlength="10" name="price"/></td>
			</tr>
			<tr>
				<td class="itemInfo">판매가</td>
				<td><input type="text" size="10" maxlength="10" name="sales"/></td>
			</tr>
			<tr>
				<td class="itemInfo">할인가</td>
				<td><input type="text" size="10" maxlength="10" name="discount"/></td>
			</tr>
			<tr>
				<td class="itemInfo">사이즈</td>
				<td><select name="option_size">
						<option value="">선택</option>
						<option value="XL">XS</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
						<option value="XL">XXL</option>
						<option value="230">230</option>
						<option value="235">235</option>
						<option value="240">240</option>
						<option value="245">245</option>
						<option value="250">250</option>
						<option value="255">255</option>
						<option value="260">260</option>
						<option value="265">265</option>
						<option value="270">270</option>
						<option value="275">275</option>
						<option value="280">280</option>
				</select></td>
			</tr>
			<tr>
				<td class="itemInfo">재고수량</td>
				<td><input type="text" size="3" maxlength="10" name="stock"/></td>
			</tr>
			<tr>
				<td class="itemInfo">색상</td>
				<td><input type="text" size="5" maxlength="10" name="color"/></td>
			</tr>

			<tr>
				<td class="itemInfo">등록사진&nbsp;(메인)</td>
				<td><input type="file"  name="main-img"/></td>
			</tr>

			<tr>
				<td class="itemInfo">등록사진&nbsp;(상세)</td>
				<td><input type="file" name="content-img"/></td>
			</tr>

		</table>

		<div class="buttons">
			<input type="button" value="상품등록" Onclick="itemWriteCheck()" /> <input type="reset" value="취소"
				onclick="location.href='itemlist.admin'" />
		</div>
	</fieldset>
	</form>
</div>
</body>
</html>