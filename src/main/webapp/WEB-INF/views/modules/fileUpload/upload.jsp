<%--
  Created by IntelliJ IDEA.
  User: wangxiyue
  Date: 2017/8/1
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
<sys:message content="${message}"/>
        <form:form action="${ctx}/fileUpload/upload" enctype="multipart/form-data" method="POST">
            <input type="file" name="uploadFile" />
            <input type="submit" value="提交"/>
        </form:form>


</body>
</html>
