<?php
$serverName = "Kraken-PC\SQLEXPRESS"; //serverName\instanceName
$connectionInfo = array( "Database"=>"Prueba", "UID"=>"sa", "PWD"=>"12345");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn ) {
     echo "Conexión establecida.<br />";
     exec('c:\WINDOWS\system32\cmd.exe /c START C:\xampp\htdocs\Boton\Ejecutar.cmd');
     echo "<script type='text/javascript'>";
    echo "window.history.back(-1)";
    echo "</script>";
}else{
     echo "Conexión no se pudo establecer.<br />";
     die( print_r( sqlsrv_errors(), true));
}
?>