<?php
	session_start();
	function convertrgb( $color ){
		$color = eregi_replace( "[^0-9a-f]", "", $color );
		return array( hexdec( substr( $color, 0, 2 ) ), hexdec( substr( $color, 2, 2 ) ), hexdec( substr( $color, 4, 2 ) ) );
	}
	
	function createimage( $text, $width, $height, $font = 5 ){
		global $fontColor;
		global $bgColor;
		global $lineColor;
		if ( $img = @imagecreate( $width, $height ) ){
			list( $R, $G, $B ) = convertrgb( $fontColor );
			$fontColor = imagecolorallocate( $img, $R, $G, $B );
			list( $R, $G, $B ) = convertrgb( $bgColor );
			$bgColor = imagecolorallocate( $img, $R, $G, $B );
			list( $R, $G, $B ) = convertrgb( $lineColor );
			$lineColor = imagecolorallocate( $img, $R, $G, $B );
			imagefill( $img, 0, 0, $bgColor );
			$i = 0;
			for ( ; $i <= $width; $i += 5 )
			{
				@imageline( $img, $i, 0, $i, $height, $lineColor );
			}
			$i = 0;
			for ( ; $i <= $height; $i += 5 )
			{
				@imageline( $img, 0, $i, $width, $i, $lineColor );
			}
			$hcenter = $width / 2;
			$vcenter = $height / 2;
			$x = round( $hcenter - imagefontwidth( $font ) * strlen( $text ) / 2 );
			$y = round( $vcenter - imagefontheight( $font ) / 2 );
			imagestring( $img, $font, $x, $y, $text, $fontColor );
			if ( function_exists( "ImagePNG" ) ){
				header( "Content-Type: image/png" );
				@imagepng( $img );
			}else if ( function_exists( "ImageGIF" ) ){
				header( "Content-Type: image/gif" );
				@imagegif( $img );
			}else if ( function_exists( "ImageJPEG" ) ){
				header( "Content-Type: image/jpeg" );
				@imagejpeg( $img );
			}
			imagedestroy( $img );
		}
	}
error_reporting( E_WARNING );
if ( function_exists( "session_start" ) ){
    @session_start( );
}
$fontSize = 5;
$fontColor = "000000";
$bgColor = "FFFFFF";
$lineColor = "B0B0B0";
$secCode = "";
for ( $i = 0; $i < 6; ++$i ){
    $secCode .= rand( 0, 9 );
}
$_SESSION['secimg'] = $secCode;
createimage( $secCode, 71, 21, $fontSize );
?>