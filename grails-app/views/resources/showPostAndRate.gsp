<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 1/8/19
  Time: 12:26 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script>
            function display(){
                document.getElementById("droped").style.display="block";
            }
        </script>
        <g:javascript>
        var url="${createLink(controller:'ResourceRating',action:'save')}"
        </g:javascript>
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


    </head>

    <body>
        <div class="container"><br>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container col-md-12"style="background: #5bc0de" >
                        <div class="col-md-3"><h1><a href="#"><strong><u><b>Link Sharing</b></u></strong></a></h1></div>
                        <div class="col-md-9">
                            <table class="table">
                                <td width=200px>
                                    <g:form controller="search" action="search">
                                        <div class="input-group">
                                            <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-basic" type="submit">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </g:form>
                                </td>
                                <td width=20px style="text-align:center;">
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="New Topic" data-target="#topicModal">
                                        <i class="material-icons">chat_bubble_outline</i>
                                    </button>
                                </td>
                                <td width=20px style="text-align:center;">
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="Send Invite" data-target="#invite">
                                        <i class="material-icons">mail_outline</i>
                                    </button>
                                </td>
                                <td width=20px>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="Upload Link" data-target="#uploadLink">
                                        <i class="material-icons" style="text-align:center;">attach_file</i>
                                    </button>
                                </td>
                                <td width=20px>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="Upload Document" data-target="#uploadDocument">
                                        <i class="material-icons" style="text-align:center;">description</i>
                                    </button>
                                </td>


                                <td width=40px>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="" data-target="">
                                        <i class="photo" style="text-align:center;">
                                            <asset:image src="${userdata.photo}" height="25px" width="20px"/>
                                        </i>
                                    </button>
                                </td>
                                <td width=30px>
                                    <div class="dropdown">
                                        <button class="btn btn-primary">${userdata.username}</button>
                                        <g:if test="${userdata.admin}">
                                            <div class="dropdown-content">
                                                <a href="/users/openPageToChangeProfile">profile</a></li>
                                                <a href="/users/showUserList">Users</a></li>
                                                <a href="/topics/topicShow">topic</a></li>
                                                <a href="/users/logout">Logout</a></li>
                                            </div>
                                        </g:if>
                                        <g:else>
                                            <div class="dropdown-content">
                                                <li><a href="/users/openPageToChangeProfile">profile</a></li>
                                                <li><a href="/users/logout">Logout</a></li>
                                            </div>
                                        </g:else>
                                    </div>
                                </td>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            </div>

            %{--Above this is DashBoard Setting--}%

            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2"><asset:image src="${resource.createdBy.photo}" style="width:70px;height:70px"/></div>
                                    <div class="col-md-6">
                                        <div style="font-size:18px;"><b>${resource.createdBy.firstName}&nbsp${resource.createdBy.lastName}</b></div>
                                        <div>@${resource.createdBy.username}</div>
                                    </div>
                                    <div class="col-md-4">
                                        <div><g:link controller="topic" action="index" params="[id: resource.topic.id]">${resource.topic.name}</g:link><br></div>
                                        <div>${resource.dateCreated}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-9">${resource.description}</div>
                                    <div class="col-md-3">
                                        <span id="1" onclick="Rating('${session.name}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                                        <span id="2" onclick="Rating('${session.name}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                                        <span id="3" onclick="Rating('${session.name}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                                        <span id="4" onclick="Rating('${session.name}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                                        <span id="5" onclick="Rating('${session.name}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div><br><br><br>
                                <p id="test"></p>
                                <div class="row col-md-8">
                                    <div>
                                        <g:if test="${resource.createdBy.email==session.name}">
                                            <div class="col-md-4"><g:link controller="dashboard" action="deletePost" params="[id:resource.id]">Delete</g:link></div>
                                            <div class="col-md-4"><g:link controller="resource" action="delete" params="[id:resource.id]">  Edit</g:link></div>
                                        </g:if>
                                        <g:else>
                                            <div class="col-md-4">Delete</div>
                                            <div class="col-md-4">Edit</div>
                                        </g:else>
                                    </div>
                                    <div class="col-md-4">
                                        <g:if test="${resource instanceof newlinksharingapp.DocumentResource}">
                                            <g:link controller="resources" action="downloadFile" params="[id:resource.id]">Download</g:link>
                                        </g:if>
                                        <g:else>
                                            <a href="${resource.url}">Open Link</a>
                                        </g:else>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class ="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">Trending Topics
                        </div>
                        <div class="panel-body">
                            <g:each in="${trending}" var="us" status="i">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asset:image src="${us.createdBy.photo}"  style="width:70px;height:70px"/></div>
                                        <div class="col-sm-8">
                                            <div style="font-size:23px;"><b>${us.name}</b></div>
                                            <div><a>subscribe</a></div>
                                            <div>@${us.createdBy.username}</div>
                                            <div class="col-sm-6">
                                                Subscriptions:<br>${countforsubs.getAt(i)}
                                            </div>
                                            <div class="col-sm-6">
                                                Posts:<br>${countforposts.getAt(i)}
                                            </div><br><br><hr>
                                        </div>
                                    </div>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>