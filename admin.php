<?php
	session_start();

	require_once 'core/template.class.php';
	require_once 'core/database.class.php';
	require_once 'core/auth.class.php';

	
	$template = new Template('theme/');


	//Если отправил запрос на вход
	if ( isset($_POST['userName']) && isset($_POST['userPass']))
	{
		$userName = $_POST['userName'];
		$userPass = md5($_POST['userPass'] + $_POST['userName'][1]);
		$status = 'admin';

		$db = new SafeMySQL();
		$user = $db->getAll("SELECT * FROM users WHERE user_login = ?s AND user_rights = ?s", $userName, $status);
		
		$auth = new AuthClass( $user[0]['user_login'], $user[0]['user_password'] );

		if ( !$auth->auth($userName, $userPass) )
		{
			$template->set("login", "<div class='alert alert-danger'>Неверный логин или пароль</div>");
			$template->display("login");
		}else //если верный логин и пароль
		{
			header("Location: admin.php");
		}
	
	}else //если не отсылал запросы на вход
	{
		//если уже авторизированы
		if ( isset($_SESSION['is_auth']) )
		{
			$photo = isset($_POST['photo'])? $_POST['photo']: null;
			$vk = isset($_POST['vk'])? $_POST['vk']: null;
			$faculty = isset($_POST['faculty'])? $_POST['faculty']: null;
			$kurs = isset($_POST['kurs'])? $_POST['kurs']: null;

			if ($photo && $vk && $faculty && $kurs)
			{
				require_once 'core/shield.class.php';
				$hack = new Shield();
				$hack->check();
				$db = new SafeMySQL();
				require_once 'core/database.class.php';

				$db->query('INSERT INTO profiles (profile_photo, profile_vk, profile_faculty, profile_kurs) VALUES (?s, ?s, ?s, ?s)', $photo, $vk, $faculty, $kurs);
				die('OK');
			}

			$do = isset($_GET['do'])? $_GET['do']: null;

			switch ($do)
			{
				case 'exit':
					$auth = new AuthClass(null, null);
					$auth->out();
					header('Location: index.php');
					break;

				case 'feedback':
					$db = new SafeMySQL();
					$template->display('admin_head');
					$feedback = $db->getAll('SELECT * FROM feedback ORDER BY feedback_id DESC LIMIT 20');
					if (!$feedback)
						echo 'Нет отзывов';
					foreach ($feedback as $value)
					{
						$template->set('id', $value['feedback_id']);
						$template->set('name', $value['feedback_name']);
						$template->set('email', $value['feedback_email']);
						$template->set('message', $value['feedback_message']);
						$template->display('feedback_out');
					}					
					break;

				default:
					$template->display('admin_head');
					$template->display('add');
			}

			$template->display('admin_foot');

		}else
		{
			$template->display('login');
		}
		
	}