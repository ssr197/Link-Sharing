<html>
	<head>
	<title>
		Reset Password
	</title>	
	</head>

	<body>
<g:form url="[controller:'users' , action : 'updatepassword']" class="form-horizontal">

        <input type="hidden" id="hiddenEmail" name="hiddenEmail" value="">


		<div class="form-group">
            <text class="control-label col-md-4" for="email"  style="text-align: left;">
            	Enter New Password
            </text>
            <div class="col-md-8">
                <input type="password" class="form-control" id="resetPass" placeholder="Enter password" name="newpassword">
            </div>
        </div>
        <br>

        <div class="form-group">
            <text class="control-label col-md-4" for="email"  style="text-align: left;">
                Confirm New Password
            </text>
            <div class="col-md-8">
                <input type="email" class="form-control" id="resetConfirmPass" placeholder="confirm Password" name="l_email">
            </div>
        </div>


        <br>

		<div class=" offset-md-1">
            <button type="submit" class="btn btn-basic">
             	Update Password
            </button>
        </div>

</g:form>
	</body>


</html>