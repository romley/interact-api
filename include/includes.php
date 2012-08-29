<?PHP
// app includes
// jonathan romley for prophecy ventures llc
// last update: 28 August 2012

ob_start();
@session_start();
header('Content-type:application/json');
header("Cache-control:no-cache");
include_once 'include/config.php';
require_once("class/dbclass.php");

if(@!$db)
	$db = new mysqldb();

?>