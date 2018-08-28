<?php
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'inventory_barang';


	mysql_connect($host,$user,$pass) or die('koneksi gagal');
	mysql_select_db($db) or die('database tidak bisa dibuka');
	
?>