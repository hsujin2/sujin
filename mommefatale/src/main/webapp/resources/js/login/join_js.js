

function inputCheck(){
	
	var theForm= document.joinForm;
	if(theForm.username.value==""){
		alert("이름을 입력해 주세요.");
		theForm.username.focus();
		return;
	}

	if(theForm.gender[0].checked==false && theForm.gender[1].checked==false){
		alert("성별을 체크해 주세요.");
		return;
	}
	
	if(!theForm.userid.value){
		alert("아이디를 입력하지 않았습니다.");
		theForm.userid.focus();
		return;
	}
	//아이디 유효성 검사(영문소문자, 숫자만 허용)
	for(i=0;i<theForm.userid.value.length;i++){
		ch=theForm.userid.value.charAt(i)
		if(!(ch>='0' && ch<='9')&&!(ch>='a'&&ch<='z')){
			alert("아이디는 소문자, 숫자만 입력가능합니다.");
			theForm.userid.focus();
			theForm.userid.select();
			return;
		}
	}
	//아이디 길이 체크(6~12자)
	if(theForm.userid.value.length<6 || theForm.userid.value.length>12){
		alert("아이디를 6~12자 사이로 입력해주세요");
		theForm.userid.focus();
		theForm.userid.select();
		return;
	}
	if(!theForm.userpass.value){
		alert("비밀번호를 입력해 주세요.");
		theForm.userpass.focus();
		return;
	}
	if(!theForm.userpasscheck.value){
		alert("비밀번호를 확인해 주세요.");
		theForm.userpasscheck.focus();
		return;
	}
	if(theForm.userpass.value!=theForm.userpasscheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		theForm.userpasscheck.focus();
		theForm.userpasscheck.value="";
		return;
	}
	if(!theForm.num1.value){
		alert("통신사를 정해 주세요.");
		theForm.num1.focus();
		return;
	}
	if(!theForm.num2.value){
		alert("전화번호 앞자리를 입력해 주세요.");
		theForm.num2.focus();
		return;
	}
	if(!theForm.num3.value){
		alert("전화번호 뒷자리를 입력해 주세요.");
		theForm.num3.focus();
		return;
	}
	if(!theForm.useremail1.value){
		alert("이메일을 입력해 주세요.");
		theForm.useremail1.focus();
		return;
	}
	
	if(!theForm.zipcode.value){
		alert("우편번호를 입력해 주세요.");
		theForm.zipcode.focus();
		return;
	}
	if(!theForm.mb_address1.value){
		alert("주소를 입력해 주세요.");
		theForm.address1.focus();
		return;
	}
	if(!theForm.mb_address2.value){
		alert("세부주소를 입력해 주세요.");
		theForm.address2.focus();
		return;
	}
	
	theForm.submit();
}