<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>练车管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});

            /**
             * 当修改练车记录的时候，交费金额框不用隐藏。
             */
			<c:if test="${train.payFlag!=1}">
			    $("#payMoney").hide();
            </c:if>


			$("#payFlag").change(function(){
                if ($("#payMoney").length >= 0) {
                    if ($("#payFlag").val() == 1) {
                        $("#payMoney").show();
                    }else{
                        $("#payMoney").hide();
                    }
                }
            });
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/dm/train/">练车列表</a></li>
		<li class="active"><a href="${ctx}/dm/train/form?id=${train.id}">${not empty train.id?'修改练车信息':'预约练车'}</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="train" action="${ctx}/dm/train/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
        <div class="control-group">
            <label class="control-label">学员姓名：</label>
            <div class="controls">
                <form:select path="student.id" class="input-medium">
                    <form:option value="" label=""/>
                    <form:options items="${students}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                </form:select>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">练车科目：</label>
            <div class="controls">
                <form:select path="name" class="input-medium">
                    <form:option value="" label=""/>
                    <form:options items="${fns:getDictList('examType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">教练姓名：</label>
            <div class="controls">
                <form:select path="coach.id" class="input-medium">
                    <form:option value="${train.coach.id}" label="${train.coach.name}"/>
                    <form:options items="${coachs}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                </form:select>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label">使用车辆：</label>
            <div class="controls">
                <form:select path="vehicle.id" class="input-medium require">
                    <form:option value="${train.vehicle.id}" label="${train.vehicle.plate}"/>
                    <form:options items="${vehicles}" itemLabel="plate" itemValue="id" htmlEscape="false" />
                </form:select>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label">开始时间：</label>
			<div class="controls">
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${train.startDate}" pattern="yyyy-MM-dd HH:mm"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">总计时：</label>
			<div class="controls">
                <form:select path="countTime" class="input-medium required">
                    <form:option value="" label=""/>
                    <form:options items="${fns:getDictList('timeCount')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
                <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否缴费：</label>
			<div class="controls">
				<form:select path="payFlag" class="input-xlarge required" id="payFlag">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('pay_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
                <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="control-group" id="payMoney">
			<label class="control-label">缴费金额：</label>
			<div class="controls">
				<form:input path="payMoney" htmlEscape="false" class="input-xlarge required" value="0"/>
			</div>
            <span class="help-inline"><font color="red">*</font> </span>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="dm:train:view"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>