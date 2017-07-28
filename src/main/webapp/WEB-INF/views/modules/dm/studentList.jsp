<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>学员管理</title>
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
		<li class="active"><a href="${ctx}/dm/student/">学员列表</a></li>
		<shiro:hasPermission name="dm:student:edit"><li><a href="${ctx}/dm/student/form">学员添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="student" action="${ctx}/dm/student/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>学员姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idcard" htmlEscape="false" maxlength="21" class="input-medium"/>
			</li>
			<li><label>报名时间：</label>
				<input name="registrationTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${student.registrationTime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd ',isShowClear:false});"/>
			</li>
			<li><label>拿证时间：</label>
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${student.endTime}" pattern="yyyy-MM-dd "/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd ',isShowClear:false});"/>
			</li>
			<li><label>是否拿证：</label>
				<form:select path="flag" class="input-medium">
                    <form:option value="0" label="" />
                    <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
			</li>
			<li><label>学车类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('Drivercardtype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>介绍人：</label>
				<form:input path="introducerId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>学员姓名</th>
				<th>性别</th>
				<th>身份证号</th>
				<th>出生日期</th>
				<th>现居地</th>
				<th>报名时间</th>
				<th>拿证时间</th>
				<th>已用计时</th>
				<th>是否拿证</th>
				<th>学车类型</th>
				<th>交费金额</th>
				<shiro:hasPermission name="dm:student:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="student">
			<tr>
				<td><a href="${ctx}/dm/student/form?id=${student.id}">
					${student.name}
				</a></td>
				<td>
					${fns:getDictLabel(student.sex, 'sex', '')}
				</td>
				<td>
					${student.idcard}
				</td>
				<td>
					<fmt:formatDate value="${student.birthday}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${student.presentAddress}
				</td>
				<td>
					<fmt:formatDate value="${student.registrationTime}" pattern="yyyy-MM-dd "/>
				</td>
				<td>
					<fmt:formatDate value="${student.endTime}" pattern="yyyy-MM-dd "/>
				</td>
				<td>
					${student.useHours}
				</td>
				<td>
                    ${fns:getDictLabel(student.flag, 'yes_no', '')}
				</td>
				<td>
					${fns:getDictLabel(student.type, 'Drivercardtype', '')}
				</td>
				<td>
					${student.money}
				</td>
				<shiro:hasPermission name="dm:student:edit"><td>
    				<a href="${ctx}/dm/student/form?id=${student.id}">修改</a>
					<a href="${ctx}/dm/student/delete?id=${student.id}" onclick="return confirmx('确认要删除该学员吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>