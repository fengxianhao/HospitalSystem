<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<base href="<%=basePath%>">

		<title>医者天下hospital_list.jsp</title>

		<!--[if IE]>
	<script src="js/html5.js"></script>
	<![endif]-->

		<base target="_self">
		<link rel="stylesheet" href="css/hospital.css" />

		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>


		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		$(function() {
		$('#querySearch').click(function() {
			$('#med_form').submit();
		});
	});
	
	</script>

	</head>

	<body>
		<header class="header">
		<header id="fastTop" class="header" style="height: 100px;">
		<div class="search_box">
			<span class="logo"> <a href="homeLoading.service"> <img
						src="images/logo.jpg"> </a> </span>

			<div class="keyword">
				<form method="post" id="med_form" action="getHosByName.service"
					onKeyDown="if(event.keyCode==13)return false;">
					<input type="text" name="hname" autocomplete="off"
						placeholder="请输入医院名称" id="search-tips-input" value="">
					<button type="button" class="btn-doctor" id="querySearch">
						搜&nbsp;索
					</button>
				</form>
				<div class="search-suggest-layer"
					style="display: none; border: 1px #eaeaea solid; margin-top: -2px; width: 466px; background-color: #fff; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; position: absolute; z-index: 1;"></div>
			</div>
		</div>
		</header>
		</header>

		<div class="wrap">
			<div class="container">
				<div class="hospital-list" data-isrecommend="0">
					<div class="content-left">
						<div class="depart-select" style="padding-top: 0;">
							<div class="select-detail hospital-level" data-type="3">
								<h4>
									医院级别:
								</h4>
								<ul class="dropmenus">
									<li id="grade0" data-value="0" class="select-cur">
										<a href="getHosByGrade.service?">全部</a>
									</li>
									<li id="grade1" data-value="12">
										<a href="getHosByGrade.service?grade=三甲">三甲医院</a>
									</li>
									<li id="grade2" data-value="12">
										<a href="getHosByGrade.service?grade=三乙">三乙医院</a>
									</li>
									<li id="grade3" data-value="9,10,11,12">
										<a href="getHosByGrade.service?grade=二甲">二甲医院</a>
									</li>
									<li id="grade4" data-value="5,6,7,8">
										<a href="getHosByGrade.service?grade=二级">二级医院</a>
									</li>
								</ul>
							</div>


						</div>
						<div class="sort-container">
							<p class="fl">
								为您找到
								<em id="hos_region">${hname }</em>共
								<label class="curdotor">
									<i id="hos_total">${count }</i>
								</label>
								家医院
							</p>
							<div class="hospital-sort fr">
								<span data-value="1" class="sort-cur">综合排序</span><span
									data-value="4">按累计提供服务次数</span><span class="medical-care"
									data-value="医保定点"><input type="checkbox" value="1">
									<label>
										医保定点
									</label> </span>
							</div>
						</div>
					</div>

					<!-- 医院列表 -->
					<ul id="hospital-list-ul">
						<c:forEach items="${hospitals }" var="hos">
							<li class="hospital-info-li">
								<div class="hospital-info">
									<div class="hospital-pic">
										<a target="_blank" href="getMedicinerByHospital.service?hname=${hos.hname }"> <img class="fl"
												src="images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg">
										</a>
									</div>
									<div class="hospital-introduces fl">
										<div class="introduces-title">
											<a href="getMedicinerByHospital.service?hname=${hos.hname }">${hos.hname }</a><span class="hospital-sign">${hos.grade }</span><span
												class="hospital-health">医保</span>
										</div>
										<p class="grade-star">
											<i class="star-right star-light star-fixed"></i><i
												class="star-right star-light star-fixed"></i><i
												class="star-right star-light star-fixed"></i><i
												class="star-right star-light star-fixed"></i><i
												class="star-right star-light star-fixed"></i><span
												class="grade-text ">9.8</span><span class="comment-text"></span>
										</p>
										<label>
											有优质医生
											<span>${hos.mcount }</span>人
											<span><table cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td valign="top" class="first-child">
																医院地址:
															</td>
															<td class="info-pos last-child">
																<p class="address">
																	${hos.address }
																</p>
																<a href="#" class="marker" target="_blank"><i
																	class="fa fa-map-marker"></i>查看地图</a>
															</td>
														</tr>
													</tbody>
												</table>
											</span>
										</label>
									</div>
									<div class="server-but fr">
										<p>
											<a href="getMedicinerByHospital.service?hname=${hos.hname }" target="_blank">预约挂号</a>
										</p>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<!-- END医院列表 -->
					<div class="pagination-x pull-right">
						<span class="pagers">
							<ul class="pagination-x-list">
								<ul>

									<li>
										<a class="prev-off"> <label>
												上一页
											</label> </a>
									</li>

									<li>
										<a class="prev-on" href="#"> <label>
												上一页
											</label> </a>
									</li>

									<li>
										<a class="next-off"> <label>
												下一页
											</label> </a>
									</li>

									<li>
										<a class="next-on"><label>
										下一页
									</label></a></li>


								</ul>
							</ul> </span>
					</div>
				</div>
			</div>
			<input type="hidden" id="search-tag" value="">
			<aside class="right-sidebar">
			<article class="broad"
				style="border-bottom: none; margin-bottom: 0px;">
			<h1 class="title">
				挂号规则
			</h1>
			<div class="ct">
				<p class="depics">
					<b class="sq">1.</b>每日8:00左右更新后一天号源
				</p>
				<p class="depics">
					<b class="sq">2.</b>可预约当天和未来2周号源
				</p>
				<p class="depics">
					<b class="sq">3.</b>请参考短信提示，到医院就诊
				</p>
				<p class="depics">
					<b class="sq">4.</b>就诊前一天16:00前，到“我的医者天下”&gt;“我的预约”，可取消预约
				</p>
				<p class="depics">
					<b class="sq">5.</b>如需帮助，可拨打客服4000-xxx-xxx(10:00-18:00)
				</p>
			</div>
			</article>
			<article class="broad" style="margin-bottom: 0px;">
			<h1 class="title">
				帮助中心
			</h1>
			<div class="ct">
				<p class="depics">
					<b class="sq">1.</b><a target="_blank" href="#">医者天下是什么？</a>
				</p>
				<p class="depics">
					<b class="sq">2.</b><a target="_blank" href="#">如何选择医生？</a>
				</p>
				<p class="depics">
					<b class="sq">3.</b><a target="_blank" href="#">如何预约医生？</a>
				</p>
				<p class="depics">
					<b class="sq">4.</b><a target="_blank" href="#">如何评价医生？</a>
				</p>
				<a class="more" target="_blank" href="#">查看更多&gt;</a>
			</div>
			</article>


			</aside>
			<c:if test="${empty hospitals }">
			<div class="result-empty hospital-empty" style="display:block;">
				<img src="images/no-hospital.png" class="resultimg">
				<div class="result-text">
					抱歉！没有符合条件的医院
				</div>
			</div>
			</c:if>
		</div>

		<footer id="footer-three" class="footer-box footer-three clear path"
			data-src="http://dpp.bdimg.com/static/pc/201604261639/asset"
			data-href="" data-api="http://yi.baidu.com"
			data-passport="https://passport.baidu.com">
		<div class="footer-con">
			<div class="footer-info-url">
				<dd class="fo-link">
					<a href="#" target="_blank"><span>帮助</span>|</a>
					<a href="#" target="_blank"><span>用户协议</span>|</a>
					<a href="#" target="_blank"><span>意见反馈</span> </a>
					<a href="#" target="_blank"><span>©2016 Mstanford
							&nbsp;&nbsp;隐私条款</span> </a>
				</dd>
			</div>
		</div>
		</footer>



			<script src="js/jquery-1.11.2.min.js"></script>



			<script src="js/jquery.SuperSlide.2.1.1.js"></script>

			<script type="text/javascript">
	jQuery(".slideBox").slide({
		mainCell : ".bd ul",
		autoPlay : true
	});

	jQuery(".slideBox2").slide({
		mainCell : ".bd ul",
		vis : 4,
		scroll : 4,
		effect : "left",
		autoPlay : false,
		pnLoop : false
	});
</script>
</body>
</html>
