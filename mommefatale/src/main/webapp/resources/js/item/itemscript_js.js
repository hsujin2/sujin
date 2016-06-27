
function itemWriteCheck(){
	var form = document.itemAddForm;
	if(form.name.value == ""){
		alert("상품명을 입력해 주세요.");
		form.name.focus();
		return;
	}
	
	if(form.price.value == ""){
		alert("상품 원가를 입력해 주세요.");
		form.price.focus();
		return;
	}
	
	if(form.sales.value == ""){
		alert("상품 판매가를 입력해 주세요.");
		form.sales.focus();
		return;
	}

	if(form.stock.value == ""){
		alert("재고를 입력해 주세요.");
		form.stock.focus();
		return;
	}
	
	form.submit();
}
