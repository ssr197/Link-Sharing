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
                                        <button class="btn btn-primary">Select</button>
                                        <g:if test="${userdata.admin}">
                                            <div class="dropdown-content">
                                                <a href="/users/openPageToChangeProfile">profile</a>
                                                <a href="/users/showUserList">Users</a>
                                                <a href="/topics/topicShow">topic</a>
                                                <a href="/users/logout">Logout</a>
                                            </div>
                                        </g:if>
                                        <g:else>
                                            <div class="dropdown-content">
                                                <a href="/users/openPageToChangeProfile">profile</a>
                                                <a href="/users/logout">Logout</a>
                                            </div>
                                        </g:else>
                                    </div>
                                </td>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            %{--Upload Link--}%
            <div class="modal fade"  id="uploadLink" role="dialog">
                %{--<div class="modal-dialog">
                    <!-- Upload Link content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Share Link</h4>
                        </div>
                        <div class="modal-body">
                            <g:uploadForm  controller="resources" action="saveLink" class="topicForm">
                                Link *:
                                <input type="text" class="form-control" id="linkres" placeholder="Link" name="linkres">
                                <br>
                                Description *:
                                <textarea class="form-control" id="selectlink" name="selectlink"></textarea>
                                <br>
                                <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topic" from="${subscriptions.topic.name}"  optionValue="value" />
                                <br><br>
                                <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>
                            </g:uploadForm>
                        </div>
                        <div class="modal-footer" style=" margin-top: 15px;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>--}%
            </div>

            %{--THIS IS SHARE DOCUMENT MODEL--}%
            <div class="modal fade"  id="uploadDocument" role="dialog">
                %{--<div class="modal-dialog">
                    <!-- Upload Document content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Share Document</h4>
                        </div>
                        <div class="modal-body">
                            <g:uploadForm  class="form-horizontal" controller="Resources" action="saveDocument" name="documentcreate" enctype="multipart/form-data">
                                Document *:
                                <input type="file" class="form-control" id="doc" placeholder="choose" name="document">
                                <br>
                                Description *:
                                <textarea class="form-control" id="select" name="select"></textarea>
                                <br>
                                <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topics" from="${subscriptions.topic.name}"  optionValue="value" />
                                <br><br>
                                <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>
                            </g:uploadForm>
                        </div>
                        <div class="modal-footer" style=" margin-top: 15px;">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>--}%
            </div>

            %{--CREATE TOPIC MODEL--}%
            <div class="modal fade" id="topicModal" role="dialog">
                %{--<div class="modal-dialog">
                    <!-- topic Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create Topic</h4>
                        </div>
                        <div class="modal-body">
                            <g:form controller="topics" action="addTopics" class="topicForm">
                                Name *:
                                <input class="form-control" type="text" name="topicName"/>
                                Visibility *:
                                <select class="form-control" name="selection">
                                    <option>PUBLIC</option>
                                    <option>PRIVATE</option>
                                </select>
                                <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                            </g:form>
                        </div>
                        <div class="modal-footer" style=" margin-top: 15px;">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>--}%
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
                                <div class="row">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-2">
                                        <g:if test="${resource.createdBy.email==session.name}">
                                            <div><g:link controller="resource" action="delete" params="[id:resource.id]">Delete</g:link></div>
                                            <div class="col-md-2"><a>Edit</a></div>
                                        </g:if>
                                        <g:else>
                                            <div><a>Delete</a></div>
                                            <div class="col-md-2"><a>Edit</a></div>
                                        </g:else>
                                    </div>
                                    <div class="col-md-2"><g:link controller="Document" action="download" params="[id:resource.id]">Download</g:link></div>
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
                                                %{--<div>${countforsubs.getAt(i)}</div>--}%
                                            </div>
                                            <div class="col-sm-6">
                                                Posts:<br>${countforposts.getAt(i)}
                                                %{--<div><a>${countforposts.getAt(i)}</a></div>--}%
                                            </div><br><br><hr>
                                        </div>
                                        %{--<a>subscribe</a>--}%
                                    </div>

                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
        </div>

%{--
        <script>
            function Rating(username , resourceId , value) {
                console.log("inside")
                for(var i=1;i<=5;i++) {
                    document.getElementById(i).style.color="black";
                }
                for(var i=1;i<=value;i++) {
                    document.getElementById(i).style.color="red";
                }
                console.log("above ajax")
                $.ajax({
                    "url":     url,
                    "type":    "get",
                    "data":    {username : username , resourceId : resourceId , value : value},
                    success: function(resp){
                        document.getElementById("test").innerHTML=resp.success
                    }
                });
            }
            function Ratingsprint(value) {
                for(var i=1;i<=5;i++) {
                    document.getElementById(i).style.color="black";
                }
                for(var i=1;i<=value;i++) {
                    document.getElementById(i).style.color="orange";
                }
            }
        </script>
            --}%
    </body>
</html>