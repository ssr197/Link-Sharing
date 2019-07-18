<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
</head>
<body>
<div class="container"><br>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-8">
                    <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                        <div class="input-group-btn">
                            <button class="btn btn-basic" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-7">
        <div class="panel panel-default">
            <div class="panel-heading">Recent Searches</div>
            <div class="panel-body">
                <table  style="width:100%">
                    <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
                    <td width=275px class="text">Kunal Singh</td>
                    <td width=150px></td>
                    <td width=150px></td>
                    <td width=150px>
                        <a href="#">
                            Home Page
                    </td>
                </tr>
                    <td colspan="5" height=100px>A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs.</td>
                </tr>
                    <td>Links</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><a href="">View</td>
                </table>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="container">
                    <div class="col-md-5">
                        Top Posts</div>
                    <div class="col-md-2">
                        <div class="dropdown">
                            <button class="btn btn-basic dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Today  <span class="caret"></span>
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
                <form class="form-horizontal" action="/action_page.php">
                    <div class="form-group">
                        <text class="control-label col-md-4" for="email"  style="text-align: left;">Email/Username *</text>
                        <div class="col-md-8">
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Password *</text>
                        <div class="col-md-8">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class=" col-md-10">
                            <a href="https://www.google.com" class="control-label col-md-8" style="text-align: left;">Forget Password</a>
                        </div>
                        <div class=" offset-md-1">
                            <button type="submit" class="btn btn-basic">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Sign Up</div>
            <div class="panel-body">
                <form class="form-horizontal"  action="/action_page.php">
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
                            <input type="password" class="form-control" id="passWord" placeholder="Enter Password" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4" for="pwd" style="text-align: left;">ConfirmPassword*</text>
                        <div class="col-md-8">
                            <input type="password" class="form-control" id="passwordConfirm" placeholder="Re-Enter Password" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Photo</text>
                        <div class="col-md-5">
                            <input type="file" class="form-control" id="pwd" placeholder="choose" name="pwd">
                        </div>
<!--
                        <div class="col col-md-2">
                            <button type="submit" class="btn btn-basic">Browse</button>
                        </div>
-->
                    </div>
                    <div class="form-group">
                        <div class=" col-md-8">
                        </div>
                        <div class=" col-md-4">
                            <button type="submit" class="btn btn-basic btn-block" width=100%>Register</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>


<!--
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>
            </ul>
        </li>
    </content>

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Welcome to Grails</h1>

            <p>
                Congratulations, you have successfully started your first Grails application! At the moment
                this is the default page, feel free to modify it to either redirect to a controller or display
                whatever content you may choose. Below is a list of controllers that are currently deployed in
                this application, click on each to execute its default action:
            </p>

            <div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </section>
    </div>

</body>
</html>
-->