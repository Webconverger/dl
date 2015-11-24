<?php

$latest = "/webc-33.0.iso";


	$geo = "";
	foreach($_SERVER as $key => $value) {
			if(strpos($key, 'GEOIP_') === 0) {
				$geo = $geo . $value . " ";
			}
	}

	$fp = fopen(date('Y-m-d') . "-count.txt", 'a');
	fwrite($fp, $geo . "\n");
	fclose($fp);

switch ( $_SERVER["GEOIP_CONTINENT_CODE"] ) {
	 case 'AS':
	 	header ("Location: http://as.download.webconverger.com" . $latest );
	 	break;
	case 'AF':
	case 'EU':
		header ("Location: http://eu.download.webconverger.com" . $latest );
		break;
	case 'NA':
	default:
		header ("Location: http://na.download.webconverger.com" . $latest );
		break;
}
?>
