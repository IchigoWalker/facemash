<!DOCTYPE html>
<html land="ru">
<head>
	<meta charset="utf-8">
	<title>PSU.FaceMash</title>
	
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
				<li class="active"><a href="index.php">Голосовать!</a></li>
				<li><a href="?do=top">ТОП 2014</a></li>
				<li><a href="feedback.php">Оставить отзыв</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="admin.php">Войти</a></li>
				<li><a href="?do=about">О проекте</a></li>
			</ul>
		</div>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3><span class="label label-default">Кто тебе больше нравится? Кликни!</span></h3>
			</div>
			<div class="col-md-6 text-center">
				<img src="<?=$this->photo1?>" class="imgURL img-thumbnail" id='img1'>
			</div>
			<div class="col-md-6 text-center">
				<img src="<?=$this->photo2?>" class="imgURL img-thumbnail" id='img2'>
			</div>
			<div class="col-md-12 text-center">
				<img class='loading-indicator' src="theme/img/loader-indicator.gif" style="padding-top:40px">
			</div>
		</div>
	</div>

	<div id="Slideshow">
		<img id="preloader1" src="" class="preloader" onload="slideLoaded(this)"/>
		<img id="preloader2" src="" class="preloader" onload="slideLoaded(this)"/>
	</div>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">

		var hash1 = '<?=$this->hash1?>';
		var hash2 = '<?=$this->hash2?>';
		var work;

		
		var load = 0;
		function slideLoaded(img)
		{
			load++;
			if (load == 2)
			{
				load = 0;
				$('#img1').attr("src", work['photo1']);
				$('#img2').attr("src", work['photo2']);
				$('.imgURL').css("opacity", "1");
				$('.imgURL').css('background-color', '#FFF');
				$('.imgURL').css('cursor', 'pointer');
				$('.loading-indicator').hide();
			}
		}

		$(window).load(
			function() {
				$('.loading-indicator').hide();
				$('.imgURL').show();
			}
		);

		$(document).ready(function(){ 

			function like(hash)
			{
				$.ajax({
					type: 'POST',
					url: 'index.php',
					data: { add: hash },
				
					beforeSend:function(){
						$('.loading-indicator').show();
						$('.imgURL').css("opacity", "0.3");
						$('.imgURL').css('background-color', '#000');
						$('.imgURL').css('cursor', 'default');
					},
					success:function(data){
						work = jQuery.parseJSON(data);

						hash1 = work['hash1'];
						hash2 = work['hash2'];

						$('#preloader1').attr("src", work['photo1']);
						$('#preloader2').attr("src", work['photo2']);

					},
					error:function(){
						$('.row').html('<p class="error"><strong>Ошибка.</strong> Перезагрузите страницу</p>');
					}
				});
			}

			$("#img1").click(function(){
				like(hash1);
			})

			$("#img2").click(function(){
				like(hash2);
			})
		});


	</script>
</body>
</html>