
<?php if (!isset($_SESSION))
{
    session_start();
}
include '../admin/connect.php';
$masp=filter_input(INPUT_GET,'id');
$thanhtien=0;
if(isset($masp))
{
    $sql_sp="SELECT * from san_pham where MaSP='$masp'";
    
    $result_sp=mysqli_query($conn,$sql_sp);
    $row_sp=mysqli_fetch_array($result_sp);
    if(!empty($_SESSION['cart']))
    {

          $_SESSION['cart'][$masp]=array("idsp"=>$row_sp['MaSP'],"tensp"=>$row_sp['TenSP'],"sl"=>$_SESSION['cart'][$masp]['sl']+1,"dongia"=>$row_sp['DonGia'],"hinhanh"=>$row_sp['HinhAnh']);

    }
    else
    {
          $_SESSION['cart'][$masp]=array("idsp"=>$row_sp['MaSP'],"tensp"=>$row_sp['TenSP'],"sl"=>1,"dongia"=>$row_sp['DonGia'],"hinhanh"=>$row_sp['HinhAnh']);
    }

    header ("Location: listcart.php");
}
 ?>
