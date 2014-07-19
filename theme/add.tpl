<form class="form-horizontal" method="POST" action="admin.php">
	<fieldset>
		<legend>Добавить запись</legend>

		<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span>
				<span class="sr-only">Закрыть</span>
			</button>
			<strong>Успешно</strong>
		</div>

		<div class="form-group">
			<label class="col-md-2 control-label" for="photo"></label>
			<div class="col-md-6">
				<div class="input-group">
					<span class="input-group-addon">Ссылка на фото</span>
					<input id="photo" name="photo" class="form-control" placeholder="Ссылка на фото" type="text" required="">
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2 control-label" for="vk"></label>
			<div class="col-md-6">
				<div class="input-group">
					<span class="input-group-addon">VK</span>
					<input id="vk" name="vk" class="form-control" placeholder="VK" type="text" required="">
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2 control-label" for="faculty"></label>
			<div class="col-md-6">
				<div class="input-group">
					<span class="input-group-addon">Факультет</span>
					<input id="faculty" name="faculty" class="form-control" placeholder="Факультет" type="text" required="">
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2 control-label" for="kurs"></label>
			<div class="col-md-6">
				<div class="input-group">
					<span class="input-group-addon">Курс</span>
					<input id="kurs" name="kurs" class="form-control" placeholder="Курс" type="text" required="">
				</div>
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
					$(".alert").show();
					$('#submit').button('reset');
				},
				error:function(){
					$('.alert').html('<p class="error"><strong>Ошибка.</strong> Перезагрузите страницу</p>');
					$(".alert").show();
				}
			});
		});
	});
</script>