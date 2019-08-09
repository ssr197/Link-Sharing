<%@ page import="newlinksharingapp.Resources" %>
<!doctype html>
<html>
<head>
    <asset:javascript src="MatchPassword.js"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <style>
    body {
        background: #b2b2b2;
    }
    </style>

    <title>Link Sharing</title>

</head>

<body>
<div class="container col-md-12"><br>

    <div class="panel panel-default col-md-12" style="background: #5bc0de">
        <div class="panel-body col-md-12">
            <div class="container col-md-12">
                <div class="col-md-8">
                    <h2><a href="#"><b>Link Sharing</b></a></h2>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6" style="float: left">
            <div class="panel panel-default">
                <div class="panel-heading">Recent shares</div>

                <div class="panel-body" style="height:350px;overflow: auto;">
                    <g:each in="${resources}" var="res" status="i">
                        <div class="row">
                            <div class="col-md-3">
                                <asset:image src="${res.createdBy.photo}" style="width:120px;height:140px"/>
                            </div>

                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-md-12">
                                        <a class=col-sm-4 style="font-size: medium"><h3
                                                style="float: left">${res.topic.name}</h3></a>
                                    </div>

                                    <div class="col-sm-6" style="float: right">
                                        A post By <b>${res.createdBy.firstName} ${res.createdBy.lastName}</b>
                                    </div>

                                    <div class="col-sm-6">
                                        @${res.createdBy.username}
                                    </div>
                                </div>
                                <br>

                                <div class="row">
                                    <div class="col-md-12" style="float: right">
                                        Description: <b>"${res.description}"</b>
                                    </div>

                                    <div class="col-md-8">
                                        <g:link controller="resources" action="index"
                                                params="[id: res.id]">View post</g:link>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr style="color: black" size="100" color="black">
                    </g:each>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">Top posts</div>

                <div class="panel-body" style="height:350px;overflow: auto;">
                    <g:each in="${posts}" var="res" status="i">
                        <div class="row">
                            <div class="col-md-3">
                                <asset:image src="${newlinksharingapp.Resources.get(res).createdBy.photo}"
                                             style="width:120px;height:140px"/>
                            </div>

                            <div class="col-sm-9">
                                <div class="col-md-12">
                                    <a class=col-sm-3
                                       style="font-size: medium"><h3>${Resources.get(res).topic.name}</h3></a>
                                </div><br>

                                <div class="row col-md-12">
                                    <div class="col-md-6" style="float: left">
                                        <b>${Resources.get(res).createdBy.firstName}&nbsp${Resources.get(res).createdBy.lastName}</b>
                                    </div>

                                    <div class="col-md-6" style="float: right">
                                        @${Resources.get(res).createdBy.username}
                                    </div>
                                </div><br><br>
                                <br>

                                <div class="row col-md-12" style="float: left">
                                    ${Resources.get(res).description}
                                </div>
                                <br>

                                <div class="row">
                                    <div class="col-md-offset-8">
                                        <g:link controller="resources" action="index"
                                                params="[id: res]">View post</g:link>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr style="color: black" size="100" color="black">
                    </g:each>
                </div>
            </div>
        </div>

        <div class="col-md-6" style="float: right">
            <div class="panel panel-default">
                <div class="panel-heading">Login</div>

                <div class="panel-body">
                    <g:form class="form-horizontal" url="[controller: 'users', action: 'Login']">
                        <div class="form-group">
                            <text class="control-label col-md-4" for="email" style="text-align: left;">Email *</text>

                            <div class="col-md-8">
                                <input type="text" class="form-control" id="lemail" placeholder="Enter email"
                                       name="l_email">
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4 " for="l_pwd"
                                  style="text-align: left;">Password *</text>

                            <div class="col-md-8">
                                <input type="password" class="form-control" id="lpwd" placeholder="Enter password"
                                       name="l_pwd">
                                <span>
                                    <p id="message">${flash.message}</p>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-md-10">
                                <a href="/users/forgetpassword" class="control-label col-md-8"
                                   style="text-align: left;">Forget Password</a>
                            </div>

                            <div class=" offset-md-1">
                                <button type="submit" class="btn btn-basic">Login</button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">Sign Up</div>

                <div class="panel-body">
                    <g:uploadForm controller='users' action='signup' id="signupPage" class="form-horizontal"
                                  onsubmit="validatePasswordAtFrontEnd">
                        <div class="form-group">
                            <text class="control-label col-md-4" for="firstName"
                                  style="text-align: left;">First Name *</text>

                            <div class="col-md-8">
                                <input type="text" class="form-control" required id="firstName"
                                       placeholder="Enter First Nam" name="firstname">
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4" for="lastname"
                                  style="text-align: left;">Last Name *</text>

                            <div class="col-md-8">
                                <input type="text" class="form-control" id="lastName" required
                                       placeholder="Enter Last Name" name="lastname">
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4" for="email" style="text-align: left;">Email *</text>

                            <div class="col-md-8">
                                <input type="email" class="form-control" id="email" required placeholder="Enter Email"
                                       name="email">
                                <span>
                                    <p id="message1">${flash.message1}</p>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4" for="username"
                                  style="text-align: left;">Username *</text>

                            <div class="col-md-8">
                                <input type="text" class="form-control" id="username" required
                                       placeholder="Enter username" name="username">
                                ${flash.message2}
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>

                            <div class="col-md-8">
                                <input type="password" class="form-control" required id="passWord" pattern=".{3,}"
                                       title="Three or more characters" placeholder="Enter Password" name="password">
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4" for="pwd"
                                  style="text-align: left;">Confirm Password*</text>

                            <div class="col-md-8">
                                <input type="password" class="form-control" required id="passwordConfirm"
                                       placeholder="Re-Enter Password" name="confirmpassword"
                                       onfocusout='MatchPassword()'>

                                <div>
                                    <span id="checkPass"></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>

                            <div class="col-md-8">
                                <input type="file" class="form-control" required id="pwd" placeholder="choose"
                                       accept="image/*" name="image"><br>
                            </div>

                            <div class="form-group">
                                <div class=" col-md-8"></div>

                                <div class=" col-md-4">
                                    <button type="submit" id="submitButton" name="submitButton"
                                            class="btn btn-basic btn-block" width=100%>SignUp</button>
                                </div>
                            </div>
                        </div>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</body>
</html>