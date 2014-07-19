<!DOCTYPE html>
<html land="ru">
<head>
	<meta charset="utf-8">
	<title>ТОП10 - PSU.FaceMash</title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="theme/img/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="theme/css/style.css" rel="stylesheet">

	<style type="text/css">
		.col-md-6 img, .col-md-4 img, .col-md-12 img
		{
			max-height: 200px;
			max-width: 200px;
			margin-top: 40px;
			cursor: pointer;
		}
		.col-md-2 img
		{
			max-height: 150px;
			max-width: 150px;
			margin-top: 40px;	
			cursor: pointer;
		}
	</style>
	
	
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
				<li class="active" ><a href="?do=top">ТОП 2014</a></li>
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
				<a href="" id='img0-link'>
					<img src="" class="imgURL img-thumbnail" id='img0' rel="tooltip" data-original-title="">
				</a>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4 text-center">
				<img src="" class="imgURL img-thumbnail" id='img1'>
			</div>
			<div class="col-md-4 text-center">
				<img src="" class="imgURL img-thumbnail" id='img2'>
			</div>
			<div class="col-md-4 text-center">
				<img src="" class="imgURL img-thumbnail" id='img3'>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2 text-center">
				<img src="" class="imgURL img-thumbnail" id='img4'>
			</div>
			<div class="col-md-2 text-center">
				<img src="" class="imgURL img-thumbnail" id='img5'>
			</div>
			<div class="col-md-2 text-center">
				<img src="" class="imgURL img-thumbnail" id='img6'>
			</div>
			<div class="col-md-2 text-center">
				<img src="" class="imgURL img-thumbnail" id='img7'>
			</div>
			<div class="col-md-2 text-center">
				<img src="" class="imgURL img-thumbnail" id='img8'>
			</div>
			<div class="col-md-2 text-center">
				<img src="" class="imgURL img-thumbnail" id='img9'>
			</div>
		</div>
		<br>
		<br>
		<br>
	</div>
	

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">

		$(document).ready(function(){

			var top10 = <?=$this->top10?>;
			$('#img0-link').attr('href', 'https://vk.com/'+atob(top10[0]['profile_vk']));
			for (var i = 0; i < 10; i++)
			{
				$('#img'+i).attr("src", top10[i]['profile_photo']);
			}

			$('.imgURL').hover(
				function()
				{
					var i = this.id[3];
					if (!top10[i]['name'])
					{
						$.ajax({
							dataType: "jsonp",
							url: "https://api.vk.com/method/getProfiles?uids="+atob(top10[i]['profile_vk']),
						}).done(function ( data ) {
							if (data.response)
							{
								if (i < 4)
								{
									$('#img'+i).attr("data-original-title", data.response[0]['first_name'] + ' ' + data.response[0]['last_name']).tooltip('show');
								}else
								{
									$('#img'+i).attr("data-original-title", data.response[0]['first_name']).tooltip('show');
								}
								top10[i]['name'] = data.response[0]['first_name'];
								top10[i]['surname'] = data.response[0]['last_name'];
								
							}
						});
					}
				})
			
			
			$('.imgURL').tooltip('show');
			$('.imgURL').show();
		})
	</script>
</body>
</html>