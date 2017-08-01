<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>教练信息管理</title>
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
		<li class="active"><a href="${ctx}/dm/coach/">教练信息列表</a></li>
		<shiro:hasPermission name="dm:coach:edit"><li><a href="${ctx}/dm/coach/form">添加教练信息</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="coach" action="${ctx}/dm/coach/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>性别：</label>
				<form:select path="sex" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idcard" htmlEscape="false" maxlength="18" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="tel" htmlEscape="false" maxlength="16" class="input-medium"/>
			</li>
			<li><label>出生日期：</label>
				<input name="birthday" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${coach.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
				<th>出生日期</th>
				<th>家庭住址</th>
				<shiro:hasPermission name="dm:coach:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="coach">
			<tr>
				<td><a href="${ctx}/dm/coach/form?id=${coach.id}">
					${coach.name}
				</a></td>
				<td>
					${fns:getDictLabel(coach.sex, 'sex', '')}
				</td>
				<td>
					${coach.idcard}
				</td>
				<td>
					${coach.tel}
				</td>
				<td>
					<fmt:formatDate value="${coach.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${coach.homeAddress}
				</td>
				<shiro:hasPermission name="dm:coach:view"><td>
    				<a href="${ctx}/dm/coach/form?id=${coach.id}">修改</a>
					<a href="${ctx}/dm/coach/delete?id=${coach.id}" onclick="return confirmx('确认要删除该开始记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>