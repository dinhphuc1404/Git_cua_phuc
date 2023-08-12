
<?php include "../admin/connect.php";
	if (!isset($_SESSION))
{
    session_start();
}
	if(!isset($_SESSION['tendn']))
	{
		header("Location: dangnhap.php");
	}
	else
	{
	$tendn=$_SESSION['tendn'];
	$loai="choxacnhan";
	if(isset($_GET['loai']))
	{
		$loai=$_GET['loai'];
	}
	if($loai=="choxacnhan") $l=0;
	else if($loai=="danggiao") $l=1;
	else if($loai=="dagiao") $l=2;
	else $l =3;
	$sql_xemhd="SELECT * from hoa_don where TrangThai='$l' and TenDangNhap='$tendn'";
	$result_hd=mysqli_query($conn,$sql_xemhd);

	


 ?>
 <?php include "./inc/header.php"; ?>
<?php include "./inc/navbar.php"; ?>

 <div style="width: 100%; margin-top:80px">
 	<h2 align="center"><?php if($l==0) echo "Chờ xác nhận"; else if($l==1) echo "Đang giao";else if($l==2) echo "Đã giao";else echo "Đã hủy"; ?></h2>
 </div>

<div style="float:left; margin: 50px 50px;">
	<h4>QUẢN LÝ ĐƠN HÀNG</h4>
	<ul>
		<li><a href="dsdonhang.php?loai=choxacnhan">Đơn hàng chờ xác nhận</a></li>
		<li><a href="dsdonhang.php?loai=danggiao">Đơn hàng đang giao</a></li>
		<li><a href="dsdonhang.php?loai=dagiao">Đơn hàng đã giao</a></li>
		<li><a href="dsdonhang.php?loai=dahuy">Đơn hàng đã hủy</a></li>
	</ul>
</div>
<div style=" margin: 100px 100px 100px 500px;">
	<p >Danh sách đơn hàng</p>
	<table border="1" >
		<tr style="background-color: greenyellow;">
			<td>STT</td>
			<td>Số hóa đơn</td>
			<td>Họ tên</td>
			<td>SĐT</td>
			<td>Địa chỉ nhận hàng</td>
			<td>Ngày lập</td>
			<td>Tình trạng</td>
			<td>Thao tác</td>
		</tr>
		<?php 
				$stt=1;

				while ($data=mysqli_fetch_array($result_hd)) {	

				?>
		<tr>
			<td><?php echo $stt;$stt=$stt+1; ?></td>
			<td>HD<?php echo $data['MaHD']; ?></td>
			<td><?php echo $data['HoTenNN']; ?></td>
			<td><?php echo $data['SDT']; ?></td>
			<td><?php echo $data['DiaChi']; ?></td>
			<td><?php echo $data['NgayHD']; ?></td>
			<td><?php if($l==0) echo "chờ xác nhận"; else if($l==1) echo "Đang giao";else if($l==2) echo "Đã giao";else echo "Đã hủy"; ?></td>
			<td><a href="chitietdonhang.php?mahd=<?php echo $data['MaHD'];?>">Chi tiết</a></td>
		</tr>
	<?php }
	} ?>
	</table>
	<?php 
	if(mysqli_num_rows($result_hd)==0) echo "không có đơn nào";	 ?>

</div>
<?php include "./inc/footer.php"; ?>