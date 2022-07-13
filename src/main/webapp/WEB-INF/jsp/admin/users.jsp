<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%! String page_title="Администрирование пользователей"; %>
<%@include file="../includes/header.jsp" %>

<div class="main-wrapper">
  <div class="list-row">
    <table>
      <thead>
      <th>ID</th>
      <th>Логин</th>
      <th>Пароль</th>
      <th>Роли</th>
      <th>Действия</th>
      </thead>
      <c:forEach items="${allUsers}" var="user">
        <tr>
          <td>${user.id}</td>
          <td>${user.username}</td>
          <td>${user.password}</td>
          <td>
            <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
          </td>
          <td>
            <form action="${pageContext.request.contextPath}/admin/users" method="post">
              <input type="hidden" name="userId" value="${user.id}"/>
              <input type="hidden" name="action" value="delete"/>
              <button type="submit">Удалить</button>
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
  <div class="link-row">
    <a href="/"><<< На главную</a>
  </div>
</div>

<%@include file="../includes/footer.jsp" %>