<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        body{
            background: #5D5C61;
        }
    </style>
</head>

<body>
    <div class="container"><br>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container col-md-12"style="background: #5bc0de" >
                        <div class="col-md-3">
                            <h1>
                                <a href="#">
                                    <strong>
                                        <u><b>Link Sharing</b></u>
                                    </strong>
                                </a>
                            </h1>
                        </div>
                        <div class="col-md-9">
                            <table class="table">
                                <td width=200px>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                                        <div class="input-group-btn">
                                            <button class="btn btn-basic" type="submit">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td width=20px style="text-align:center;">
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" data-target="#topicModal">
                                        <i class="material-icons">chat_bubble_outline</i>
                                    </button>
                                </td>
                                <td width=20px style="text-align:center;">
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" data-target="#invite">
                                        <i class="material-icons">mail_outline</i>
                                    </button>
                                </td>
                                <td width=20px>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" data-target="#uploadLink">
                                        <i class="material-icons" style="text-align:center;">attach_file</i>
                                    </button>
                                </td>
                                <td width=20px>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" data-target="#uploadDocument">
                                        <i class="material-icons" style="text-align:center;">description</i>
                                    </button>
                                </td>
                                <td width=40px>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="" data-target="">
                                        <i class="photo" style="text-align:center;">${userdata.photo}</i>
                                    </button>
                                </td>
                                <td width=30px>
                                    <div class="dropdown" >
                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${userdata.username}
                                            <span class="caret" onclick="display()"></span>
                                        </button>
                                        <ul class="dropdown-menu" id="drop">
                                            <li><a href="#">profile</a></li>
                                            <li><a href="/users/showUserList">Users</a></li>
                                            <li><a href="#">topic</a></li>
                                            <li><a href="/users/logout">Logout</a></li>
                                        </ul>
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
                    %{--<div class="panel panel-default">--}%
                    <div class="panel panel-default">
                        <div class="panel-body" >
                            <table  style="width:100%">
                                <tr>
                                    <td rowspan="4" colspan="3" width="10%">
                                        <asset:image src="grails-app/assets/images/{userdata.username}.png" height="100px" width="90px" style="margin-right: 10px;"/>
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
                                    <td width=150px>${sessionCountNumber}</td>
                                    <td width=150px>${topicCount}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="container"><br>
                        <!-- All the code above this, I have already -->
                        <!-- for left pannel elements -->
                        <div class="row">
                            <div class="col-md-5">

                                <!--subscription Modal-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div style="float:left">Subscriptions</div>
                                        <div style="margin-left:350px">View all</div>
                                    </div>
                                    <div class="panel-body">
                                    <g:each in="${subscriptions}" var="us" status="i">
                                        <li>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <asset:image src="https://i.stack.imgur.com/l60Hf.png" style="width:60px;height:60px"/>
                                                </div>
                                                <div class="col-sm-8">
                                                    <div style="font-size:23px;">
                                                        <g:link controller="dashboard" action="index" params="[id: us.id]">${us.topic.name}
                                                        </g:link>
                                                    </div>




                                                    <div>@${us.topic.user.username}</div>
                                                    <div>@${us.topic.user.username}</div>



                                                    <div class="col-sm-6">
                                                        Subscriptions:
                                                        <div>${subscount.getAt(i) }</div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        Posts: <div><a>${resourcecount.get(i)}</a></div>
                                                    </div>
                                                    <a>Unsubscribe</a>
                                                </div>
                                            </div>
                                            <g:if test  = "${us.topic.user.email==session.name}" >
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <ul class="list-inline">
                                                            <li>
                                                                <g:form controller="subscription" action="updateSerious">
                                                                    <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                    <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                                          value="${us.seriousness}" />
                                                                </g:form>
                                                            </li>
                                                            <li>
                                                                <g:form controller="topic" action="updateVisibility">
                                                                    <g:field type="hidden" name="id" value="${us.topicId}"></g:field>
                                                                    <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                                          value="${us.topic.visibility}" />
                                                                </g:form>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <g:form controller="subscription" action="updateSerious">
                                                    <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                    <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                          value="${us.seriousness}" />
                                                </g:form>
                                            </g:else>
                                        </li>
                                </g:each>
                            </div>
                        </div>

                        <!--Trending topic List-->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div style="float:left">Trending topic</div>
                                <div style="margin-left:350px">View all</div>
                            </div>
                            <div class="panel-body">
                                <g:each in="${trending}" var="us" status="i">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <img src="images.jpeg"/>
                                            </div>
                                            <div class="col-sm-8">
                                                <div style="font-size:23px;"><b>${us.name}</b></div>
                                                <div>@${user.username}</div>
                                                <div class="col-sm-6">
                                                    Subscriptions:
                                                    <div>2</div>
                                                </div>
                                                <div class="col-sm-6">
                                                    Posts:
                                                    <div><a>2</a></div>
                                                </div>
                                            </div>
                                            <a>Unsubscribe</a>
                                        </div>
                                    </li>
                                </g:each>
                            </div>
                            <script>
                                function show()
                                {
                                    document.getElementById("drop").style.display="block";
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>

    <!-- this is for right side pannel -->
        <div class="col-md-7">
            %{--inbox--}%
            <div class="panel panel-default">
                <div class="panel-heading">Inbox</div>
                <div class="panel-body">
                    <table style="width:100%" >
                        <tr>
                            <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
                            <td width=400px class="text">Inbox</td>
                            <td width=150px class="text-muted">@inbox</td>
                            <td width=150px></td>
                            <td width=150px></td>
                            <td width=150px>
                                <a href="#"><small>Grails</small></a></td>
                        </tr>
                        <tr>
                            <td colspan="5" height=100px>Inbox Message will come here</td>
                        </tr>
                        <tr>

                            <td>Links</td>
                            <td><a href="#"><small><u>Downloads</u></small></a></td>
                            <td width=250px><a href="#"><small><u>View Full Site</u></small></a></td>
                            <td width=250px><a href="#"><small><u>Mark as read</u></small></a></td>
                            <td><a href="#"><small><u>View Post</u></small></a></td>
                        </tr>
                    </table>
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
                    <h4 class="modal-title">Send Invite To</h4>
                </div>
                <div class="modal-body">
                    <g:form controller="topic" action="addtopic" class="topicForm">
                        Email *:
                        <input class="form-control" type="text" name="topicName"/>
                        topic *:
                        <select class="form-control" name="selection">
                            <option>Option-1</option>
                            <option>Option-2</option>
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





            %{--Upload Link--}%
    <div class="modal fade" id="uploadLink" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="panel panel-default">
                    <div class="panel-heading">Share Link</div>
                    <div class="panel-body">
                        <g:form class="form-horizontal">
                            <div class="form-group">
                                <text class="control-label col-md-2" for="email" style="text-align: left;">Document *</text>
                                <div class="col-md-10">
                                    <div class="col-md-8">
                                        <input type="url" class="form-control" id="url" placeholder="paste/write link here" name="inputphoto">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <text class="control-label col-md-2" for="desc" style="text-align: left;">Description*</text>
                                <div class="col-md-10">
                                    <textarea type="text" class="form-control" id="urlDescription" placeholder="description" name="docdesc">
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <text class="control-label col-md-2" for="email" style="text-align: left;">Topic *</text>
                                <div class="dropdown  col-md-10"  >
                                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" >Topic
                                        <span class="caret" ></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">About Us</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class=" col-md-8">
                                    <div class="col-md-offset-8">
                                        <button type="submit" class="btn btn-success" width=100%>Share</button>
                                    </div>
                                </div>
                            </div>
                        </g:form>
                        <div class="modal-footer" style=" margin-top: 15px;">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


   %{--Upload Document--}%
    <div class="modal fade" id="uploadDocument" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="panel panel-default">
                    <div class="panel-heading">Share Document ( Pop up)</div>
                    <div class="panel-body">
                        <g:form class="form-horizontal">
                            <div class="form-group">
                                <text class="control-label col-md-2" for="email" style="text-align: left;">Document *</text>
                                <div class="col-md-10">
                                    <div class="col-md-8">
                                        <input type="file" class="form-control" id="Document" placeholder="choose" name="inputphoto">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <text class="control-label col-md-2" for="desc" style="text-align: left;">Description*</text>
                                <div class="col-md-10">
                                    <textarea type="text" class="form-control" id="docdesc" placeholder="description" name="docdesc">
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <text class="control-label col-md-2" for="email" style="text-align: left;">Topic *</text>
                                <div class="dropdown  col-md-10"  >
                                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" >Topic
                                        <span class="caret" ></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">About Us</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class=" col-md-8">
                                    <div class="col-md-offset-8">
                                        <button type="submit" class="btn btn-success" width=100%>Share</button>
                                    </div>
                                </div>
                            </div>
                        </g:form>
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
                    <g:form controller="topic" action="addtopic" class="topicForm">
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
    var resetTopicForm = function () {
        $(".topicForm").trigger("reset");
    }
</script>
</body>
</html>