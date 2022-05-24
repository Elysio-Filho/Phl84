<?php

require("class.phpmailer.php");

$assunto   = $_REQUEST["assunto"];
$texto     = $_REQUEST["texto"];
$nome      = $_REQUEST["nome"];
$end       = $_REQUEST["end"];
$smtp_user = $_REQUEST["user"];
$smtp_pwd  = $_REQUEST["pwd"];
$copia     = $_REQUEST["copia"];
$fromname  = $_REQUEST["fromname"];
$host      = $_REQUEST["host"];

$mail = new PHPMailer();
$mail->IsSMTP(); // telling the class to use SMTP
$mail->Priority = 3;
$mail->Encoding = "8bit";
$mail->CharSet = "iso-8859-1";
$mail->From = $smtp_user;
$mail->FromName = $fromname;
$mail->Subject = $assunto;
$mail->Body = $texto;
$mail->WordWrap = 0;
$mail->Host = $host; // SMTP server
$mail->Port = 25;
$mail->Helo = "localhost.localdomain";
$mail->SMTPAuth = true;
$mail->Username = $smtp_user;
$mail->Password = $smtp_pwd;
$mail->PluginDir = $INCLUDE_DIR;
$mail->AddReplyTo($from,$fromname);
$mail->Sender = $smtp_user;
$mail->Mailer = "smtp";
$mail->TimeOut = "10";
$mail->IsHTML(true);
$mail->AddAddress($end,$nome);
$mail->AddCC($copia,"");
$mail->Send();

echo "<center>O e-mail foi enviado</center>";

?> 
