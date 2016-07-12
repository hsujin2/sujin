<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="resources/js/admin/jquery.paging.min.js"></script>
<script type="text/javascript">
    $(function() {
        callAjax = function(page) {
            var pageSize  = 10;
            var pageBlock = 10;

            $.ajax({
                url: 'mommefatale/member.json',
                type: 'post',
                dataType: 'json',
                async : false,
                success: function(response) {
                    var total = 0;
                    var html = '';
                    var memberlist = response.vo;

                    if(memberlist != null){
                   	 if (memberlist.length > 0) {
                        $.each(response, function(i) {
                            total = response[i].Total;

                            html+= '<li>데이터</li>';
                        });
                        var table = $("<tbody>",{id:'memberList'});
                        for(var i =0; i<memberList.length; i++){
                        	 var tr = $("<tr>");
                             tr.append($("<td>",{text:memberlist[i].name,name:'name'}));
                             tr.append($("<td>",{text:memberlist[i].id,name:'id'}));
                             tr.append($("<td>",{text:memberlist[i].gender,name:'gender'}));
                             tr.append($("<td>",{text:memberlist[i].grade,name:'grade'}));
                             tr.append($("<td>",{text:memberlist[i].point,name:'point'}));
                             tr.append($("<td>",{text:memberlist[i].shape,name:'shape'}));
                             tr.append($("<td>",{text:memberlist[i].join_date,name:'join_date'}));
                             tr.append($("<td>",{text:memberlist[i].last_visit_date,name:'last_visit_date'}));
                             table.append(tr);
                          }
                        $("#memberList").replaceWith(table);
                       // $('.list').empty().append(html);
                        $('.paging').jqueryPager({pageSize: pageSize, pageBlock: pageBlock, currentPage: page, pageTotal: total, clickEvent: 'callAjax'});
                    }
                }
                }
            });
        };

        callAjax(1);
    });
</script>
</head>
<body>


<div class="list" id="memberList"></div>
<div class="paging"></div>

<div class="list" id="memberByeList"></div>
<div class="paging"></div>

</body>
</html>