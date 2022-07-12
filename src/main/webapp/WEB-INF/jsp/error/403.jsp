<!DOCTYPE html>
<html lang="en">
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>403 - Forbidden</title>
</head>
<body>

<h2>403 - Forbidden</h2>

<p>
You are not allowed to access this page
</p>

<p th:text="${error}">Error Info</p>
<p th:text="${status}">Status</p>

</body>
</html>