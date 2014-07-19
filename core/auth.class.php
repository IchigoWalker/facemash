<?php

	class AuthClass{
		
		public $_login;
		public $_pass;

		function __construct($login, $pass)
		{
			$this->_login = $login;
			$this->_pass = $pass;
		}
		
		public function isAuth()
		{
			if ( isset($_SESSION['is_auth']) )
				return true;
			else
				return false;
		}

		public function auth($login, $pass)
		{
			if ($login == $this->_login && $pass == $this->_pass)
			{
				$_SESSION["is_auth"] = true;
				$_SESSION["login"] = $login;
				return true;
			}else
			{
				setcookie ("is_auth", false, time()+3600*24*5);
				return false;
			}
		}

		public function getLogin()
		{
			if ( $this->isAuth() )
				return $_SESSION["login"];
		}


		public function out()
		{
			$_SESSION = array();
			session_destroy();
		}
	}