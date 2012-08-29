<?PHP
// app config
// jonathan romley for prophecy ventures llc
// last update: 28 August 2012
// ENTER DB SERVER DETAILS AND RENAME THIS FILE config.php

/* set the db server details */
define('DB_SERVER','x');
define('DB_SERVER_USERNAME','x');
define('DB_SERVER_PASSWORD','x');
define('DB_DATABASE','x');

/* establish connection to db or throw an error (#fail) */
$conn=mysql_connect(DB_SERVER,DB_SERVER_USERNAME,DB_SERVER_PASSWORD) or die ('#fail');

?>