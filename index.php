<?php
	session_start();

	require 'core/database.class.php';
	require 'core/vote.class.php';
	require 'core/shield.class.php';
	require 'core/template.class.php';

	$hack = new Shield();
	

	$do = isset($_POST['do'])? $_POST['do']: null;

	switch ($do)
	{
		case 'update':
			$db = new SafeMySQL();
			$vote = new Vote($db);

			$profiles = $vote->getPhotos();
			$vote->setSession($profiles);

			unset($profiles['id1']);
	 		unset($profiles['id2']);

			echo json_encode($profiles);
			die();

		case null:
			break;

		default:
			$hack->hackDetect();
	}

	$top = isset($_GET['do'])? $_GET['do']: null;

	switch ($top)
	{
		case 'top':
			$db = new SafeMySQL();

			$top10 = $db->getAll('SELECT profile_photo, profile_vk FROM profiles ORDER BY profile_likes DESC LIMIT 10');

			for ($i = 0; $i < 10; $i++)
			{
				$top10[$i]['profile_vk'] = base64_encode($top10[$i]['profile_vk']);
			}

			$template = new Template('theme/');
			$template->set('top10', json_encode($top10));
			$template->display('top');
			die();

		case 'about':
			$template = new Template('theme/');
			$template->display('about');
			die();

		case 'start':
			if(!isset($_COOKIE['PHPSESSID'])) 
				die('Для корректной работы приложения необходимо включить cookies'); 
			break;

		case null:
			break;
		default:
			$hack->hackDetect();
	}


	$add = isset($_POST['add'])? $_POST['add']: null;

	if ($add)
	{
		$hack->check();

		$db = new SafeMySQL();
		$vote = new Vote($db);

	 	$vote->like($add);

		$profiles = $vote->getPhotos();
		$vote->setSession($profiles);

		unset($profiles['id1']);
		unset($profiles['id2']);

		echo json_encode($profiles);
	 	die();
	}else
	{

		if(!isset($_COOKIE['PHPSESSID']))
		{ 
			header ("Location: $_SERVER[PHP_SELF]?do=start");
		}

		if (isset($_SESSION['hash1']))
		{
			$profiles = Vote::refresh();
		}else
		{
			$db = new SafeMySQL();
			$vote = new Vote($db);

			$profiles = $vote->getPhotos();	
			$vote->setSession($profiles);
		}

		$template = new Template('theme/');
		$template->set('photo1', $profiles['photo1']);
		$template->set('photo2', $profiles['photo2']);
		$template->set('hash1', $profiles['hash1']);
		$template->set('hash2', $profiles['hash2']);
		$template->display('main');

	}