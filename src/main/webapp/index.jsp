<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>医者天下</title>
    <!--[if IE]>
		<script src="js/html5.js"></script>
	<![endif]-->

    <base target="_self">
    <link rel="stylesheet" href="css/index.css" />
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
    	
    	function login(){
    		var n = $('#username').val();
    		var p = $('#pwd').val();
    		if(n==''){
    			alert('请输入用户名');
    		}
    		else if(p==''){
    			alert('请输入密码');
    		}
    		else{
    			$('#login_frm').submit();
    		}
    	}
    	
    	$(function(){
    	
    		$('#querySearch').click(function(){
    			$('#med_form').submit();
    		});
    		
    	});
    </script>
    
</head>
<body>
    <header id="fastTop" class="header">
        <div class="search_box">
            <span class="logo">
                <a href="homeLoading.service">
                    <img src="images/logo.jpg"></a>
            </span>
           
            <div class="keyword">
                <form method="post" id="med_form" action="getHosByName.service" onKeyDown="if(event.keyCode==13)return false;">
                    <input type="text" name="hname" autocomplete="off" placeholder="请输入医院名称" 
                    	id="search-tips-input" value="">
                    <button type="button" class="btn-doctor" id="querySearch">搜&nbsp;索</button>
                </form>
                <div class="search-suggest-layer" style="display: none; border: 1px #eaeaea solid; margin-top: -2px; width: 466px; background-color: #fff; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; position: absolute; z-index: 1;"></div>
            </div>
            <div class="login">
                <div class="my-doctor">
                	<c:if test="${empty loginuser }">
                		<div style="float: left;color:#2896f3;">
                		<form id="login_frm" action="login.service" method="post">
                			<div>用户名：<input type="text" name="username" id="username" style="border: 1px solid #2896f3;"/></div>
                			<div style="margin-top:2px">密码：<input type="password" name="pwd" id="pwd" style="border: 1px solid #2896f3;"/></div>
                		</form>
                		</div>
                		<div style="float: right;line-height:42px;margin-left:15px">
                			<div><input type="button" value="登&nbsp;录" onClick="login()" 
                				style="width:60px;height:40px;cursor:pointer;border: 1px solid #2896f3;color:#2896f3;"></input>
                			</div>
                		</div>
                	</c:if>
                   <c:if test="${not empty loginuser}">
                   	<h3>你好,${loginuser.username }<i class="my-space"></i></h3><br>
                   	欢迎您登录
                   	<span class="fa fa-chevron-down logout">
                   		<div class="user lg-out" style="z-index: 1000;">
                   			<dt><i class="fa fa-chevron-down"></i></dt>
                   			<ul>
                   				<a href="logout.service">
                   					<li class="logout-li" style="padding-left: 20px;">退出登录</li>
                   				</a>
                   			</ul>
                   		</div>
                   	</span>
                   </c:if>
                </div>
            </div>
        </div>
    </header>
    <div class="banner">
        <div class="banner-content">
            <ul class="banner-left">
                <a href="#">
                    <li class="active">首页</li>
                </a><a href="getHosByGrade.service">
                    <li>找医院</li>
                </a><a href="getMedicinersByWhat.service">
                    <li>找医生</li>
                </a>
            </ul>
        </div>
    </div>
    <div class="opacity"></div>
    <div class="carousel-infos">
        <div id="slideBox" class="slideBox">
            <div class="hd car-item">
				<ul><li class=""></li><li class=""></li><li class="on"></li></ul>
			</div>
            <div class="bd">
				<ul>
					<li style="display: none;"><a href="#" target="_blank"><img src="images/banner1.jpg"></a></li>
					<li style="display: none;"><a href="#" target="_blank"><img src="images/banner2.jpg"></a></li>
					<li style="display: list-item;"><a href="#" target="_blank"><img src="images/banner3.jpg"></a></li>
				</ul>
			</div>
        </div>

        <div class="wrap">
            <div class="container">

                <!-- 推荐医院-->
                <div class="find-hospital">
                    <h3>
                        <ul class="tab">
                            <li class="first-tab">医院推荐</li>

                        </ul>
                        <a id="hos-more" href="getHosByGrade.service" target="_blank"><span class="more-hos">查看全部<img src="images/arrow_normal.png"></span></a></h3>
                    <div class="content" id="cityTab">
                        <ul>
                        	<c:forEach items="${hospitals }" var="hos" begin="0" end="2">
                            <li class="hospital-detail"><a href="getMedicinerByHospital.service?hname=${hos.hname }" target="_blank">
                                <img src="images/d31b0ef41bd5ad6ee0d4c29787cb39dbb6fd3c99.jpg" alt="${hos.hname }" width="230" height="120"></a><p class="hospital-name"><a href="getMedicinerByHospital.service?hname=${hos.hname }" title="${hos.hname }" target="_blank"><span class="span-name">${hos.hname }</span></a><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><span class="grade-text ">9.8</span><label class="hospital-grade"><span class="grade">${hos.grade }</span><span class="corpt">医保</span></label></p>
                                <p class="appointent_total">
                                    <label class="label-right"><span>${hos.acount }</span>&nbsp;人成功预约</label>
                                </p>
                            </li>
                        	</c:forEach>	    
                        </ul>
                        <ul class="hospital-info">
                        	<c:forEach items="${hospitals }" var="hos" begin="3">
                            	<li><a href="getMedicinerByHospital.service?hname=${hos.hname }" title="${hos.hname }" target="_blank"><span class="span-hospital ">${hos.hname }</span></a><label><span class="span-grade">${hos.grade }</span><span class="span-corpt">[医保]</span></label></li>
                      		</c:forEach>
                    	</ul>
                    </div>
                </div>
                <!-- END推荐医院-->

                <!-- 热门科室-->
                <div class="hot-department">
                    <h3>热门科室</h3>
                    <div class="content">
                        <ul>
                        	<c:forEach items="${pDepts }" var="pDept">
                            <li class="first-info">
                                <div class="dep-left"><a target="_self" class="dep-title" href="getMedicinersByDept.service?dname=${pDept.dname }"><b>${pDept.dname }</b></a></div>
                                <div class="dep-right">
                                	<c:forEach items="${pDept.depts }" var="dept">
                                	<a class="dep-item dep-light" href="getMedicinersByDept.service?dname=${dept.dname }" target="_self" title="${dept.dname }">${dept.dname }</a>
                                	</c:forEach>
                            	</div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- END热门科室-->

                <!-- 优质医生-->
                <div id="excel-doctor-div" class="excel-doctor">
                    <h3>名师名医<a href="getMedicinersByWhat.service" target="_blank"><span>更多名医<img src="images/arrow_normal.png"></span></a></h3>
                    <div class="content slideBox2">
                        <div id="pre-arrow" class="pre-arrow prev">
                            <img data-gray="images/pre_disable.png" data-srchover="images/pre_hover.png" data-src="images/pre_normal.png" src="images/pre_disable.png">
                        </div>
                        <div class="doctail-detail bd">
                            <ul id="dictor-list-ul">
                            	<c:forEach items="${mediciners }" var="mediciner">                               
                                <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                                	<a href="appointtime.service?mid=${mediciner.mid }" target="_blank">
                                    		<c:choose>
                                        		<c:when test="${fn:contains(mediciner.gender,'男')}">
                                        			<img src="<%=basePath %>images/yisheng1.png">
                                        		</c:when>
                                        		<c:when test="${fn:contains(mediciner.gender,'女')}">
                                        			<img src="<%=basePath %>images/yisheng2.png">
                                        		</c:when>
                                        		<c:otherwise>
                                        			<img src="<%=basePath %>images/yisheng1.png">
                                        		</c:otherwise>
                                        	</c:choose>
                                    </a>
                                    <p><a target="_blank" href="#"><span>${mediciner.mname }</span></a>&nbsp;<span class="doctor-level">${mediciner.title }</span></p>
                                    <p>${mediciner.dept }</p>
                                    <p title="${mediciner.hospital }">${mediciner.hospital }</p>
                                    <p class="btn-appoint"><a target="_blank" href="appointtime.service?mid=${mediciner.mid }"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div id="next-arrow" class="next-arrow next">
                            <img data-gray="images/arrow_disable.png" data-srchover="images/arrow_hover.png" data-src="images/arrow_normal.png" src="images/arrow_disable.png">
                        </div>
                    </div>
                </div>
                <!-- END优质医生-->


                

            </div>
            <div class="right-sidebar-info">
                <!-- 右侧统计信息 -->
                <div class="res-info">
                    <div class="city-info">
                        <h3 class="res-title">全国已开通</h3>
                     <i class="num">${count }</i>家医院
                    </div>
                    <div class="num-info">
                        <h3 class="res-title">可预约医生数</h3>
                        <!-- 循环可预约医生数量 -->
                        
                        	<div class="img-container">
                        		 <img src="images/number_bg.png" class="number-bg "><i class="num">${count1 }</i>
                        	</div>
                        
                    </div>
                    <div class="num-info">
                        <h3 class="res-title">累计服务人数</h3>
                        <!-- 累计服务人数 -->
                       
                        	<div class="img-container">
                           		<img src="images/number_bg.png" class="number-bg "><i class="num">${count2 }</i>
                        	</div>
                        
                    </div>
                </div>
                <!-- END右侧统计信息 -->

                <!-- 合作机构 -->
                <div class="news">
                    <h3 class="news-title">合作机构</h3>
                    <ul class="news-list">
                        <li>
                            <a href="#" target="_blank">
                            	武汉协和医院
                            </a>
                           
                        </li>
                       <li>
                            <a href="#" target="_blank">	
								武汉市第四医院
                            </a>
                        </li>
                         <li>
                            <a href="#" target="_blank">            
								武汉市第九医院
                            </a>
                        </li>
                         <li>
                            <a href="#" target="_blank">
								武汉市第六医院
                            </a>
                        </li>
                         <li>
                            <a href="#" target="_blank">
								武汉市商业职工医院
                            </a>
                        </li>
                    </ul>
                </div>
               <!-- END合作机构 -->
            </div>
        </div>
    </div>

    <footer id="footer-three" class="footer-box footer-three clear path" data-src="http://dpp.bdimg.com/static/pc/201604261639/asset" data-href="" data-api="http://yi.baidu.com" data-passport="https://passport.baidu.com">
        <div class="footer-con">
            <div class="footer-info-url">
                <dd class="fo-link">
                    <a href="#" target="_blank"><span>帮助</span>|</a>
                    <a href="#" target="_blank"><span>用户协议</span>|</a>
                    <a href="#" target="_blank"><span>意见反馈</span></a>
                    <a href="#" target="_blank"><span>©2016 Mstanford &nbsp;&nbsp;隐私条款</span></a>
                </dd>
            </div>
        </div>
    </footer>



    <script src="js/jquery-1.11.2.min.js"></script>

    <script src="js/uni_login_wrapper.js"></script>

       <script src="js/jquery.SuperSlide.2.1.1.js"></script>

    <script type="text/javascript">
        jQuery(".slideBox").slide({ mainCell: ".bd ul", autoPlay: true});

        jQuery(".slideBox2").slide({ mainCell: ".bd ul", vis: 4, scroll: 4, effect: "left", autoPlay: false ,pnLoop:false});

    
    </script>
</body>
</html>
