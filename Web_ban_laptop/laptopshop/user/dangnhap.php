
<?php include "./inc/header.php";

if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
include "../admin/connect.php";
?>
<div id="kq">
<?php
 if(isset($_POST['btn_dangnhap'])){
    $tendn =$_POST['txttendn'];
    $mk =$_POST['txtmk'];
    if($tendn=="" || $mk=="")
    {
        echo "Ten dang nhap hoac mat khau khong duoc de trong";
    }
    else
    {
    $sql_dn="SELECT * from tai_khoan where TenDangNhap='$tendn' and MatKhau='$mk' and TrangThai=1";
    $capcha=$_POST['txtcapcha'];
    if($capcha==$_SESSION['cap'])
        {
    $result_dn=mysqli_query($conn,$sql_dn);
    if(mysqli_num_rows($result_dn)>0)
    {

        $_SESSION['tendn']=$tendn;
        echo "<script> window.location.href='home.php'; </script>";     

    }
    else 
        echo "Ten dang nhap hoac mat khau khong chinh xac";
    }
        else echo 'capcha không chính xác';
    }
    }
    include "capcha.php";
?>

</div>

<style>
* {
margin: 0;
padding: 0;
}
.form-tt {
align-content: center;
margin-top: 50px;
width: 50%;
border-radius: 10px;
overflow: hidden;
padding: 55px 55px 37px;
background: #9152f8;
background: -webkit-linear-gradient(top,#7579ff,#b224ef);
background: -o-linear-gradient(top,#7579ff,#b224ef);
background: -moz-linear-gradient(top,#7579ff,#b224ef);
background: linear-gradient(top,#7579ff,#b224ef);
text-align: center;
}
.form-tt h2 {
font-size: 30px;
color: #fff;
line-height: 1.2;
text-align: center;
text-transform: uppercase;
display: block;
margin-bottom: 30px;
}

.form-tt input[type=text], .form-tt input[type=password] {
font-family: Poppins-Regular;
font-size: 16px;
color: #fff;
line-height: 1.2;
display: block;
width: calc(100% - 10px);
height: 45px;
background: 0 0;
padding: 10px 0;
border-bottom: 2px solid rgba(255,255,255,.24)!important;
border: 0;
outline: 0;
}
.form-tt input[type=text]::focus, .form-tt input[type=password]::focus {
color: red;
}
.form-tt input[type=password] {
margin-bottom: 20px;
}
.form-tt input::placeholder {
color: #fff;
}
.checkbox {
display: block;
}
.form-tt input[type=submit] {
font-size: 16px;
color: #555;
line-height: 1.2;
padding: 0 20px;
min-width: 120px;
height: 50px;
border-radius: 25px;
background: #fff;
position: relative;
z-index: 1;
border: 0;
outline: 0;
display: block;
margin: 30px auto;
}
#checkbox {
display: inline-block;
margin-right: 10px;
}
.checkbox-text {
color: #fff;
}
.psw-text {
color: #fff;
}
</style>

<?php include "./inc/navbar.php"; ?>

<div style="margin-left: 500px;">
<div class="form-tt" style="background: -webkit-linear-gradient(#FF0033,#FF0000);">
<h2>Đăng nhập</h2>
<form action="dangnhap.php" method="post" name="dang-ky">

<input type="text" name="txttendn" placeholder="Nhập tên đăng nhập" />

<input type="password" name="txtmk" placeholder="Nhập mật khẩu" />

<input type="text" name="txtcapcha" placeholder="Mã xác nhận" />
<div style="background_color:red;color: yellow;"><?php echo $_SESSION['cap'];?></div>

<input type="checkbox" id="checkbox" name="checkbox"><label class="checkbox-text">Nhớ đăng nhập lần sau</label>
<input type="submit" name="btn_dangnhap" value="Đăng nhập" />

<a href="dangky.php"><label class="psw-text">Tạo tài khoản mới</label></a>
</form>

</div>
</div>


<?php include "./inc/footer.php"; ?>