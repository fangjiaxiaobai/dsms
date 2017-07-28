<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>介绍人管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {

		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/dm/introducer/">介绍人列表</a></li>
		<shiro:hasPermission name="dm:introducer:view">
            <li><a href="${ctx}/dm/introducer/form">介绍人添加</a></li>
        </shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="introducer" action="${ctx}/dm/introducer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>性别：</label>
				<form:input path="sex" htmlEscape="false" maxlength="8" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idcard" htmlEscape="false" maxlength="18" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="tel" htmlEscape="false" maxlength="16" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>身份证号</th>
				<th>联系电话</th>
				<shiro:hasPermission name="dm:introducer:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="introducer">
			<tr>
				<td><a href="${ctx}/dm/introducer/form?id=${introducer.id}">
					${introducer.name}
				</a></td>
				<td>
					${introducer.sex}
				</td>
				<td>
					${introducer.idcard}
				</td>
				<td>
					${introducer.tel}
				</td>
				<shiro:hasPermission name="dm:introducer:view"><td>
    				<a href="${ctx}/dm/introducer/form?id=${introducer.id}">修改</a>
					<a href="${ctx}/dm/introducer/delete?id=${introducer.id}" onclick="return confirmx('确认要删除该介绍人吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>