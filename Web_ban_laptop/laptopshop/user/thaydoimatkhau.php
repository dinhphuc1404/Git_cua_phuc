<?php
    if (!isset($_SESSION))
{
    session_start();
} 
    if(!isset($_SESSION['tendn']))
    {
        header("Location: dangnhap.php");
    }
    else { ?>

<?php include "./inc/header.php"; ?>
<?php include "./inc/navbar.php"; ?>
<?php 
include '../admin/connect.php';
$tendn=$_SESSION['tendn'];
$sql_tk="SELECT * FROM tai_khoan where TenDangNhap='$tendn'";
$result_tk=mysqli_query($conn,$sql_tk);
$mk='';
while ($data=mysqli_fetch_array($result_tk)) {
	$mk=$data['MatKhau'];
}									

?>
<div align="center" style="margin-top: 100px;"><h2>Thay đổi mật khẩu</h2></div>
<div style="margin-bottom: 100px;margin-top: 100px;" align="center">
	

	<form method="post" action="thaydoimatkhau.php">
            <table class="form">					
                <tr>
                    <td>
                        <label>Mật khẩu cũ</label>
                    </td>
                    <td>
                        <input type="password" name="txtmkc" placeholder="Nhập mật khẩu cũ..."  name="title" class="medium" />
                    </td>
                </tr>
				 <tr>
                    <td>
                        <label>Mật khẩu mới</label>
                    </td>
                    <td>
                        <input type="password" name="txtmkm" placeholder="Nhập mật khẩu mới..." name="slogan" class="medium" />
                    </td>
                </tr>
				 
				
				 <tr>
                    <td>
                    </td>
                    <td>
                        <input type="submit" name="submit" Value="Thay đổi mật khẩu" />
                    </td>
                </tr>
            </table>
            </form>
</div>

<?php 
	if(isset($_POST['submit']))
	{
		if($_POST['txtmkc']==$mk)
		{
			if($_POST['txtmkm']=="")
			{
				echo "vui long nhap mk";
			}
			else
			{
				$mkm=$_POST['txtmkm'];
				$sql_thaymk="UPDATE tai_khoan set MatKhau='$mkm' where TenDangNhap='$tendn'";
				$result_thaymk=mysqli_query($conn,$sql_thaymk);
				echo "Thanh cong";
			}
		}
		else{
			echo "Sai mat khau";
		}

	}
 ?>
<?php include "./inc/footer.php";} ?>