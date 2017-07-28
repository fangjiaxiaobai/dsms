<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>开始记录管理</title>
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
		<li class="active"><a href="${ctx}/dm/exam/">考试记录</a></li>
		<shiro:hasPermission name="dm:exam:view"><li><a href="${ctx}/dm/exam/form">预约考试</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="exam" action="${ctx}/dm/exam/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>考试名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>考试时间：</label>
                <input name="time" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
                       value="<fmt:formatDate value="${exam.time}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>考试结果：</label>
				<form:select path="passFlag" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('pass_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>是否交费：</label>
				<form:select path="payFlag" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('pay_flay')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>考试次数：</label>
				<form:select path="examCount" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('exam_count')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>考试名称</th>
				<th>考试时间</th>
				<th>考试得分</th>
				<th>考试结果</th>
				<th>是否交费</th>
				<th>交费金额</th>
				<th>考试次数</th>
				<shiro:hasPermission name="dm:exam:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="exam">
			<tr>
				<td><a href="${ctx}/dm/exam/form?id=${exam.id}">
					${exam.name}
				</a></td>
				<td>
					<fmt:formatDate value="${exam.time}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${exam.score}
				</td>
				<td>
					${fns:getDictLabel(exam.passFlag, 'pass_flag', '')}
				</td>
				<td>
					${fns:getDictLabel(exam.payFlag, 'pay_flay', '')}
				</td>
				<td>
					${exam.payMoney}
				</td>
				<td>
                        ${exam.examCount}
				</td>
				<shiro:hasPermission name="dm:exam:edit"><td>
    				<a href="${ctx}/dm/exam/form?id=${exam.id}">修改</a>
					<a href="${ctx}/dm/exam/delete?id=${exam.id}" onclick="return confirmx('确认要删除该开始记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>