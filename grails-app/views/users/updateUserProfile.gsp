<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 29/7/19
  Time: 12:40 PM
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="grails.util.Holders"%>
<!doctype html>
<html>
    <head>
        <script>
            function display(){
                document.getElementById("droped").style.display="block";
            }
        </script>

        <style>
        body{
            background: #5D5C61;
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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    </head>
    <body>
    <div>
        <div class="container"><br>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="container col-md-12" style="background: #5bc0de">
                            <div class="col-md-5">
                                <h2><a href="/dashboard/dashboard"><strong> <u><b>Link Sharing</b></u></strong></a></h2>
                            </div>
                            <div class="col-md-7">
                                <table class="table">

                                    <div class="container col-md-10">
                                        <br><br>
                                    </div>
                                    <div class="col-md-2">
                                        <br>

                                        <td width=30px>
                                            <div class="dropdown" style="float: right">
                                                <button class="btn btn-primary">Select</button>
                                                <g:if test="${session.isAdmin}">
                                                    <div class="dropdown-content">
                                                        <a href="/dashboard/dashboard">Back</a>
                                                        <a href="/users/showUserList">Users</a>
                                                        <a href="#">topic</a>
                                                        <a href="/users/logout">Logout</a>
                                                    </div>
                                                </g:if>
                                                <g:else>
                                                    <div class="dropdown-content">
                                                        <a href="/users/openPageToChangeProfile">profile</a>
                                                        %{--<a href="/users/showUserList">Users</a>--}%
                                                        %{--<a href="#">topic</a>--}%
                                                        <a href="/users/logout">Logout</a>
                                                    </div>
                                                </g:else>
                                            </div>
                                        </td>

                                        %{--<button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown">select
                                            <span class="caret" onclick="display()"></span>
                                        </button>
                                        <ul class="dropdown-menu" id="drop">
                                            <li><a href="/dashboard/dashboard">Back</a></li>
                                            <li><a href="/users/showUserList">Users</a></li>
                                            <li><a href="#">topic</a></li>
                                            <li><a href="/users/logout">Logout</a></li>
                                        </ul>--}%
                                    </div>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- This is the left side of the web Page which is empty for now -->
            <div class="col-md-7">
                <br><br><br><br><br><br><br><br>
            </div>

            <!-- write here for left column pannels-->
            <!-- right side pannel elements starts here-->
            <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading">Profile</div>
                    <div class="panel-body">
                        <g:form class="form-horizontal"  controller="users" action="updateProfile" enctype="multipart/form-data">
                            <div class="form-group">
                                <text class="control-label col-md-4" for="email" style="text-align: left;">First Name *</text>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="fname" placeholder="Enter firstname" name="fname">
                                </div>
                            </div>
                            <div class="form-group">
                                <text class="control-label col-md-4" for="email" style="text-align: left;">Last Name *</text>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="lname" id="lname" placeholder="Enter lname" >
                                </div>
                            </div>
                            <div class="form-group">
                                <text class="control-label col-md-4" for="email" style="text-align: left;">Username *</text>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="username" name="uname" placeholder="Enter Username" >
                                </div>
                            </div>

                            <div class="form-group">
                                <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                                <div class="col-md-8">
                                    <input type="file" class="form-control" id="inputphoto" placeholder="choose" name="inputphoto">
                                </div><br><br>
                            </div>

                            <div class="form-group">
                                <div class=" col-md-8"></div>
                                <div class=" col-md-4">
                                    <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">Change Password</div>
                    <div class="panel-body">
                        <g:form class="form-horizontal"  controller="users" action="updatePassword" >

                            <div class="form-group">
                                <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>
                                <div class="col-md-8">
                                    <input type="password" class="form-control" id="email1" placeholder="Password" name="newpassword">
                                </div>
                            </div>
                            %{--<div class="form-group">
                                <text class="control-label col-md-4" for="pwd" style="text-align: left;">ConfirmPassword*</text>
                                <div class="col-md-8">
                                    <input type="password" class="form-control" id="email" placeholder="Confirm password" name="confirmpass">
                                </div>
                            </div>--}%
                            <div class="form-group">
                                <div class=" col-md-8"></div>
                                <div class=" col-md-4">
                                    <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>

        </div>
    </div>
    </body>
</html>

