<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page pageEncoding="UTF-8" import="com.davebsoft.sctw.ui.web.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Simple Twitter Client Friends and Followers Summary V0.1</title>
    <link href="main.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<h1>Simple Twitter Client Friends and Followers Summary V0.1</h1>

<p>Thank you for trying this early, experimental Simple Twitter Client web application,
which shows a summary of the people who follow you and those you follow.</p>
<img src="davehead-small.jpg" alt="Picture of Dave Briccetti"/><br/>
<p>Dave Briccetti, <a href="http://twitter.com/dcbriccetti">dcbriccetti</a></p>

<%
    final String userParm = request.getParameter("user");
    final String passwordParm = request.getParameter("password");
    if (userParm == null || passwordParm == null || 
            userParm.trim().length() == 0 || passwordParm.trim().length() == 0) {
%>

<p>Enter your Twitter user name and password, and push <b>Log In</b>. After some time,
probably less than a minute,
you should see a summary of your friends and followers. Your credentials will be used
only for the interaction with Twitter, and will not be stored. There is no error handling,
including for invalid credentials.</p>    

<form id="form" method="post" action="index.jsp">
    <table>
        <tr>
            <td><label for="user">User</label></td>
            <td><input type="text" id="user" name="user"/></td>
        </tr>
        <tr>
            <td><label for="password">Password</label></td>
            <td><input type="password" id="password" name="password"/></td>
        </tr>
    </table>
    
    <input type="submit" id="login" value="Log In" />
</form>

<%
    } else {
%>

<table class="usersTable">
    <tr>
        <th>Image</th>
        <th> </th>
        <th>Screen Name</th>
        <th>Name</th>
        <th>Location</th>
        <th>Description</th>
        <th>Status</th>
    </tr>
<% 
    Users users = new Users(); 
    Login login = new Login();
    login.setUser(userParm);    
    login.setPassword(passwordParm);
    users.setLogin(login);
    final UserRow[] userRows = users.getUsers();
    for (UserRow user: userRows) {
%>
<tr>    
<td><img alt="Thumbnail" height="48" width="48" src="<%= user.getPicUrl() %>"/></td>
<td><%= user.getArrows() %></td>
<td><%= user.getScreenName() %></td>
<td><%= user.getName() %></td>
<td><%= user.getLocation() %></td>
<td><%= user.getDescription() %></td>
<td><%= user.getStatus() %></td>
</tr>
<%
    }
%>
</table>

<%
    }
%>

</body>
</html>
