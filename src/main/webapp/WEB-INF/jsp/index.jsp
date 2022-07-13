<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%! String page_title="Главная"; %>
<%@include file="includes/header.jsp" %>

<div class="main-wrapper">

  <h1>Танцуют все ! ©</h1>
  <fieldset>
    <legend>Панель управления</legend>
    <sec:authorize access="!isAuthenticated()">
      <h4><a href="/login">Войти</a></h4>
      <h4><a href="/registration">Зарегистрироваться</a></h4>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <h3>Здравствуйте, ${pageContext.request.userPrincipal.name} !</h3>
      <h4><a href="/profile">Профиль</a></h4>
      <sec:authorize access="hasRole('ADMIN')">
        <h4><a href="/admin/users">Пользователи</a></h4>
      </sec:authorize>
      <h4><a href="/logout">Выйти</a></h4>
    </sec:authorize>
  </fieldset>
  <fieldset>
    <legend>Пробные ссылки</legend>
    <h4><a href="/profile">Профиль (только пользователи)</a></h4>
    <h4><a href="/admin/users">Пользователи (только админ)</a></h4>
  </fieldset>
</div>

<%@include file="includes/footer.jsp" %>