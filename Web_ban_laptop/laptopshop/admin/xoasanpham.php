<?php 
include 'connect.php';
$idsp=filter_input(INPUT_GET, 'id');
$sql_xoasp="DELETE FROM san_pham where MaSP='$idsp'";
$result_xoasp=mysqli_query($conn,$sql_xoasp);
if($result_xoasp){
    header("Location: xemsanpham.php");
}
else echo 'Xoa khong thanh cong'
 ?>