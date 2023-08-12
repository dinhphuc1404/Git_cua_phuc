<?php
$conn=mysqli_connect('localhost','root','','laptopshop',3308);
mysqli_set_charset($conn,'UTF8');
if(mysqli_connect_errno())
{
	echo "kết nối không thành công";
}
?>