<?php include "./inc/header.php"; ?>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');
 * {box-sizing: border-box}
 body{
   /*font-family: 'Noto Sans JP', sans-serif;*/
 }
.a, label{
   color: DodgerBlue;
 }
   input[type=text], input[type=password] {
   width: 100%;
   padding: 15px;
   margin: 5px 0 22px 0;
   display: inline-block;
   border: none;
   width:100%;
   resize: vertical;
   padding:15px;
   border-radius:15px;
   border:0;
   box-shadow:4px 4px 10px rgba(0,0,0,0.2);
 }
input[type=text]:focus, input[type=password]:focus {
   outline: none;
 }
hr {
   border: 1px solid #f1f1f1;
   margin-bottom: 25px;
 }
button {
   background-color: #4CAF50;
   color: white;
   padding: 14px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 100%;
   opacity: 0.9;
 }
button:hover {
   opacity:1;
 }
.cancelbtn {
   padding: 14px 20px;
   background-color: #f44336;
 }
.signupbtn {
   float: left;
   width: 100%;
   border-radius:15px;
   border:0;
   box-shadow:4px 4px 10px rgba(0,0,0,0.2);
 }
.container {
   padding: 16px;
 }
.clearfix::after {
   content: "";
   clear: both;
   display: table;
 }
</style>
<?php include "./inc/navbar.php"; ?>


<div>
	<form action="dangky.php" method="post" >
   <div class="container">
     <h1 class="a">ĐĂNG KÝ</h1>
<!--      <p>Xin hãy nhập biểu mẫu bên dưới để đăng ký.</p> -->
     <hr>
    <label for="email"><b>Tên Đăng nhập</b></label>
     <input type="text" placeholder="Nhập tên dăng nhập..." name="TenDN" required>

     <label for="email"><b>Họ Tên</b></label>
     <input type="text" placeholder="Nhập họ tên" name="HoTen" required>

     <label for="SDT"><b>SĐT</b></label>
     <input type="text" placeholder="Nhập SĐT..." name="SDT" required>

     <label for="email"><b>Địa chỉ</b></label>
     <input type="text" placeholder="Nhập Địa chỉ..." name="DiaChi" required>


     <label for="email"><b>Email</b></label>
     <input type="text" placeholder="Nhập Email..." name="Email" required>

     <label for="email"><b>Giới Tính</b></label> <br>
     <input type="radio" name="gt" value="0" checked>Nam    
     <input type="radio" name="gt" value="1">Nữ
     <br><br>

    <label for="psw"><b>Mật khẩu</b></label>
     <input type="password" placeholder="Nhập Mật Khẩu" name="MatKhau" required>
    <label for="psw-repeat"><b>Nhập Lại Mật Khẩu</b></label>
     <input type="password" placeholder="Nhập Lại Mật Khẩu" name="NhapLaiMK" required>
    <label>
       <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Nhớ Đăng Nhập
     </label>
    <div class="clearfix">
       <button type="submit" class="signupbtn" name="btn_dangky">Đăng ký</button>
     </div>
   </div>
 </form>
</div>

<?php
include "../admin/connect.php";

 if(isset($_POST['btn_dangky'])){
    $tendn =$_POST['TenDN'];
    $hoten =$_POST['HoTen'];
    $sdt =$_POST['SDT'];
    $email =$_POST['Email'];
    $diachi =$_POST['DiaChi'];
    $gt=$_POST['gt'];
    $mk=$_POST['MatKhau'];
    $nhaplaimk=$_POST['NhapLaiMK'];
    if($mk!=$nhaplaimk) {
    	echo "mật khẩu không trùng khớp";
    	return;
    }

    $sql_dn="SELECT * from tai_khoan where TenDangNhap='$tendn'";
    $result_dn=mysqli_query($conn,$sql_dn);
    if(mysqli_num_rows($result_dn)>0)
    {
    	echo 'Tên đăng nhập đã tồn tại';
    	echo "<script>Location window.history.back('dangky.php'); </script>";

    }
    else
    {

    $sql_insert="INSERT INTO tai_khoan(TenDangNhap,MatKhau,HoTen,GioiTinh,SDT,Email,DiaChi,MaLoai,TrangThai) values ('$tendn','$mk','$hoten','$gt','$sdt','$email','$diachi',1,1)";

		 	$result_insert=mysqli_query($conn,$sql_insert);

			if($result_insert)
			{
				echo "<script> window.location.href='dangnhap.php'; </script>";
				echo "dk thanh cong";
                
			}
			else
			{
				echo 'Tên dăng nhập đã tồn tại';
				
			}
		}
}
	

?>

<?php include "./inc/footer.php"; ?>