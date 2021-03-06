<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/contents/contents_css.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css" />
	
	<!-- 이미지 슬라이드 -->
	<script type="text/javascript" src="resources/js/contents/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="resources/js/contents/jssor.slider.mini.js"></script>
<script>
        jQuery(document).ready(function ($) {
            
            var jssor_1_SlideshowTransitions = [
              {$Duration:1200,x:0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:-0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:-0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:0.3,$During:{$Top:[0.3,0.7]},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:-0.3,$SlideOut:true,$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:-0.3,$During:{$Top:[0.3,0.7]},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:0.3,$SlideOut:true,$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,$Cols:2,$During:{$Left:[0.3,0.7]},$ChessMode:{$Column:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,$Cols:2,$SlideOut:true,$ChessMode:{$Column:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:0.3,$Rows:2,$During:{$Top:[0.3,0.7]},$ChessMode:{$Row:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:0.3,$Rows:2,$SlideOut:true,$ChessMode:{$Row:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:0.3,$Cols:2,$During:{$Top:[0.3,0.7]},$ChessMode:{$Column:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,y:-0.3,$Cols:2,$SlideOut:true,$ChessMode:{$Column:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,$Rows:2,$During:{$Left:[0.3,0.7]},$ChessMode:{$Row:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:-0.3,$Rows:2,$SlideOut:true,$ChessMode:{$Row:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,y:0.3,$Cols:2,$Rows:2,$During:{$Left:[0.3,0.7],$Top:[0.3,0.7]},$ChessMode:{$Column:3,$Row:12},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,y:0.3,$Cols:2,$Rows:2,$During:{$Left:[0.3,0.7],$Top:[0.3,0.7]},$SlideOut:true,$ChessMode:{$Column:3,$Row:12},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,$Delay:20,$Clip:3,$Assembly:260,$Easing:{$Clip:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,$Delay:20,$Clip:3,$SlideOut:true,$Assembly:260,$Easing:{$Clip:$Jease$.$OutCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,$Delay:20,$Clip:12,$Assembly:260,$Easing:{$Clip:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,$Delay:20,$Clip:12,$SlideOut:true,$Assembly:260,$Easing:{$Clip:$Jease$.$OutCubic,$Opacity:$Jease$.$Linear},$Opacity:2}
            ];
            
            var jssor_1_options = {
              $AutoPlay: true,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Cols: 10,
                $SpacingX: 8,
                $SpacingY: 8,
                $Align: 360
              }
            };
            
            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
            
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 800);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
 </head>
<body>
<div id="wrap">
	<%@ include file="../include/header.jsp"%>
	<div id="wrapcontents">
		<div id="content_banner">
			<h1>${category}</h1>
			<a href="recommended_products.do?category=${category}"><img	src="resources/images/contents/arrow-before-product.png"	alt="before" /></a> 
			<a href="dietary.do?category=${category}"><img src="resources/images/contents/contents-banner.png" id="contentmain" alt="banner" /></a>
			<a href="exercise1.do?category=${category}"><img src="resources/images/contents/arrow-next-exercise.png" alt="next" /></a>
		</div>
	</div>

		<div id="main_content">
			<div id="pageFor">
				<h1>Dietary</h1>
			</div>

			<!-- <div id="dietary">
			<a href="#"> <img src="resources/images/contents/dietary1.png"></a>&nbsp;&nbsp;&nbsp;
			<a href="#"> <img src="resources/images/contents/dietary2.png"></a>
		</div> -->

			<div id="jssor_1"
				style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 800px; height: 456px; overflow: hidden; visibility: hidden; background-color: #24262e;">
				<!-- Loading Screen -->
				<div data-u="loading"
					style="position: absolute; top: 0px; left: 0px;">
					<div
						style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
					<div
						style="position: absolute; display: block; background: url('img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
				</div>
				<div data-u="slides"
					style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height: 356px; overflow: hidden;">
					<div data-p="144.50" style="display: none;">
						<a href="http://ssoqubae.tistory.com/1554" target="_blank"><img data-u="image"
							src="resources/images/contents/apink.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-apink.png"  />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://tenasia.hankyung.com/archives/531321" target="_blank">
						<img data-u="image" src="resources/images/contents/chs.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-chs.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://thedietshop.tistory.com/entry/%EC%95%84%EC%9D%B4%EC%9C%A0%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8-%EC%8B%9D%EB%8B%A8-by%EC%95%88%EC%82%B0%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8-%EB%8D%94%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8%EC%83%B5" target="_blank">
						<img data-u="image" src="resources/images/contents/iu.png" /> </a><img data-u="thumb"
							src="resources/images/contents/thumb-iu.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://www.ezday.co.kr/bbs/view_board.html?q_sq_board=3504082" target="_blank">
						<img data-u="image" src="resources/images/contents/kmk.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-kmk.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="https://www.facebook.com/1011209295572648/videos/1373676582659249" target="_blank">
						<img data-u="image" src="resources/images/contents/ksr.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-ksr.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://blog.daum.net/_blog/BlogTypeView.do?blogid=0dOmq&articleno=8458&categoryId=16&regdt=20160511170006" target="_blank">
						<img data-u="image" src="resources/images/contents/ktw.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-ktw.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://blog.daum.net/_blog/BlogTypeView.do?blogid=0cQJ9&articleno=367"  target="_blank">
						<img data-u="image" src="resources/images/contents/ljj.png"  /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-ljj.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://malhada.tistory.com/254" target="_blank">
						<img data-u="image" src="resources/images/contents/nym.png" /> </a><img data-u="thumb"
							src="resources/images/contents/thumb-nym.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://m.blog.naver.com/spoplanner/220104542531" target="_blank">
						<img data-u="image" src="resources/images/contents/pbr.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-pbr.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://m.blog.naver.com/kiss_candy/220402006906" target="_blank">
						<img data-u="image" src="resources/images/contents/psh.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-psh.png" >
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://starreport.tistory.com/448" target="_blank">
						<img data-u="image" src="resources/images/contents/sj.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-sj.png" />
					</div>
					<div data-p="144.50" style="display: none;">
						<a href="http://m.blog.naver.com/jjini_land/220407998478" target="_blank">
						<img data-u="image" src="resources/images/contents/sy.png" /></a> <img data-u="thumb"
							src="resources/images/contents/thumb-sy.png" />
					</div>

				</div>
				<!-- Thumbnail Navigator -->
				<div data-u="thumbnavigator" class="jssort01"
					style="position: absolute; left: 0px; bottom: 0px; width: 800px; height: 100px;"
					data-autocenter="1">
					<!-- Thumbnail Item Skin Begin -->
					<div data-u="slides" style="cursor: default;">
						<div data-u="prototype" class="p">
							<div class="w">
								<div data-u="thumbnailtemplate" class="t"></div>
							</div>
							<div class="c"></div>
						</div>
					</div>
					<!-- Thumbnail Item Skin End -->
				</div>
				<!-- Arrow Navigator -->
				<span data-u="arrowleft" class="jssora05l"
					style="top: 158px; left: 8px; width: 40px; height: 40px;"></span> <span
					data-u="arrowright" class="jssora05r"
					style="top: 158px; right: 8px; width: 40px; height: 40px;"></span>
			</div>

	<c:if test="${admin eq true}">
			<div class="fix_button">
				<a href="#"><img
					src="resources/images/contents/setting_button.gif" alt="fixbutton" /></a>
			</div>
	</c:if>		
		</div>

		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>