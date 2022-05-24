<?php

require_once('class.phpmailer.php');
date_default_timezone_set('America/Toronto');
$arquivo=$_GET['file'];

function send($arquivo) {

if (file_exists($arquivo)) {
					$xml = simplexml_load_file($arquivo);

foreach($xml->auth as $auth){
 $smtpConf = array(
	  'auth' => 'login',
	  'ssl' => 'tls',
	  'port' => trim($auth->port),
	  'username' => trim($auth->smtp_user),
	  'password' => trim($auth->smtp_pass),
	  'smtp' => trim($auth->host_smtp),
	  'nome' => utf8_decode(trim($auth->nome_remetente)),
	 );
}

	foreach($xml->mail as $xmail){
		foreach($xmail->cabecalho as $cabecalho){
		$smtpDados = array(
			'name' => trim($cabecalho->nome_destinatario),
			'email' => trim($cabecalho->to),
			'subject' => trim($cabecalho->subject),
		  );
	}
	foreach($xmail->texto_email as $texto_email){
		$smtpDados['body']=
trim(($texto_email->linha1).' '.$smtpDados['name']).".<br><br>"
.trim($texto_email->linha2)."<br><br>"
.trim($texto_email->linha3)."<br>"
.trim($texto_email->linha4)."<br>"
.trim($texto_email->linha5)."<br>"
.trim($texto_email->linha6)."<br>"
.trim($texto_email->linha7)."<br>"
;
}

$mail             = new PHPMailer();

//$body             = file_get_contents('contents.html');
//$body             = eregi_replace("[\]",'',$body);

$mail->IsSMTP(); // telling the class to use SMTP
$mail->SMTPDebug  = 1;                     // enables SMTP debug information (for testing)
                                           // 1 = errors and messages
                                           // 2 = messages only
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->SMTPSecure = $smtpConf['ssl'];                 // sets the prefix to the servier
$mail->Host       = $smtpConf['smtp'];      // sets GMAIL as the SMTP server
$mail->Port       = $smtpConf['port'];                   // set the SMTP port for the GMAIL server
$mail->Username   = $smtpConf['username'];  // GMAIL username
$mail->Password   = $smtpConf['password'];            // GMAIL password

$mail->SetFrom($smtpConf['username'], $smtpConf['nome']);
$mail->Subject    = $smtpDados['subject'];

//$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
$body=utf8_decode($smtpDados['body']);

$mail->MsgHTML($body);

$address = $smtpDados['email'];
$mail->AddAddress($address, $address);

if(ob_get_level()==0) ob_start();
			if(!isset($x))$x=1;
			ob_flush();
			flush();
			echo $x;
			sleep(2);
			$x=$x+1;

if(!$mail->Send()) {
  echo "Erro de envio: " . $mail->ErrorInfo;
} else {
  //echo "Message sent!";
			
}





								}
							}else{

								echo "Erro ao abrir o arquivo:  $arquivo";
							}
}
ob_end_flush();
send($arquivo);
?>


