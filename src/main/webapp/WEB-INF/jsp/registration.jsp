<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%! String page_title="Регистрация"; %>
<%@include file="includes/header.jsp" %>

<div>
  <form:form method="POST" modelAttribute="userForm">
    <h2>Регистрация</h2>
    <div>
      <form:input type="text" path="username" placeholder="Username"
                  autofocus="true"></form:input>
      <form:errors path="username"></form:errors>
        ${usernameError}
    </div>
    <div>
      <form:input type="password" path="password" placeholder="Password"></form:input>
    </div>
    <div>
      <form:input type="password" path="passwordConfirm"
                  placeholder="Confirm your password"></form:input>
      <form:errors path="password"></form:errors>
        ${passwordError}
    </div>
    <div>
      <form:input type="text" path="nickname" placeholder="Nickname"></form:input>
      <form:errors path="nickname"></form:errors>
        ${nicknameError}
    </div>
    <div>
      <form:input type="phone" path="phone" placeholder="Phone"></form:input>
      <form:errors path="phone"></form:errors>
        ${phoneError}
    </div>
    <div>
      <form:input type="email" path="email" placeholder="E-mail"></form:input>
      <form:errors path="email"></form:errors>
        ${emailError}
    </div>
    <button type="submit">Зарегистрироваться</button>
  </form:form>
  <a href="/">Главная</a>
</div>

<%@include file="includes/footer.jsp" %>