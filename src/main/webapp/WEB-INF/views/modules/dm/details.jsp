<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>详细信息</title>
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
		<li class="active"><a href="${ctx}/dm/student/">学院详细记录</a></li>
	</ul>

    <h4>个人信息</h4>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">

		<tbody>
			<tr>
				<td>${student.name} </td>
				<td>
					性别: ${fns:getDictLabel(student.sex, 'sex', '')}
				    身份证号: ${student.idcard}
				    出生日期: <fmt:formatDate value="${student.birthday}" pattern="yyyy-MM-dd"/>
                    现居地: ${student.presentAddress}
				    报名时间: <fmt:formatDate value="${student.registrationTime}" pattern="yyyy-MM-dd "/>
				    <c:if test="${student.flag==0}">尚未拿证</c:if>
				    <c:if test="${student.flag!=1}"><fmt:formatDate value="${student.endTime}" pattern="yyyy-MM-dd "/></c:if>

				    使用计时: ${student.useHours}

                    ${fns:getDictLabel(student.flag, 'yes_no', '')}
				</td>
				<td>
					${fns:getDictLabel(student.type, 'Drivercardtype', '')}
				</td>
				<td>
					${student.money}
				</td>
				<shiro:hasPermission name="dm:student:view"><td>
    				<a href="${ctx}/dm/student/form?id=${student.id}">修改</a>
					<a href="${ctx}/dm/student/delete?id=${student.id}" onclick="return confirmx('确认要删除该学员吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>