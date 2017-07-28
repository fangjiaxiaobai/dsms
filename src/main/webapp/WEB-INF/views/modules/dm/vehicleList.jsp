<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>车辆管理</title>
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
		<li class="active"><a href="${ctx}/dm/vehicle/">车辆列表</a></li>
		<shiro:hasPermission name="dm:vehicle:view"><li><a href="${ctx}/dm/vehicle/form">车辆添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="vehicle" action="${ctx}/dm/vehicle/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">

			<li><label>车辆类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('vehicle_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>车牌号：</label>
				<form:input path="plate" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>车辆类型</th>
				<th>车牌号</th>
				<shiro:hasPermission name="dm:vehicle:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="vehicle">
			<tr>
				<td><a href="${ctx}/dm/vehicle/form?id=${vehicle.id}">
					${fns:getDictLabel(vehicle.type, 'vehicle_type', '')}
				</a></td>
				<td>
					${vehicle.plate}
				</td>
				<shiro:hasPermission name="dm:vehicle:view"><td>
    				<a href="${ctx}/dm/vehicle/form?id=${vehicle.id}">修改</a>
					<a href="${ctx}/dm/vehicle/delete?id=${vehicle.id}" onclick="return confirmx('确认要删除该车辆吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>