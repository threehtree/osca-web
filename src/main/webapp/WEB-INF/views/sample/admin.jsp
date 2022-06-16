<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2022-06-14
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Admin</h1>

    <h1><sec:authentication property="principal.memName"/></h1>
    <h1><sec:authentication property="principal"/></h1>
</body>
</html>
