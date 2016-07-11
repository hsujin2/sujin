// JavaScript Document
function addBookmark() {
    var title = document.title; //현재 보고 있는 페이지의 Title
    var url = location.href; //현재 보고 있는 페이지의 Url
    if (window.sidebar && window.sidebar.addPanel) { //firefox
        window.sidebar.addPanel(title, url, "");
    } else if (window.opera && window.print) { //opera
        var elem = document.createElement('a');
        elem.setAttribute('href', url);
        elem.setAttribute('title', title);
        elem.setAttribute('rel', 'sidebar');
        elem.click();
    } else if (document.all) { //msie
        window.external.AddFavorite(url, title);
    } else {
        alert("해당브라우저는 즐겨찾기 추가기능이 지원되지 않습니다.\n\n'Ctrl+D'를 눌러 수동으로 즐겨찾기에 추가해주세요.");
        return true;
    }
}
