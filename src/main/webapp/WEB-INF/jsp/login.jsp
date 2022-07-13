<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%! String page_title="Log in with your account"; %>
<%@include file="includes/header.jsp" %>

<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="main-wrapper">
  <form method="POST" action="/login">
    <h2>Вход в систему</h2>
    <div class="form-row">
      <input name="username" type="text" placeholder="Логин"
             autofocus="true"/>
    </div>
    <div class="form-row">
      <input name="password" type="password" placeholder="Пароль"/>
    </div>
    <div class="form-row form-buttons-row">
      <button type="submit">Войти</button>
    </div>
    <div class="link-row">
      <a href="/registration">Зарегистрироваться >>></a>
    </div>
    <div class="link-row">
      <a href="/"><<< На главную</a>
    </div>

  </form>
</div>

<%@include file="includes/footer.jsp" %>