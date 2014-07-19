<?php

	class Shield
	{
		public static function hackDetect()
		{
			die('ACCESS DENIED');
		}

		public static function reCaptcha()
		{
			require 'core/recaptcha.lib.php';
			$privatekey = '6LcsHPcSAAAAABNcn-PNBs7QBfZ8FF1OydyRRiaG';
			$resp = recaptcha_check_answer ($privatekey, $_SERVER['REMOTE_ADDR'], $_POST['recaptcha_challenge_field'], $_POST['recaptcha_response_field']);

			if (!$resp->is_valid) 
			{
				die('Undefined Captcha');
			}else
			{
				return true;
			}
		}
		function check()
		{
			if (!isset($_SESSION['SESSION_ID']))
			{
				$_SESSION['SESSION_ID'] = $_COOKIE['PHPSESSID'];
			}
			elseif ($_SESSION['SESSION_ID'] != $_COOKIE['PHPSESSID'])
			{
				echo 'Undefined SESSION';
				$this->hackDetect();

			}

			if (!isset($_SESSION['USER_AGENT']))
			{
				$_SESSION['USER_AGENT'] = $_SERVER['HTTP_USER_AGENT'];
			}
			elseif ($_SESSION['USER_AGENT'] != $_SERVER['HTTP_USER_AGENT'])
			{
				echo 'Undefined USER_AGENT';
				$this->hackDetect();
			}

			if ($_SERVER['HTTP_ORIGIN'] != 'http://' + $_SERVER['HTTP_HOST'])
			{
				echo 'Undefined ORIGIN';
				$this->hackDetect();
			}

			if ($_SERVER["HTTP_REFERER"] != 'http://'+ $_SERVER['HTTP_HOST'] +'/' && $_SERVER["HTTP_REFERER"] != 'http://' + $_SERVER['HTTP_HOST'] + '/index.php')
			{
				echo 'Undefined REFERER';
				$this->hackDetect();
			}

			if(empty($_SERVER['HTTP_X_REQUESTED_WITH']))
			{
				echo 'Undefined REQUEST';
				$this->hackDetect();
			}

			if (strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest')
			{
				echo 'Undefined REQUEST';
				$this->hackDetect();
			}

		}

	}