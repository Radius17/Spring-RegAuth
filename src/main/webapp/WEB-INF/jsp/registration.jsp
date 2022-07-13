<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%! String page_title="Регистрация"; %>
<%@include file="includes/header.jsp" %>

<div class="main-wrapper">
  <form:form method="POST" modelAttribute="userForm">
    <h2>Регистрация</h2>
    <div class="form-row">
      <form:input type="text" path="username" placeholder="Логин"
                  autofocus="true"></form:input>
      <form:errors path="username"></form:errors>
        ${usernameError}
    </div>
    <div class="form-row">
      <form:input type="password" path="password" placeholder="Пароль"></form:input>
    </div>
    <div class="form-row">
      <form:input type="password" path="passwordConfirm"
                  placeholder="Подтверждение пароля"></form:input>
      <form:errors path="password"></form:errors>
        ${passwordError}
    </div>
    <div class="form-row">
      <form:input type="text" path="nickname" placeholder="Ник"></form:input>
      <form:errors path="nickname"></form:errors>
        ${nicknameError}
    </div>
    <div class="form-row">
      <form:input type="phone" path="phone" placeholder="Телефон"></form:input>
      <form:errors path="phone"></form:errors>
        ${phoneError}
    </div>
    <div class="form-row">
      <form:input type="email" path="email" placeholder="E-mail"></form:input>
      <form:errors path="email"></form:errors>
        ${emailError}
    </div>
    <div class="form-row form-buttons-row">
      <button type="submit">Зарегистрироваться</button>
    </div>
  </form:form>
  <div class="link-row">
    <a href="/"><<< На главную</a>
  </div>
</div>

<%@include file="includes/footer.jsp" %>