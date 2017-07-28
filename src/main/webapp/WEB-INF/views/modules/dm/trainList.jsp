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
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>开始时间：</label>
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>是否缴费：</label>
				<form:select path="payFlag" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('payflag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>缴费金额：</label>
				<form:input path="payMoney" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>学员姓名：</label>
				<form:input path="sId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>教练姓名：</label>
				<form:input path="cId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>车辆名称：</label>
				<form:input path="vId" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th>开始时间</th>
				<th>总计时</th>
				<th>是否缴费</th>
				<th>缴费金额</th>
				<th>学员姓名</th>
				<th>教练姓名</th>
				<th>车辆名称</th>
				<shiro:hasPermission name="dm:train:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="train">
			<tr>
				<td><a href="${ctx}/dm/train/form?id=${train.id}">
					${train.name}
				</a></td>
				<td>
					<fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${train.countTime}
				</td>
				<td>
					${fns:getDictLabel(train.payFlag, 'payflag', '')}
				</td>
				<td>
					${train.payMoney}
				</td>
				<td>
					${train.sId}
				</td>
				<td>
					${train.cId}
				</td>
				<td>
					${train.vId}
				</td>
				<shiro:hasPermission name="dm:train:edit"><td>
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