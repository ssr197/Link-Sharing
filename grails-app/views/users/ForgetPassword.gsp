<html>

<head>
    <title>Forget Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    body {
        background: #5D5C61;
    }

    * {
        box-sizing: border-box;
    }

    /* Create three equal columns that floats next to each other */
    .column {
        float: left;
        width: 33.33%;
        padding: 10px;
        height: 300px; /* Should be removed. Only for demonstration */
    }

    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    </style>
</head>

<body>
<div class="container">
    <div class="panel-body">
        <div class="column" style="background: #5D5C61; ">
        </div>
        <br><br><br><br><br><br><br><br><br><br>

        <div class="column" style="background: #5D5C61;">
            <g:form url="[controller: 'sendingLink', action: 'index']" class="form-control">
                <div class="form-group">
                    <br><br><br>
                    <text class="control-label col-md-12" for="resetPassword" style="text-align: center; color: red">
                        <b>Email*</b>
                        <br>
                    </text>
                    <br>

                    <div class="" style="alignment: center">
                        <input type="email" class="form-control" required id="resetPassword" placeholder="Enter email"
                               name="fetchEmail">
                    </div>
                </div>
                <br>

                <div class=" offset-md-2">
                    <button type="submit" class="btn btn-basic">
                        Send Link
                    </button>
                </div>
            </g:form>
        </div>

        <div class="column" style="background: #5D5C61;">
        </div>
    </div>
</div>
</body>
</html>