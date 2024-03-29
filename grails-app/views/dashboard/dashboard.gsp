<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <style>
            body{
                background: #b2b2b2;
                /*background: #5D5C61;*/
            }
        </style>
        <title>Home Page</title>

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
            <div class="row">
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
                                        <span><p>${flash.message3}</p></span>
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
                                                    <a href="/users/openPageToChangeProfile">profile</a>
                                                    <a href="/users/showUserList">Users</a>
                                                    <a href="/topics/topicShow">topic</a>
                                                    <a href="/resources/showPostList">posts</a>
                                                    <a href="/users/logout">Logout</a>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <div class="dropdown-content">
                                                    <a href="/users/openPageToChangeProfile">profile</a>
                                                    <a href="/resources/showPostList">posts</a>
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

                <!-- for left pannel elements -->
                <div class="row">
                    <div class="col-md-5">
                        %{--user details panel--}%
                        <div class="panel panel-default">
                            <div class="panel-body" >
                                <table  style="width:100%">
                                    <tr>
                                        <td rowspan="4" colspan="3" width="10%">
                                            <asset:image src="${userdata.photo}" height="100px" width="90px" style="margin-right: 10px;"/>
                                        </td>
                                        <td width=200px class="text" colspan="3">${userdata.firstName} ${userdata.lastName}</td>
                                    </tr>
                                    <tr>
                                        <td width=150px class="text-muted" colspan="3">@${userdata.username}</td>
                                    </tr>
                                    <tr>
                                        <td width=150px>Subscriptions</td>
                                        <td width="150px">topic</td>
                                    </tr>
                                    <tr>
                                        <td width=150px>${count_subscribe}</td>
                                        <td width=150px>${count_topic}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="container"><br>
                            <!-- for left pannel elements -->
                            <div class="row">
                                <div class="col-md-5">

                                    <!--subscription Modal-->
                                        <div class="panel panel-default" style="overflow: auto; height: 400px">
                                            <div class="panel-heading">
                                                <div style="float:left">Subscriptions</div>
                                                <div style="float:right">@${userdata.username}</div><br>
                                            </div>
                                            <div class="panel-body">
                                                <g:each in="${subscriptions}" var="us" status="i">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asset:image src="${us.topic.createdBy.photo}" style="width:60px;height:60px"/>
                                                            </div>
                                                            <div class="col-sm-8">
                                                                <div style="font-size:23px;">
                                                                    <g:link controller="topics" action="viewTopics" params="[id: us.id]">${us.topic.name}</g:link></div>
                                                                <div>@${us.topic.createdBy.username}</div>
                                                                <div class="col-sm-6">
                                                                    Subscriptions:
                                                                    <div>${subscount.getAt(i) }</div></div>
                                                                <div class="col-sm-6">
                                                                    Posts:
                                                                    <div><a>${resourcecount.get(i)}</a></div>
                                                                </div>
                                                    <g:link controller="Subscriptions" action="unsubscribe" params="[id:us.id, page :'dashboard']">Unsubscribe</g:link></div></div>
                                                        <g:if test  = "${us.topic.createdBy.email==session.name}" >
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <ul class="list-inline">
                                                                        <li>
                                                                            <g:form controller="subscriptions" action="updateSerious">
                                                                                <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                                <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                                                          value="${us.seriousness}" />
                                                                            </g:form>
                                                                        </li>
                                                                        <li>
                                                                            <g:form controller="subscriptions" action="updateVisibility">
                                                                                <g:field type="hidden" name="id1" value="${us.topicId}"></g:field>
                                                                                <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                                                          value="${us.topic.visibility}" />
                                                                            </g:form>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </g:if>
                                                        <g:else>
                                                            <g:form controller="subscriptions" action="updateSerious">
                                                                <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                                          value="${us.seriousness}" />
                                                            </g:form>
                                                        </g:else>
                                                </g:each>
                                            </div>
                                        </div>
                                    %{--Trending topic List--}%
                                    <div class="panel panel-default" style="overflow: auto; height: 500px">
                                        <div class="panel-heading">
                                            <div style="float:left">Trending Topics</div>
                                            <div style="float: right">@${userdata.username}</div><br>
                                        </div>
                                        <div class="panel-body">
                                            <div class="card-horizontal">
                                                <g:each in="${trending}" var="us" status="i">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asset:image src="${us.createdBy.photo}" alt="photo here" style="width:70px;height:70px"/>
                                                            </div>
                                                            <div class="col-sm-8">
                                                                <div style="font-size:23px;"><b>${us.name}</b></div>
                                                                <div>
                                                                    <g:if test="${us.subscribedTo.user.email.contains(session.name)}">
                                                                        <g:link controller="Subscriptions" action="unsubscribe" params="[id:us.id, page :'dashboard']">Unsubscribe</g:link><br>

                                                                    </g:if>

                                                                    <g:else>
                                                                        <g:link controller="Subscriptions" action="subscribe" params="[id:us.id, page:'dashboard']">Subscribe</g:link><br>

                                                                    </g:else>
                                                                        @${us.createdBy.username}
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    Subscriptions:
                                                                    <div>${us.subscribedTo.size()}</div></div>
                                                                <div class="col-sm-6">
                                                                    Posts:
                                                                    <div><a>${us.resource.size()}</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </g:each>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>

        <!-- this is for right side pannel -->
                <div class="col-md-7">
                %{--Flash message 2--}%
                    <div class="col-md-12">
                    <span>${flash.message2}</span>
                    </div>
                    %{--inbox--}%
                    <div class="panel panel-default col-md-12">
                        <div class="panel-heading">
                            <div style="float:left">Inbox</div>
                            <br>
                        </div>
                        <div class="panel-body">
                            <g:each in="${resources}" var="res" status="i">
                                <div class="col-md-4"><asset:image src="${res.createdBy.photo}"  style="width:70px;height:70px; float: left"/></div>
                                <div class="col-sm-8">
                                    <div class="row"><h3><a class=col-sm-3>${res.topic.name}</a></h3><br><p>@${res.createdBy.username}</p></div>
                                    <div class="row">${res.description}</div><br>
                                    <div class="row">
                                        <table>
                                            <div class="col-md-3">
                                                <td width="200px"style="color: #2b542c">
                                                    <div>
                                                        <g:if test="${res.hasProperty("filePath")}">
                                                            <g:link controller="resources" action="downloadFile" params="[id:res.id , tid:res.id , flag:1]">Download</g:link>
                                                        </g:if>
                                                        <g:else>
                                                            <a href="${res.url}" target="_blank">Open Link</a>
                                                        </g:else>
                                                    </div>
                                                </td>
                                                <td width="250px" style="color: #761c19">
                                                    <div>
                                                        <g:link controller="dashboard" action="markAsRead" params="[identifier:res.id, email:session.name]">Mark as read</g:link>
                                                    </div>
                                                </td>
                                                <td width="250px" style="color: #2b542c;">
                                                    <div>
                                                        <g:link controller="resources" action="index" params="[id: res.id]">View post</g:link>
                                                    </div>
                                                </td>
                                            </div>
                                        </table>
                                    </div><hr>
                                </div>
                                <br>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
    %{--From here, All are pop-ups--}%
        %{--Send Invite--}%
                <div class="modal fade" id="invite" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Send Invitation</h4>
                            </div>
                            <div class="modal-body">
                                <g:form class="form-horizontal" controller="sendingLink" action="sendInvite" name="invitation">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Email</div>
                                        <div class="col-sm-10">
                                            <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-8" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-10">
                                            <g:select name="topicName" from="${subscriptions.topic.name}" class="dropdown-toggle btn btn-default col-sm-8"></g:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">Send</button>
                                        </div>
                                    </div>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
                %{--Upload Link--}%
                <div class="modal fade"  id="uploadLink" role="dialog">
                    <div class="modal-dialog">
                        <!-- Upload Link content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Share Link</h4>
                            </div>
                            <div class="modal-body">
                                <g:uploadForm  controller="resources" action="saveLink" class="topicForm">
                                    Link *:
                                    <input type="url" class="form-control" required id="linkres" placeholder="Link" name="linkres">
                                    <br>
                                    Description *:
                                    <textarea class="form-control" required id="selectlink" name="selectlink"></textarea>
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
                    </div>
                </div>
            </div>
       %{--Upload Document--}%
            <div class="modal fade"  id="uploadDocument" role="dialog">
                <div class="modal-dialog">
                    <!-- Upload Document content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Share Document</h4>
                        </div>
                        <div class="modal-body">
                            <g:uploadForm  class="form-horizontal" controller="Resources" action="saveDocument" name="documentcreate" enctype="multipart/form-data">
                                Document *:
                                <input type="file" class="form-control" required id="doc" placeholder="choose" name="document">
                                <br>
                                Description *:
                                <textarea class="form-control" required id="select" name="select"></textarea>
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
                </div>
            </div>
        </div>
        </div>
        <!-- create topic-->
                        <div class="modal fade" id="topicModal" role="dialog">
                            <div class="modal-dialog">
                                <!-- topic Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Create Topic</h4>
                                    </div>
                                    <div class="modal-body">
                                        <g:form controller="topics" action="addTopics" class="topicForm">
                                            Name *:
                                            <input class="form-control" required type="text" name="topicName"/>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
            <script>
                function display(){
                    document.getElementById("drop").style.display="block";
                }
            </script>
    </body>
</html>