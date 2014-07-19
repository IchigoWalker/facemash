<?php

	session_start();

	$name = isset($_POST['name'])? $_POST['name']: null;
	$email = isset($_POST['email'])? $_POST['email']: null;
	$message = isset($_POST['message'])? $_POST['message']: null;


	if ($name && $email && $message)
	{
		require 'core/shield.class.php';
		$hack = new Shield();
		
		$hack->check();
		$hack->reCaptcha();

		
		require_once 'core/database.class.php';
		$db = new SafeMySQL();

		$db->query('INSERT INTO feedback (feedback_name, feedback_email, feedback_message) VALUES (?s, ?s, ?s)', $name, $email, $message);
		die('OK');
	}else
	{
		require 'core/template.class.php';
		require_once 'core/recaptcha.lib.php';
		$publickey = '6LcsHPcSAAAAAKcT6pVZTrC_RMAHEVjbRZvEGSZa';

		$template = new Template('theme/');
		$template->set('captcha', recaptcha_get_html($publickey));
		$template->display('feedback');
	}