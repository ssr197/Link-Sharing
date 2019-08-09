<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 6/8/19
  Time: 6:55 PM
--%>

<%@ page import="newlinksharingapp.LinkResource; newlinksharingapp.Users" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
    <style>
    .topnav {
        overflow: hidden;
        background-color: #333;
        height: 53px;
    }
    .topnav a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }
    .topnav a:hover {
        background-color: #ddd;
        color: black;
    }
    .topnav a.active {
        background-color: #4CAF50;
        color: white;
    }
    .topnav .search-container {
        float: right;
    }
    .topnav input[type=text] {
        padding: 6px;
        margin-top: 8px;
        font-size: 17px;
        border: none;
    }
    .topnav .search-container button {
        float: right;
        padding: 6px 10px;
        margin-top: 8px;
        margin-right: 16px;
        background: #ddd;
        font-size: 17px;
        border: none;
        cursor: pointer;
    }
    .topnav .search-container button:hover {
        background: #ccc;
    }
    .topnav .search-container button {
        height: 36px;
    }
    body{
        background: #b2b2b2;
    }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    .dropbtn {
        background-color: #4CAF50;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }
    .dropdown {
        position: relative;
        display: inline-block;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-content a:hover {background-color: #ddd;}
    .dropdown:hover .dropdown-content {display: block;}
    .dropdown:hover .dropbtn {background-color: #3e8e41;}
    </style>
</head>
<body>
<div class="container" style="padding-top: 20px">
    <div class="panel panel-default" style="height:70px; background: #5bc0de">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-10">
                    <h3><a href="/dashboard/dashboard"><strong><u>Link Sharing</u></strong></a></h3>
                </div>
                <div class="col-md-2">
                    <div class="dropdown">
                        <button class="btn btn-success">Select</button>
                        <div class="dropdown-content">
                            <a href="/dashboard/dashboard">Back</a>
                            <a href="/users/openPageToChangeProfile">profile</a>
                            <a href="/users/showUserList">Users</a>
                            <a href="/users/logout">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table id="example" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Description</th>
            <th>Type</th>
            <th>Topicname</th>
            <th>createdBy</th>
            <th>Visibility</th>
            <g:if test="${userdata.admin}">
                <th>Manage</th>
            </g:if>
        </tr>
        </thead>
        <tbody>
        <g:each var="resource" in="${allPostList}">
            <tr>
                <td>${resource.id}</td>
                <td>${resource.description}</td>
                <td>
                    <g:if test="${resource instanceof newlinksharingapp.LinkResource}">Link</g:if>
                    <g:else>Document</g:else>
                </td>
                <td>${resource.topic.name}</td>
                <td>${resource.createdBy.firstName}</td>
                <td>${resource.topic.visibility}</td>
                <g:if test="${userdata.admin}">
                    <td><button class="btn btn-warning"><g:link controller="dashboard" action="deletePost" params="[id:resource.id]">Delete</g:link></button></td>
                </g:if>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
        console.log("hi")
    } );
</script>
</body>
</html>