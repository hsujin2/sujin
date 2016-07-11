<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<script type="text/javascript" src="jquery.paging.min.js"></script>
<script type="text/javascript">
    $(function() {
        callAjax = function(page) {
            var pageSize  = 10;
            var pageBlock = 10;

            $.ajax({
                url: 'mommefatale/member.json',
                method: 'post',
                dataType: 'json',
                data: {},
                success: function(data) {
                    var total = 0;
                    var html = '';

                    if (data.length > 0) {
                        $.each(data, function(i) {
                            total = data[i].Total;

                            html+= '<li>데이터</li>';
                        });

                        $('.list').empty().append(html);
                        $('.paging').jqueryPager({pageSize: pageSize, pageBlock: pageBlock, currentPage: page, pageTotal: total, clickEvent: 'callAjax'});
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