<!doctype html>
<html>
    <head>
        <asset:javascript src="MatchPassword.js"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
        <style>
            body{
                background: #5D5C61;
            }
        </style>

    </head>


    <body>
        <div class="container col-md-12">
            <br>
            <div class="panel panel-default col-md-12" style="background: #5bc0de">
                <div class="panel-body col-md-12">
                    <div class="container col-md-12">
                        <div class="col-md-8">
                            <h2>
                                <a href="#">
                                    <b>
                                        Link Sharing
                                    </b>
                                </a>
                            </h2>
                        </div>
                        <div class="col-md-3">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                                <div class="input-group-btn">
                                    <button class="btn btn-basic" type="submit">
                                        <span class="glyphicon glyphicon-search">

                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Recent Searches
                    </div>
                <div class="panel-body">
                <table  style="width:100%">
                    <td rowspan="3" width=25%>
                        <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px>
                    </td>
                    <td width=275px class="text">
                        Kunal Singh
                    </td>
                    <td width=150px>
                    </td>
                    <td width=150px>
                    </td>
                    <td width=150px>
                        <a href="#">
                            Home Page
                        </a>
                    </td>

                    </tr>
                        <td colspan="5" height=100px>
                            A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs.
                        </td>
                    </tr>
                    <td>
                        Links
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        <a href="">
                            View
                        </a>
                    </td>
                </table>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="container">
                    <div class="col-md-5">
                        Top Posts
                    </div>
                    <div class="col-md-2">
                        <div class="dropdown">
                            <button class="btn btn-basic dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Today
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="about-us">
                                <li><a href="#">One Week</a></li>
                                <li><a href="#">One Month</a></li>
                                <li><a href="#">One Year</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body"> <table  style="width:100%">
                <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
                <td width=275px class="text">Kunal Singh</td>
                <td width=150px></td>
                <td width=150px></td>
                <td width=150px><a href="#">Home Page</td>
            </tr>
                <td colspan="5" height=100px>A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs.</td>
            </tr>
                <td>Links</td>
                <td></td>
                <td></td>
                <td></td>
                <td><a href="#">View</td>
            </table></div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel-heading">Login</div>
            <div class="panel-body">
                <g:form class="form-horizontal" url="[controller:'users' , action : 'Login']">
                    <div class="form-group">
                        <text class="control-label col-md-4" for="email"  style="text-align: left;">Email/Username *</text>
                        <div class="col-md-8">
                            <input type="email" class="form-control" id="lemail" placeholder="Enter email" name="l_email">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4 " for="l_pwd" style="text-align: left;">Password *</text>
                        <div class="col-md-8">
                            <input type="password" class="form-control" id="lpwd" placeholder="Enter password" name="l_pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class=" col-md-10">
                            <a href="/users/forgetpassword" class="control-label col-md-8" style="text-align: left;">Forget Password</a>
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
                <g:uploadForm controller='users' action='signup' class="form-horizontal">
                    <div class="form-group">
                        <text class="control-label col-md-4" for="firstName" style="text-align: left;">First Name *</text>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="firstName" placeholder="Enter First Nam" name="firstname">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4" for="lastname" style="text-align: left;">Last Name *</text>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name" name="lastname">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4" for="email" style="text-align: left;">Email *</text>
                        <div class="col-md-8">
                            <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4" for="username" style="text-align: left;">Username *</text>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="userName" placeholder="Enter username" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>
                        <div class="col-md-8">
                            <input type="password" class="form-control" id="passWord" placeholder="Enter Password" name="password" >
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4" for="pwd" style="text-align: left;">Confirm Password*</text>
                        <div class="col-md-8">
                            <input type="password" class="form-control" id="passwordConfirm" placeholder="Re-Enter Password" name="confirmpassword" onfocusout='MatchPassword()'>
                        </div>
                        <div>
                            <span id="checkPass"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                        <div class="col-md-8">
                            <input type="file" class="form-control" id="pwd" placeholder="choose" name="image">
                        </div>
                    <div class="form-group">
                        <div class=" col-md-8">
                        </div>
                        <div class=" col-md-4">


                            <button type="submit" id="submitButton" name="submitButton" class="btn btn-basic btn-block" width=100% >SignUp</button>
                        </div>
                    </div>
                </g:uploadForm>
            </div>
        </div>
    </div>
</div>
</body>
</html>