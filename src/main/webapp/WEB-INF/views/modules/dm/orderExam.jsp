<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>预约考试</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">

        $(function(){
            $("#payment").hide();
        });

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
             * 当是否交费发生改变的时候，交费金额框根据其选择，显示或者隐藏
             */
			$("#payFlag").change(function() {
                if ($("#payment").length >= 0) {
                    if ($("#payFlag").val() == 1) {
                        $("#payment").show();
                    }else{
                        $("#payment").hide();
                    }
                }
            });


            /**
             * 当选中studnet的时候，发送ajax请求去统计该student，是第几次考试
             */
            $("#studentName").change(function(){
                var studentId = $("#studentName").val();
                var examType = $("#examType").val();
                alert(studentId+"----"+examType);
                if(examType&&studentId){
                    $.ajax({
                        url:'${ctx}/dm/exam/getStudentExamCount',
                        method:'POST',
                        dataType:'text',
                        data:{'id':studentId,'type':examType},
                        success:function(data){
                            $("#examCount").val(data);
                        }
                    });
                }
            });
            /**
             * examType，发送ajax请求去统计该student，是第几次考试
             */
            $("#examType").change(function(){
                var studentId = $("#studentName").val();
                var examType = $("#examType").val();
                alert(studentId+"----"+examType);
                if(examType&&studentId){
                    $.ajax({
                        url:'${ctx}/dm/exam/getStudentExamCount',
                        method:'POST',
                        dataType:'text',
                        data:{'id':studentId,'type':examType},
                        success:function(data){
                            alert(data);
                            $("#examCount").val(data);
                        }
                    });
                }
            });
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/dm/exam/">考试记录</a></li>
        <li class="active"><a href="${ctx}/dm/exam/orderExam">预约考试</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="exam" action="${ctx}/dm/exam/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
        <div class="control-group">
            <label class="control-label">学员姓名：</label>
            <div class="controls">
                <form:select path="sid" class="input-xlarge required" id="studentName">
                    <form:option value="" label=""/>
                    <form:options items="${students}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                </form:select>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label">考试科目：</label>
			<div class="controls">
                <form:select path="passFlag" class="input-xlarge " id="examType">
                    <form:option value="" label=""/>
                    <form:options items="${fns:getDictList('examType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考试时间：</label>
			<div class="controls">
				<input name="time" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${exam.time}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">是否交费：</label>
			<div class="controls">
				<form:select path="payFlag" class="input-xlarge required" id="payFlag">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('pay_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="payment">
			<label class="control-label">交费金额：</label>
			<div class="controls">
				<form:input path="payMoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考试次数：</label>
			<div class="controls">
				<form:input path="examCount" id="examCount"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="dm:exam:view"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>