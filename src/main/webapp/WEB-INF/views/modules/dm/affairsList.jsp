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
		<li class="active"><a href="${ctx}/dm/introducer/">今日时讯</a></li>
		<shiro:hasPermission name="dm:introducer:edit">
            <li><a href="${ctx}/dm/introducer/form">介绍人添加</a></li>
        </shiro:hasPermission>
	</ul>
    <h4>&nbsp;&nbsp;&nbsp;今日考试:</h4>
	<table  class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>考试科目</th>
				<th>考试次数</th>
                <th>是否交费</th>
				<th>联系电话</th>
				<shiro:hasPermission name="dm:affairs:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${exams_today}" var="exam">
			<tr>
				<td>
                    <a href="${ctx}/dm/exam/form?id=${exam.id}">${exam.student.name}</a>
				</td>
				<td>
                    ${fns:getDictLabel(exam.name,'examType' ,'' )}
				</td>
				<td>
                    第${fns:getDictLabel(exam.examCount,'exam_count' ,'' )}
				</td>
				<td>
                    ${fns:getDictLabel(exam.payFlag,'pay_flag' ,'' )}
				</td>
				<td>
					${exam.student.otherContacts}
				</td>
				<shiro:hasPermission name="dm:introducer:view"><td>
                    <c:choose>
                        <c:when test="${exam.passFlag==1}">
                            <font color="green">已通过</font>
                        </c:when>
                        <c:when test="${exam.passFlag==2}">
                            <font color="red"> 未通过</font>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/dm/exam/preAddResult?id=${exam.id}">录入结果</a>
                        </c:otherwise>

                    </c:choose>

				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>

    <br/>
    <h4>&nbsp;&nbsp;&nbsp;今日练车:</h4>
	<table  class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>练习科目</th>
                <th>教练</th>
                <th>练习时间</th>
                <th>本次计时</th>
				<th>联系电话</th>
				<shiro:hasPermission name="dm:affairs:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${trains_today}" var="train">
			<tr>
				<td>
                    <a href="${ctx}/dm/train/form?id=${train.id}">${train.student.name}</a>
				</td>
				<td>
                    ${fns:getDictLabel(train.name,'examType' ,'' )}
				</td>
				<td>
                    ${train.coach.name}
				</td>
				<td>
                    <fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd hh:mm"/>
				</td>
				<td>
                    ${fns:getDictLabel(train.countTime,'timeCount' ,'' )}
				</td>
				<td>
                    ${train.student.otherContacts}
				</td>
				<shiro:hasPermission name="dm:introducer:view"><td>
    				<a href="${ctx}/dm/train/form?id=${train.id}">修改</a>
					<a href="${ctx}/dm/train/delete?id=${train.id}" onclick="return confirmx('确认要删除该介绍人吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>

    <br/>
    <h4>&nbsp;&nbsp;&nbsp;明日考试:</h4>
	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
                <th>姓名</th>
                <th>考试科目</th>
                <th>考试次数</th>
                <th>是否交费</th>
                <th>联系电话</th>
				<shiro:hasPermission name="dm:affairs:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${exams_tomorrow}" var="exam">
			<tr>
				<td>
                    <a href="${ctx}/dm/exam/form?id=${exam.id}">${exam.student.name}</a>
				</td>
				<td>
                    ${fns:getDictLabel(exam.name,'examType' ,'' )}
				</td>
				<td>
                    ${fns:getDictLabel(exam.examCount,'exam_count' ,'' )}
				</td>
                <td>
                    ${fns:getDictLabel(exam.payFlag,'pay_flag' ,'' )}
				</td>
				<td>
					${exam.student.otherContacts}
				</td>
                <shiro:hasPermission name="dm:affairs:view"><td>
                    ${fns:getDictLabel(exam.passFlag,'pass_flag' ,'' )}
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    <br/>
    <h4>&nbsp;&nbsp;&nbsp;明日练车:</h4>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
                <th>姓名</th>
                <th>练习科目</th>
                <th>教练</th>
                <th>练习时间</th>
                <th>本次计时</th>
                <th>联系电话</th>
				<shiro:hasPermission name="dm:affairs:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${trains_tomorrow}" var="train">
            <tr>
                <td>
                    <a href="${ctx}/dm/train/form?id=${train.id}">${train.student.name}</a>
                </td>
                <td>
                        ${fns:getDictLabel(train.name,'examType' ,'' )}
                </td>
                <td>
                        ${train.coach.name}
                </td>
                <td>
                    <fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd hh:mm"/>
                </td>
                <td>
                        ${fns:getDictLabel(train.countTime,'timeCount' ,'' )}
                </td>
                <td>
                        ${train.student.otherContacts}
                </td>
                <shiro:hasPermission name="dm:introducer:view"><td>
                    <a href="${ctx}/dm/introducer/form?id=${introducer.id}">修改</a>
                    <a href="${ctx}/dm/introducer/delete?id=${introducer.id}" onclick="return confirmx('确认要删除该介绍人吗？', this.href)">删除</a>
                </td></shiro:hasPermission>
            </tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>