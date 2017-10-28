<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Team Log</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</head>


<body>
	
	<link href="/resources/login/login.css?ver=2" rel="stylesheet">
	
	
	
<div id="login-button" class="grow">
    <img id="login-img"
         src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png">
    </img>
</div>

<div class="container">

    <div class="login-container">
        <button type="button" id="close-btn" class="close">
            <span class="glyphicon glyphicon-remove"></span>
        </button>

        <div class="modal-header" align="center">
            <img class="img-circle" id="img_logo" src="/resources/img/logo.png">
        </div>

        <!-- Begin # DIV Form -->
        <div id="div-forms">
            <!-- Begin # Login Form -->
            <form id="login-form" method='post'>
                <div class="modal-body">
                    	아이디:<input value='user00' name = "mid" id="login_username" class="form-control" type="text" placeholder="Username" required><br>
               			암호:<input value='user00' name = "mpw" id="login_password" class="form-control" type="password" placeholder="Password" required>
                    <div class="checkbox">
                        <label>
                            <input name='auto' type="checkbox" checked> Remember me
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <div>
                        <button type="submit" class="btn btn-lg btn-block">Login</button>
                    </div>

                        <div>
                            <button id="login_lost_btn" type="button" class="btn btn-link links_left">Lost Password?</button>
                            <button id="login_register_btn" type="button" class="btn btn-link links_right">Register</button>
                        </div>

                </div>
            </form>
            <!-- End # Login Form -->

            <!-- Begin | Lost Password Form -->
            <form id="lost-form" style="display:none;">
                <div class="modal-body">
                    <input id="lost_email" class="form-control" type="text" placeholder="E-Mail" required>
                </div>
                <div class="modal-footer">
                    <div>
                        <button type="submit" class="btn btn-lg btn-block">Send</button>
                    </div>

                        <div>
                            <button id="lost_login_btn" type="button" class="btn btn-link links_left">Log In</button>
                            <button id="lost_register_btn" type="button" class="btn btn-link links_right">Register</button>
                        </div>

                </div>
            </form>
            <!-- End | Lost Password Form -->

            <!-- Begin | Register Form -->
            <form method='post' id="register-form" style="display:none;">


                <div class="modal-body">
                    <div>
                        <div>
                            	이름:<input name='mname' id="register_username" class="form-control" type="text" placeholder="Username" required><br>
                 				아이디:<input name='mid'id="register_id" class="form-control" type="text" placeholder="Id" required><br>
             					암호:<input name='mpw'id="register_password" class="form-control" type="password" placeholder="Password" required><br>
                        		<input type="radio" name="admin" value="n" checked /><label>멘티</label>
								<input type="radio" name="admin" value="y"/><label>멘토</label>
                        </div>


                    </div>


                </div>
                <div class="modal-footer">
                    <div>
                        <button type="submit" class="btn btn-lg btn-block">Register</button>
                    </div>
                    <div>
                        <button id="register_login_btn" type="button" class="btn btn-link links_left">Log In</button>
                        <button id="register_lost_btn" type="button" class="btn btn-link links_right">Lost Password?</button>
                    </div>
                </div>
            </form>
            <!-- End | Register Form -->

        </div>
        <!-- End # DIV Form -->
    </div>
</div>

<div id="particles-js"></div>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="/resources/login/login.js"></script>

</body>
</html>