<!DOCTYPE html>
<html land="ru">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Вход - PSU.FaceMash</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="theme/img/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">

	<style>
		body{
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #eee;
		}

		.form-signin{
			max-width: 330px;
			padding: 15px;
			margin: 0 auto;
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox{
			margin-bottom: 10px;
		}
		.form-signin .checkbox{
			font-weight: normal;
		}
		.form-signin .form-control{
			position: relative;
			font-size: 16px;
			height: auto;
			padding: 10px;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
		}
		.form-signin .form-control:focus{
			z-index: 2;
		}
		.form-signin label{
			font-weight: normal;
		}
		.error{
			color: #b94a48;      
		}
	</style>
</head>
<body>
	
	<div class="container">
		<form class="form-signin" method="post" action="admin.php" id="form-signin">
			<h2 class="center-block form-signin-heading">Вход</h2>
			<h5 class="form-signin-heading error"><?=$this->login?></h5>
			<div class="control-group">
				<div class="controls">
					<div class="input-group">
					  <span class="input-group-addon" style="width: 80px;">Логин</span>
					  <input size="50" name="userName" id="login" value="" type="text" class="form-control" placeholder="Логин">
					</div>
				</div>
			</div>
			<br>
			<div class="control-group">
				<div class="controls">
					<div class="input-group">
						<span class="input-group-addon" style="width: 80px;">Пароль</span>
						<input size="50" name="userPass" id="password" value="" type="password" class="form-control" placeholder="Password">
					</div>
				</div>
			</div>
			<button  style="margin-top:10px;" name="submit" id="submit" value="" type="submit" class="btn btn-large btn-primary btn-block">Войти</button>
		</form>
	</div>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>