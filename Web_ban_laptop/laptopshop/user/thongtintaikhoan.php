<?php
    if (!isset($_SESSION))
{
    session_start();
} 
    if(!isset($_SESSION['tendn']))
    {
        header("Location: dangnhap.php");
    }
    else { 
    	$tendn=$_SESSION['tendn'];?>

<?php include "./inc/header.php"; ?>
<?php include "./inc/navbar.php"; ?>
<?php 
include '../admin/connect.php';
$sql_tk="SELECT * FROM tai_khoan where TenDangNhap='$tendn'";
$result_tk=mysqli_query($conn,$sql_tk);

 ?>

<div align="center" style="margin-top: 100px;"><h2>Thông Tin Tài Khoản</h2></div>
<div style="margin-bottom: 100px;margin-top: 100px;" align="center">
	<form method="post" action="thongtintaikhoan.php">
	<?php while ($data=mysqli_fetch_array($result_tk)) {									
	?>
	<table border="1">
		<tr>
			<td>Tài Khoản</td>
			<td><?php echo $data['TenDangNhap']; ?></td>
		</tr>
		<tr>
			<td>Họ Tên</td>
			<td><input type="text" name="txthoten" value='<?php echo $data['HoTen']; ?>'></td>
		</tr>
		<tr>
			<td>Giới tính</td>
			<td>
				<input type="radio" id="nam" name="gt" value="1" <?php if($data['GioiTinh']==1) echo 'checked' ?>>
				<label for="nam">Nam</label>
				<input type="radio" id="nu" name="gt" value="0" <?php if($data['GioiTinh']==0) echo 'checked' ?> >
				<label for="nu">Nữ</label>
			</td>
		</tr>
		<tr>
			<td>Số Điện Thoại</td>
			<td><input type="text" name="txtsdt" value='<?php echo $data['SDT']; ?>'></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><input type="text" name="txtemail" value='<?php echo $data['Email']; ?>'></td>
		</tr>
		<tr>
			<td>Địa chỉ</td>
			<td><input type="text" name="txtdiachi" value='<?php echo $data['DiaChi']; ?>'></td>
		</tr>
	</table>

	<div>
		<input type="submit" name="btnluu" value="Cập nhật">
	</div>



<?php } ?>
</form>

	
</div>
<?php 
	if(isset($_POST['btnluu']))
	{
		$hoten=$_POST['txthoten'];
		$gt=$_POST['gt'];
		$sdt=$_POST['txtsdt'];
		$email=$_POST['txtemail'];
		$diachi=$_POST['txtdiachi'];
		$sql_update="UPDATE tai_khoan set HoTen='$hoten',GioiTinh=$gt,SDT='$sdt',Email='$email',DiaChi='$diachi' where TenDangNhap='$tendn'";
		$result_update=mysqli_query($conn,$sql_update);
		if($result_update)
		{
			echo "Cập nhật thành công";
			echo $gt;
			echo "<script> window.location.href='thongtintaikhoan.php'; </script>";
		}
		else echo "Cập nhật thất bại";

	}

 ?>

<?php include "./inc/footer.php";} ?>