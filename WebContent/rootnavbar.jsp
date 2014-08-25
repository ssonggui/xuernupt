<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <nav class="navbar"  role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
        	<ul class="nav nav-pills nav-stacked">
			
        		<li <c:if test="${rootactive=='1'}">class="activee"</c:if>><a href="<%=request.getContextPath()%>/root">查看会员</a></li>
        		<li <c:if test="${rootactive=='2'}">class="activee" </c:if>><a onclick="edit()" href="#">编辑会员</a></li>
        		<li <c:if test="${rootactive=='3'}">class="activee" </c:if>><a href="<%=request.getContextPath()%>/root/add">增加会员</a></li>
        		<li <c:if test="${rootactive=='4'}">class="activee" </c:if>><a onclick="document.getElementById('del').submit();" href="#">删除会员</a></li>
        	</ul>

        </div><!--/.navbar-collapse -->
      
    </nav>








