<%@ page import="com.example.userRepository.UserRepository" %>
<%@ page import="com.example.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Mongo DB Connection</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
    }

    h1 {
      color: #333333;
      text-align: center;
    }

    form {
      max-width: 400px;
      margin: 20px auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="number"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #cccccc;
      border-radius: 3px;
    }

    input[type="radio"] {
      margin-right: 5px;
    }

    input[type="submit"] {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #ffffff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px auto;

    }

    th, td {
      padding: 10px;
      text-align: center;

    }

    th {
      background-color: #007bff;
      color: #ffffff;
    }

    tr:nth-child(even) {
      background-color: #b9c9f5;
    }

    .userListTable{
      width: 80%;
      margin: 0 auto;
    }
  </style>
</head>
<body>

<h1>User Information Form</h1>
<form method="post" action="./addUser.jsp">
  <label for="name">이름:</label>
  <input type="text" id="name" name="name" required>

  <label for="age">나이:</label>
  <input type="number" id="age" name="age" required>

  <label>성별:</label>
  <label for="male"><input type="radio" id="male" name="gender" value="male" required> Male</label>
  <label for="female"><input type="radio" id="female" name="gender" value="female" required> Female</label>

  <input type="submit" value="Submit">
</form>

<%
  UserRepository userRepository = new UserRepository();
  List<User> userList = userRepository.findUser();

  if (userList.size() > 0) {
%>
<div class ="userListTable">
<h2>User List</h2>
<table>
  <tr>
    <th>Name</th>
    <th>Age</th>
    <th>Gender</th>
  </tr>
  <%
    for(int i = 0; i < userList.size(); i++) {
      User user = userList.get(i);
  %>
  <tr <%= i % 2 == 0 ? "class=\"even\"" : "" %>>
    <td><%= user.getName() %></td>
    <td><%= user.getAge() %></td>
    <td><%= user.getGender() %></td>
  </tr>
  <%
    }
  %>
</table>
<%
  }
%>
</div>
</body>
</html>