<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
      String path = request.getContextPath();
      String basePath = request.getScheme() + "://"
                  + request.getServerName() + ":" + request.getServerPort()
                  + path + "/";
%>
<base href="<%=basePath%>">  

<html>
<head>
	<link rel="stylesheet" href="<%=basePath%>source/bootstrap.min.css" />
	<!-- import CSS -->
  	<link rel="stylesheet" href="https://unpkg.com/element-ui@2.3.7/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="<%=basePath%>source/style.css" />
    <script type="text/javascript" src="<%=basePath%>source/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>source/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>source/syq-pagination1.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/scripts/vue.js"></script>
  	<script src="//unpkg.com/element-ui@2.3.7/lib/index.js"></script>
	<title>Lost&amp;Found System</title>
</head>

<body>
	<header style="position: relative;">
		<nav class="container">
			<div class="nav_l">
				<h2 class="head_tilte"><a href="#">SUT校园失物招领系统</a></h2>

				<!--<ul style="margin: 120px 150px 0px 150px;">
          <li>
            <a href="newfound.html" style="padding:20px;">发布招领</a>
          </li>

          <li>
            <a href="newlost.html" style="padding:20px;">发布寻物</a>
          </li>
        </ul>-->
			</div>

			<div class="nav_r">
				<ul>
					<li><img src="./images/default.png" /></li>

					
				</ul>
			</div>
		</nav>
		<div id="search">
			<a id="la" class="home" href=""><i class="iconfont arrow">&#xe604;</i></a>
			<a class="search_item" href="user/newlost">
				发布失物信息
			</a>
			<a class="search_item" href="user/newfound">
				发布拾物信息
			</a>

			 <form action="user/usersearch" method="get" id="searchform">
				<input type="hidden" id="mod" name="mod" value="lost" />
				<div id="searchwindow" class="col-sm-3">
					<div class="input-group">
						<div class="input-group-btn">
							<button id="sel" type="button" class="btn btn-default 
                        dropdown-toggle" data-toggle="dropdown">lost
                            <span class="caret"></span>
                        </button>
							<ul class="dropdown-menu">
								<li>
									<a onclick="lost()">lost</a>
								</li>

								<li>
									<a onclick="found()">found</a>
								</li>
							</ul>
						</div>
						<input type="text" name="scontent" class="form-control" onkeydown="onKeyDown(event)" />
						<span onclick="fsubmit()" class="input-group-addon btn btn-info"><a id="ra" ><i class="glyphicon glyphicon-search"></i></a></span>
					</div>
				</div>
			</form>
			<ul>
       	  <li id="accountmenu">
            <div href="#" style="padding:1rem;;font-family:arial;">
            	<c:if test="${Uname == NULL}">
            		<a href="login">请登录</a>
            	</c:if>
            	<c:if test="${Uname != NULL}">
            	<a title="查看我的相关信息" href="user/userlostinfor">${Uname}</a> , <a href="logout">退出</a>
            	</c:if>
            </div>

          </li>
        </ul>
		</div>
	</header>
	<div class="poi-container">
		<div class="crumb-container">
			<nav class="poi-crumb">
				<a href="" class="poi-crumb__item" title="返回到首页">
					<i class="iconfont arrow">&#xe604;</i>
				</a>
				<span class="poi-crumb__split">
			  		<i class="glyphicon glyphicon-chevron-right" aria-hidden="true"></i> 
			  	</span>
				<a class="poi-crumb__item">
					失物信息
				</a>
			</nav>
		</div>
		<div id="breadcrumb">
			<el-breadcrumb separator="/">
			  <el-breadcrumb-item v-for="t in types" :key="t.tid"><a @click="gettype(t.tid)">{{t.typename}}</a></el-breadcrumb-item>
			  
			  <el-breadcrumb-item><a @click="gettype('0')">全部</a></el-breadcrumb-item>
			</el-breadcrumb>
		</div>

		<div id="listDivId" class="article__container">
			
			<!-- <article class="article__container__item">
				<div class="inn-article__container__item">
					<a href="user/ldetail" target="_blank" class="article__a1"> 
						<img class="article__a1__img" src="images/1.jpg" alt="brown_hair"> 
					</a>
					<h3 class="article__item__title" title="">
						<a href="user/ldetail" target="_blank" class="article__a__title"> 【在线壁纸】brown_hair</a>
					</h3>
					
					<div class="article__container__meta">
						<div class="article__container__meta__item">
							<a  target="_blank" class=""> 
								<img src="./images/9K.jpg" width="50" height="50" alt="brown_hair"> 
									<span>失物信息</span>
							</a>
						</div>
						<div class="article__container__meta__time"><time> 2018-2-20</time></div>
					</div>
				</div>
			</article>
			
			<article class="article__container__item">
				<div class="inn-article__container__item">
					<a href="" target="_blank" class="article__a1"> 
						<img class="article__a1__img" src="images/s1.jpg" alt="brown_hair"> 
					</a>
					<h3 class="article__item__title" title="">
						<a href="" target="_blank" class="article__a__title"> 【在线壁纸】brown_hair</a>
					</h3>
					
					<div class="article__container__meta">
						<div class="article__container__meta__item">
							<a href="" target="_blank" class=""> 
								<img src="./images/9K.jpg" width="50" height="50" alt="brown_hair"> 
									<span>失物信息</span>
							</a>
						</div>
						<div class="article__container__meta__time"><time> 2018-2-20</time></div>
					</div>
				</div>
			</article> -->
			
			
			
		</div>

		<div style="clear: both;"></div>
		<div align="center">
			<ul id="pagingDivId" class="pagination pager">
				<li>
					<a href="#">&laquo;</a>
				</li>
				<li class="active">
					<a href="#">1</a>
				</li>
				<li class="disabled">
					<a href="#">2</a>
				</li>
				<li>
					<a href="#">3</a>
				</li>
				<li>
					<a href="#">&raquo;</a>
				</li>
			</ul>
		</div>
	</div>
  <footer>
			<div class="footer_wrap container">
				<div class="footer_l">
					<ul>
						<li><a href="javascript:void(0);">关于我们</a></li>
						<li>|</li>
						<li><a href="javascript:void(0);">联系我们</a></li>
						<li>|</li>
						<li><a href="javascript:void(0);">支持我们</a></li>
					</ul>
				</div>
				<div class="footer_r">
					<span>&copy;</span>
					<p>2017&nbsp;沈阳工业大学</p>
				</div>
			</div>
	</footer>
	<script type="text/javascript">
	
	function usersAjax(pageIndex,everyPageDataCount,type){//初始化数据
	    
	    $.ajax({
	        type: "POST",
	        url: "user/userlost",
	        data: {
	            pageIndex: pageIndex,//当前第几页（0序列）
	            everyPageDataCount:everyPageDataCount,//每一页多少条数据
	            type:type
	            
	        },
	        dataType: "json",
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            //window.location.href = "/paging/PagingServlet";
	        },
	        success: function (json) {
	            if(json.myData!=""){
	                var listHtml="";
	                for(var i=0;i<json.myData.length;i++){
	                    
	                    
	                   listHtml+='<article class="article__container__item">'
			    				+'<div class="inn-article__container__item">'
			    				+'<a href="user/ldetail/'+json.myData[i].lid+'" target="_blank" class="article__a1"> '
			    				+'		<img class="article__a1__img" src="img/faces/'+json.myData[i].limg+'" alt="brown_hair">' 
			    				+'	</a>'
			    				+'	<h3 class="article__item__title" title="">'
			    				+'		<a href="user/ldetail/'+json.myData[i].lid+'" target="_blank" class="article__a__title">'+json.myData[i].lname+'</a>'
			    				+'	</h3>'
			    				+'	<div class="article__container__meta">'
			    				+'		<div class="article__container__meta__item">'
			    				+'			<a> '
			    				+'				<img src="images/9K.jpg" width="50" height="50" alt="brown_hair">' 
			    				+'					<span>失物信息</span>'
			    				+'			</a>'
			    				+'		</div>'
			    				+'		<div class="article__container__meta__time"><time>'+json.date[i]+'</time></div>'
			    				+'	</div>'
			    				+'</div>'
			    				+'</article>'; 
	                }
	                
	                $("#listDivId").html(listHtml);
	               
	                pagingAjax(json.dataCount,everyPageDataCount,json.pageIndex,type)
	            }else{
	            	var listHtml='<div style="margin: auto;"><h1>抱歉，无相关结果</h1></div>';
	                $("#listDivId").html(listHtml);
	                pagingAjax(json.dataCount,everyPageDataCount,json.pageIndex,type)
	
	            }
	
	
	
	        }
	    });
	}
	
	function pagingAjax(dataCount,everyPageDataCount,nowPage,type){
	    $("#pagingDivId").zcPage({
	        allDataCount: dataCount,//一共有多少条数据
	        everyPageDataCount: everyPageDataCount,//每一页显示多少条数据
	        nowPageCataCount:nowPage,//当前是第几页
	        success: function (nowPageCataCount/*当前是第几页*/) {
	            usersAjax(nowPageCataCount,everyPageDataCount,type)
	
	        },
	    });
	}
	</script>
	<script type="text/javascript">
	$(document).ready(function () {
	    
	    usersAjax(0,10,0);
	   
	});
	</script>
	<script type="text/javascript">
	    function onKeyDown(event){
	        var e = event || window.event || arguments.callee.caller.arguments[0];
	                   
	        if(e && e.keyCode==13){ // enter 键
	            /*  alert("此处回车触发搜索事件"); */
	             $("#searchform").submit();
	        }
	        
	    }
	    function fsubmit(){
	    	$("#searchform").submit();
	    }
	    function lost(){
	    	$("#mod").val("lost");
	    	var str='lost<span class="caret"></span>';
	    	$("#sel").html(str);
	    }
	    function found(){
	    	$("#mod").val("found");
	    	var str='found<span class="caret"></span>';
	    	$("#sel").html(str);
	    }
	
	</script>
	<script>
		var app1=new Vue({
			el:"#breadcrumb",
			data:{
				types:[]
			},
			created:function(){
				 $.ajax({
				        type: "POST",
				        url: "user/type",
				        dataType: "json",
				        error: function (XMLHttpRequest, textStatus, errorThrown) {
				            //window.location.href = "/paging/PagingServlet";
				            
				        },
				        success: function (json) {
				            if(json.types!=""){
				            	
				            	app1.types=json.types;
				                
				            }else{
				            	
				
				            }
						}
				    });
			},
			methods:{
				gettype:function(message){
					usersAjax(0,10,message);
				}
			}
		});
		
	</script>
	</body>

	</html>