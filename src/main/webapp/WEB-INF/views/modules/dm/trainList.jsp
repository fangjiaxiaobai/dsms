<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>练车管理</title>
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
		<li class="active"><a href="${ctx}/dm/train/">练车列表</a></li>
		<shiro:hasPermission name="dm:train:edit"><li><a href="${ctx}/dm/train/form">练车添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="train" action="${ctx}/dm/train/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>练习科目：</label>
                <form:select path="name" htmlEscape="false" class="input-medium">
                    <form:option value="" label="全部" />
                    <form:options items="${fns:getDictList('examType')}" itemLabel="label" itemValue="value"/>
                </form:select>
			</li>
            <li><label>学员姓名：</label>
                <form:select path="student.id" htmlEscape="false" class="input-medium" >
                    <form:option value="" label="不限" />
                    <form:options items="${students}" itemValue="id" itemLabel="name" />
                </form:select>
            </li>
            <li><label>教练姓名：</label>
                <form:select path="coach.id" htmlEscape="false" class="input-medium" >
                    <form:option value="" label="不限" />
                    <form:options items="${coaches}" itemValue="id" itemLabel="name" />
                </form:select>
            </li>
			<li><label>开始时间：</label>
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd HH:mm"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
			</li>
			<li><label>是否缴费：</label>
				<form:select path="payFlag" class="input-medium">
					<form:option value="" label="不限"/>
					<form:options items="${fns:getDictList('payflag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>使用车辆：</label>
                <form:select path="vehicle" class="input-medium require">
                    <form:option value="" label="不限"/>
                    <form:options items="${vehicles}" itemLabel="plantANdType" itemValue="id" htmlEscape="false" />
                </form:select>
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
                <th>教练姓名</th>
				<th>开始时间</th>
				<th>本次计时</th>
				<th>是否缴费</th>
				<th>缴费金额</th>
                <th>练车科目</th>
				<th>车辆名称</th>
				<shiro:hasPermission name="dm:train:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="train">
            <tr>
                <td>
					${train.student.name}
				</td>
                <td>
                    ${train.coach.name}
                </td>
                <td>
					<fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
                <td>
                    ${fns:getDictLabel(train.countTime, 'timeCount', '')}
				</td>
                <td>
					${fns:getDictLabel(train.payFlag, 'pay_flag', '')}
				</td>
                <td>
					${train.payMoney}
				</td>
                <td>
                   ${fns:getDictLabel(train.name, 'examType', '')}
				</td>
				<td>
					${train.vehicle.type}-${train.vehicle.plate}
				</td>
				<shiro:hasPermission name="dm:train:view"><td>
    				<a href="${ctx}/dm/train/form?id=${train.id}">修改</a>
					<a href="${ctx}/dm/train/delete?id=${train.id}" onclick="return confirmx('确认要删除该练车吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>