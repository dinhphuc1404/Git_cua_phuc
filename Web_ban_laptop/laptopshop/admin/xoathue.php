<?php 
include 'connect.php';
$idthue=filter_input(INPUT_GET, 'id');
$sql_xoathue="DELETE FROM thue where MaThue='$idthue'";
$result_xoathue=mysqli_query($conn,$sql_xoathue);
if($result_xoathue){
    header("Location: xemdanhsachthue.php");
}
else echo 'Xoa khong thanh cong'
?>