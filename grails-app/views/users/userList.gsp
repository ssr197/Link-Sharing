<html>
<head>
    <script>
        function show() {
            document.getElementById("drop").style.display="block";
        }
    </script>
	<title>
		User List
	</title>


    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>

	<style>
		table {
  			font-family: arial, sans-serif;
  			border-collapse: collapse;
  			width: 100%;
		}

		td, th {
  			border: 1px solid #dddddd;
  			text-align: left;
  			padding: 8px;
		}

		tr:nth-child(even) {
  			background-color: #dddddd;
		}
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




    <title>user Page</title>

</head>




<body>

<div class="panel panel-default col-md-12" style="background: #5bc0de">
    <div class="panel-body col-md-12">
        <div class="container col-md-12">
            <table>
                <td class="col-md-10">
                    <div class="col-md-11">
                        <h2><a href="/dashboard/dashboard"><b>Link Sharing</b></a></h2>
                    </div>
                </td>
                <td>

                </td>
                <td>
                    <div class="dropdown"style="float: right">
                        <button class="dropbtn">${userdata.username}</button>
                        <g:if test="${userdata.admin}">
                            <div class="dropdown-content">
                                <a href="/dashboard/dashboard">Back</a>
                                <a href="/users/openPageToChangeProfile">profile</a>
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
            </table>
        </div>
    </div>
</div>
    <table>
      <tr>
        <th>Id</th>
        <th>Username</th>
        <th>Email</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>Active</th>
        <th>Manage<th>
      </tr>

        <g:each var="User" in="${allUserList}">
            <tr>
                <td>${User.id}</td>
                <td>${User.username}</td>
                <td>${User.email}</td>
                <td>${User.firstName}</td>
                <td>${User.lastName}</td>
                <td>${User.active}</td>
                <td>
                    <button class="btn btn-danger">
                        <g:link action="changeAdminPermission" params="${[variable1: User.email]}">Activate/Deactivate</g:link>
                    </button>
                </td>
                <td>${User.admin}</td>
                <td>
                    <button class="btn btn-warning">
                        <g:link action="makeAdmin" params="${[variable2: User.email]}">Admin/Normal</g:link>
                    </button>
                </td>
            </tr>
        </g:each>

    </table>
</body>
</html>