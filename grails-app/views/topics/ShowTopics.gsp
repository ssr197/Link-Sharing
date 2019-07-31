

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
    <style>
    body{
        background: #555555;
    }
    </style>
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>

</head>
<body>
<div class="container"><br>

    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container col-md-12" style="background: #31b0d5">
                    <div class="col-md-5">
                        <h2 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h2>
                    </div>
                    <div class="col-md-7">
                        <table class="table">
                            <td width=200px>
                                <div class="input-group">
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

                                </div>
                            </td>
                            <td width=10px style="text-align:center;"}>
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"    data-target="#topicModal">
                                    <i class="material-icons">chat_bubble_outline</i></button>

                            </td>

                            <td width=30px style="text-align:center;"><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" style="caret-color: #48802c"   data-target="#invite"><i class="material-icons">
                                mail_outline
                            </i></button>
                            </td>

                            <td width=30px> <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#linkresource"><i class="material-icons" style="text-align:center;">
                                attach_file
                            </i></button>
                            </td>

                            <td width=30px><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#resource"><i class="material-icons" style="text-align:center;">description
                            </i></button>
                            </td>

                            %{-- <td width=40px style="text-align:right;"><i class="material-icons">face</i>
                             </td>--}%

                            <td>
                                <div class="dropdown" >
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${userdata.username}
                                        <span class="caret" onclick="display()" ></span></button>
                                    <ul class="dropdown-menu" id="droped" style="width: 100%">

                                        <g:if test="${userdata.admin==true}">
                                            <li class="dropdown-content">
                                                <li><a href="/users/openPageToChangeProfile">profile</a></li>
                                                <li><a href="/users/showList">Users</a></li>
                                                <li><a href="/topics/topicShow">Topic</a></li>
                                                <li><a href="/users/logout">Logout</a></li>
                                            </div>
                                        </g:if>
                                        <g:else>
                                            <div class="dropdown-content">
                                                <a href="/users/openPageToChangeProfile">profile</a>
                                                <a href="/users/logout">Logout</a>
                                            </div>
                                        </g:else>
                                    </ul>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    %{--THIS IS SHARE LINK OF TOPIC MODEL--}%

    <div class="modal fade"  id="linkresource" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
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
                        <br>
                        <br>
                        <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>

                    </g:uploadForm>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    %{--THIS IS SHARE DOCUMENT MODEL--}%
    <div class="modal fade"  id="resource" role="dialog">
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
        </div>
    </div>






    %{--<div class="modal fade"  id="resource" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Document</h4>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="Resources" action="saveDocument" class="topicForm">
                        Document *:
                        <input type="file" class="form-control" id="doc" placeholder="choose" name="document">
                        <br>
                        Description *:
                        <textarea class="form-control" id="select" name="select"></textarea>
                        <br>
                        <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topic" from="${subscriptions.topic.name}"  optionValue="value" />
                        <br>
                        <br>
                        <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>

                    </g:uploadForm>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>--}%

%{--Send Invite--}%
    <div class="modal fade" id="invite" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Send Invite To</h4>
                </div>
                <div class="modal-body">
                    <g:form controller="topic" action="addtopic" class="topicForm">
                        Email *:
                        <input class="form-control" type="text" name="topicName"/>
                        topic *:
                        <br>
                        <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topic" from="${subscriptions.topic.name}"  optionValue="value" />
                        <br><br>
                        <br><br>
                        <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                    </g:form>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>




    %{--CREATE TOPIC MODEL--}%
    <div class="modal fade" id="topicModal" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Create Topic</h4>
                </div>
                <div class="modal-body">
                    <g:form  controller="topics" action="addTopics" class="topicForm">
                        Name *:
                        <input class="form-control" type="text" name="topicName" id="topicName"/>
                        Visibility *:
                        <select class="form-control" id="select" name="selection">
                            <option>PUBLIC</option>
                            <option>PRIVATE</option>
                        </select>
                        <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                    </g:form>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5">

        <div class="panel panel-default" style="overflow: auto;height: 200px">
            <div class="panel-heading">${subs.topic.name}</div>

            <div class="panel-body">
                <div class="col-md-3">
                    <g:img src="${userdata.photo}"  style="width:60px;height:60px"/>
                </div>

                <div class="col-md-9">
                    <div><b>${subs.topic.name}</b>(${subs.topic.visibility})</div>

                    <div>@${subs.topic.createdBy.username}</div>

                    <div class="col-md-6">
                        Subscriptions:
                        <div>${subscount}</div></div>

                    <div class="col-md-3">

                        Posts:
                        <div><a>${postcount}</a></div></div>
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <a>Unsubscribe</a></div>

                    <div class="col-md-7">
                        <g:form controller="subscription" action="updateSeriouss">
                            <g:field type="hidden" name="id" value="${subs.id}"></g:field>
                            <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                      value="${subs.seriousness}" />
                        </g:form>

                    </div>
                </div>

            </div>
        </div>

        <div class="panel panel-default" style="overflow: auto;height: 300px">
            <div class="panel-heading"><div style="float:left">Users : ${subs.topic.name}</div>

                <div style="margin-left:350px">View all</div>
            </div>

            <div class="panel-body">
                <g:each in="${subscription}" var="us" status="i">

                    <div class="row">
                        <div class="col-md-4">
                            <asset:image src="${userdata.photo}" style="width:60px;height:60px"/></div>

                        <div class="col-sm-8">
                            <div style="font-size:23px;"><b>${us.user.firstName}&nbsp${us.user.lastName}</b></div>

                            <div>@${us.user.username}</div>

                            <div class="col-sm-6">
                                Subscriptions:
                                <div>${subscriptioncount.getAt(i)}</div></div>

                            <div class="col-sm-6">

                                Topics:
                                <div><a>${postscount.getAt(i)}</a></div></div>

                            <a>Unsubscribe</a></div></div>
                    <br>
                </g:each>
            </div>
        </div>
    </div>

    <div class="col-md-7">
        <div class="panel panel-default">
            <div class="panel-heading"><div style="float:left">Posts : ${subs.topic.name}</div>

                <div class="input-group" style="margin-left:350px">
                    <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>

                    <div class="input-group-btn">
                        <button class="btn btn-basic" type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </div>
            </div>

        <div class="panel-body">
            <g:each in="${resources}" var="res" status="i">
                <div class="row">
                    <div class="col-md-12">
                        %{--<asset:image src="${userdata.photo}" style="width:60px;height:60px"/>--}%
                    </div>

                    <div class="col-md-8">${res.description}<br>
                    <div class="row">
                    <div class="col-md-4">
                        <g:if test="${res instanceof newlinksharingapp.LinkResource}">
                            <a>Download</a>
                            </div>
                            <div class="col-md-4">

                                <a href="${res.url}">View Full Site</a>
                            </div>
                        </g:if>
                        <g:else>
                            <g:link controller="Document" action="download" params="[id:res.id , tid:subs.id]" >Download</g:link></div>
                            <div class="col-md-4">
                                <a href="${}">View Full Site</a>
                            </div>
                        </g:else>

                        <div class="col-md-3">
                            <g:link controller="Resource" action="index" params="[id:res.id]" >View post</g:link>
                        </div>
                    </div>
                </div>

                </div>
                </br>
            </g:each>
        </div>
    </div>
</div>
</div>
</body>
</html>

