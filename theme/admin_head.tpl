<!DOCTYPE html>
<html land="ru">
<head>
	<meta charset="utf-8">
	<title>Админ-панель - PSU.FaceMash</title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="theme/img/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="theme/css/style.css" rel="stylesheet">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>

	<nav role="navigation" class="navbar navbar-default navbar-static-top">
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
					<li><a href="?do=add">Добавить</a></li>
					<li><a href="?do=edit">Редактировать</a></li>
					<li><a href="?do=comments">Комментарии</a></li>
					<li><a href="?do=feedback">Отзывы</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="?do=exit">Выход</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">