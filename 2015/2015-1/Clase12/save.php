<?php 

/*$player = 'Hola';
$player2 = 1;
$player3 = 0.0111;

$player4 = 'chau';

echo $player.'<br/>'.$player4;

for ($i=0; $i < 5; $i++) { 
	echo $i;
}*/
//abrir conexion
$con=mysqli_connect("localhost","root","","mijuego");

for ($i=0; $i < 5; $i++) { 
	$time = date('Y-m-d H:i:s');
	$score = rand(10,100);
	$query = "INSERT INTO scores(score, registration_date) 
			VALUES($score,'$time')";

	if(mysqli_query($con,$query)){
		echo "Hizo el insert";
	}else{
		echo "No lo hizo";
	}
}


 ?>