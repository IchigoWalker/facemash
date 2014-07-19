<!DOCTYPE html>
<html land="ru">
<head>
	<meta charset="utf-8">
	<title>Оставить отзыв - PSU.FaceMash</title>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="theme/img/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="theme/css/style.css" rel="stylesheet">
</head>
<body>

	<nav role="navigation" class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
					<span class="sr-only">Навигация</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="index.php" class="navbar-brand">PSU.FaceMash</a>
			</div>
		<div id="navbarCollapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.php">Голосовать!</a></li>
				<li><a href="index.php?do=top">ТОП 2014</a></li>
				<li class="active"><a href="feedback.php">Оставить отзыв</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="admin.php">Войти</a></li>
				<li><a href="?do=about">О проекте</a></li>
			</ul>
		</div>
		</div>
	</nav>


	<div class="container">
		<form class="form-horizontal" method="POST" action="feedback.php">
			<fieldset>
				<legend>Ваш отзыв или предложение</legend>

				<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Закрыть</span>
					</button>
					<strong>Успешно</strong>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label" for="name"></label>
					<div class="col-md-6">
						<div class="input-group">
							<span class="input-group-addon">Имя</span>
							<input id="name" name="name" class="form-control" placeholder="Имя" type="text" required="">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label" for="email"></label>
					<div class="col-md-6">
						<div class="input-group">
							<span class="input-group-addon">Email</span>
							<input id="email" type="email" name="email" class="form-control" placeholder="email" type="text" required="">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label" for="message"></label>
					<div class="col-md-6">
						<textarea class="form-control" id="message" name="message" rows="6"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label" for="message"></label>
					<div class="col-md-6" id="reCaptcha">
						<?=$this->captcha?>
					</div>
				</div>
				

				<div class="form-group">
					<label class="col-md-2 control-label" for="submit"></label>
					<div class="col-md-2">
						<button id="submit" name="submit" class="btn btn-primary">Отправить</button>
					</div>
				</div>

			</fieldset>
		</form>

	</div>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.form-horizontal').submit(function(e){
				e.preventDefault();

				var m_action = $(this).attr('action');
				var m_data = $(this).serialize();
				$.ajax({
					type: "POST",
					url: m_action,
					data: m_data,

					beforeSend:function(){
						$('#submit').button('loading');
					},
					success:function(data){
						if (data != 'OK')
						{
							$('.alert').html('<p class="error"><strong>Неверная капча.</strong></p>');
						}else
						{
							$('.alert').html('<strong>Успешно</strong>');
						}
						$(".alert").show();
						$('#submit').button('reset');
						Recaptcha.reload();
					},
					error:function(){
						$('.alert').html('<p class="error"><strong>Ошибка.</strong> Перезагрузите страницу</p>');
						$('.alert').show();
					}
				});
			});
		});

	</script>
</body>
</html>