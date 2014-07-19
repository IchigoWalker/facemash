<?php

	class Vote
	{
		function Vote($db)
		{
			$this->db = $db;
		}

		function getPhotos()
		{
			$row_count = $this->db->fetch( $this->db->query('SELECT COUNT(*) FROM profiles') );
			$row_count = $row_count['COUNT(*)'];

			$query = array();
			$query[] = '(SELECT profile_photo, profile_id FROM profiles LIMIT '.rand(0, $row_count).', 1)';
			$query[] = '(SELECT profile_photo, profile_id FROM profiles LIMIT '.rand(0, $row_count).', 1)';
			$query = implode(' UNION ', $query);
			$profiles = $this->db->getAll($query);

			$array = array(
				'photo1' => $profiles[0]['profile_photo'],
				'photo2' => $profiles[1]['profile_photo'],
				'hash1'  => md5($profiles[0]['profile_id']. rand()*1000),
				'hash2'  => md5($profiles[1]['profile_id']. rand()*1000),
				'id1'    => $profiles[0]['profile_id'],
				'id2'    => $profiles[1]['profile_id']
			);

			return $array;
		}

		function like($add)
		{
			if (isset($_SESSION['hash1']) && isset($_SESSION['hash2']))
			{
				switch ($add)
				{
					case $_SESSION['hash1']:
						$id = $_SESSION['id1'];
						break;

					case $_SESSION['hash2']:
						$id = $_SESSION['id2'];
						break;
						
					default:
						echo 'Undefined ID';
						Shield::hackDetect();
				}
				$this->db->query('UPDATE profiles SET profile_likes = profile_likes + 1 WHERE profile_id = ?i', $id);
			}else
			{
				echo 'Undefined ID';
				Shield::hackDetect();
			}
		}


		function setSession($profiles)
		{
			$_SESSION['hash1'] = $profiles['hash1'];
			$_SESSION['hash2'] = $profiles['hash2'];

			$_SESSION['photo1'] = $profiles['photo1'];
			$_SESSION['photo2'] = $profiles['photo2'];

			$_SESSION['id1'] = $profiles['id1'];
			$_SESSION['id2'] = $profiles['id2'];

		}

		static function refresh()
		{
			$profiles['photo1'] = $_SESSION['photo1'];
			$profiles['photo2'] = $_SESSION['photo2'];
			$profiles['hash1'] = $_SESSION['hash1'];
			$profiles['hash2'] = $_SESSION['hash2'];
			return $profiles;
		}

	}