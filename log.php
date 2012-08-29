<?PHP
// log user interaction
// jonathan romley for prophecy ventures llc
// last update: 28 August 2012

require 'include/includes.php';

// we'll use this to process incoming events reported by our mobile application

/* create empty value array */
$values = array();

/* get post data */
foreach($_POST as $key => $value) 
{
	$values[$key]=$value;
	global $$key;
	$$key = stripslashes($value);	
}

/* handle empty requests */
if(empty($uid)){
/* fail response*/
$response_arr=array('stat'=>'fail','code'=>'4','message'=>'empty request');
/* output */
echo json_encode($response_arr);
exit;
}

/* lookup action */
$values['action_id']=$db->select_single_value("interact_action","action_id","where action_name='".$action."'");

/* identify active content */
$values['content_id']=$db->select_single_value("interact_stream","content_id","order by stream_id desc limit 1");

//print_r($values);

/* insert record in to db */
$db->insert("interact_activity_log",$values);


/* okay response*/
$response_arr=array('stat'=>'ok','code'=>'200');


/* output */
echo json_encode($response_arr);

?>