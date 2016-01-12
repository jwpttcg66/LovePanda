<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${blogPage.list}" var="l">
  	<c:if test="${not empty l.image}">
  		<div class="inner-box blog-img">
			<a class="blog-a-curse" href="${base}/blog/detail/${l.id}">
				<img alt="" class="am_img animated" src="${base}/images/index/loading.gif" data-original="${base}/attached/blog/${l.image}" >
			</a>
			<div class="blog-header">
				<a href="${base}/blog/categorySearcher?category=${l.category}" class="blog-category">${l.categorystr }</a>
				<h2>${l.title}</h2>
			</div>
			<p class="blog-ext">
				<span class="blog-ext-ico">
					<i class="am-icon-user am-icon-sm blog-ext-ico"></i>
					${l.username}
				</span>
				<span class="blog-ext-ico"><i class="am-icon-clock-o am-icon-sm blog-ext-ico"></i><fmt:formatDate value="${l.create_time}" pattern="yyyy-MM-dd"/></span>
				<span class="blog-ext-ico">
					<i class="am-icon-eye am-icon-sm blog-ext-ico"></i>
					${l.view}
				</span>
			</p>
			<p class="blog-content-show">${l.content_show}...<br><br>
			<span class="blog-keyword-show">${l.keyword}</span>
			</p>
			<button type="button" class="am-btn am-btn-warning am-round" style="margin-right: 10px;position: absolute;bottom: 15px;right: 15px;" onclick="location.href='${base}/blog/detail/${l.id}'">阅读全文</button>
 		</div>
  	</c:if>
  	<c:if test="${empty l.image}">
	  	<div class="inner-box blog-img">
			<div class="blog-header">
				<a href="${base}/blog/categorySearcher?category=${l.category}" class="blog-category">${l.categorystr }</a>
				<h2>${l.title}</h2>
			</div>
			<p class="blog-ext">
				<span class="blog-ext-ico">
					<i class="am-icon-user am-icon-sm blog-ext-ico"></i>
					${l.username}
				</span>
				<span class="blog-ext-ico"><i class="am-icon-clock-o am-icon-sm blog-ext-ico"></i><fmt:formatDate value="${l.create_time}" pattern="yyyy-MM-dd"/></span>
				<span class="blog-ext-ico">
					<i class="am-icon-eye am-icon-sm blog-ext-ico"></i>
					${l.view}
				</span>
			</p>
			<p class="blog-content-show">${l.content_show}...<br><br>
			<span class="blog-keyword-show">${l.keyword}</span>
			</p>
			<button type="button" class="am-btn am-btn-warning am-round index-readmore" style="margin-right: 10px;position: absolute;bottom: 15px;right: 15px;" onclick="location.href='${base}/blog/detail/${l.id}'">阅读全文</button>
 		</div>
  	</c:if>
</c:forEach>