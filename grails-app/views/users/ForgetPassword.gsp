<html>

  <head>
    <title>Forget Password23</title>
  </head>

  <body>
  <g:form url="[controller:'users' , action : 'validateResetPasswordEmail']" class="form-horizontal">
  <div class="form-group">
    <text class="control-label col-md-4" for="resetPassword"  style="text-align: left;">Email/Username *</text>
    <div class="col-md-8">
      <input type="email" class="form-control" id="resetPassword" placeholder="Enter email" name="fetchEmail">
    </div>
  </div>



  <div class=" offset-md-2">
    <button type="submit" class="btn btn-basic">
      Send Link
    </button>
  </div>
  </g:form>
  </body>

</html>