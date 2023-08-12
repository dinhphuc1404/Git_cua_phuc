
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
	$mahd=$_GET['mahd'];
	$sql_xemhd="SELECT s.TenSP,s.HinhAnh,c.SoLuongMua,s.DonGia,c.TyLeKM,t.TenThue,t.TyLeThue,s.DonGia*c.SoLuongMua as ThanhTien FROM san_pham s,danh_muc d,chi_tiet_hoa_don c,thue t WHERE d.MaThue=t.MaThue and s.MaDM=d.MaDM and s.MaSP=c.MaSP and c.MaHD='$mahd'";
	$result_hd=mysqli_query($conn,$sql_xemhd);

	


 ?>
 <?php include "./inc/header.php"; ?>
<?php include "./inc/navbar.php"; ?>

 <div style="width: 100%; margin-top:80px">
 	<h2 align="center">Chi tiết HD<?php echo $mahd ?></h2>
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
	<p >Chi tiết đơn hàng</p>
	<table border="1 >
		<tr style="background-color: greenyellow;">
			<td>STT</td>
			<td>Sản Phẩm</td>
			<td>Số lượng</td>
			<td>Đơn giá</td>
			<td>Khuyến mãi</td>
			<td>Thành tiền</td>
			
		</tr>
		<?php 
				$stt=1;
				while ($data=mysqli_fetch_array($result_hd)) {	
				?>
		<tr>
			<td><?php echo $stt;$stt=$stt+1; ?></td>
			<td>HD<?php echo $data['TenSP']; ?> <img src='<?php echo "../admin/".$data['HinhAnh'] ?>' alt="" style="width: 50px;"></td>
			<td><?php echo $data['SoLuongMua']; ?></td>
			<td><?php echo number_format($data['DonGia'],0,'.','.'); ?></td>
			<td><?php echo $data['TyLeKM']; ?></td>
			<td><?php echo number_format($data['ThanhTien'],0,'.','.'); ?></td>			
		</tr>
	<?php }
	} ?>
	</table>
	<?php 
	if(mysqli_num_rows($result_hd)==0) echo "không có đơn nào";	 ?>

</div>
<?php include "./inc/footer.php"; ?>