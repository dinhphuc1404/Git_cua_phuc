<?php
    session_start();
    include '../admin/connect.php'; 
   $_SESSION['cart'];  
   $bttt=filter_input(INPUT_POST,'btnthanhtoan');
   if(isset($bttt))
   {     $tendangnhap=$_SESSION['tendn'];
   		 $TenKH=filter_input(INPUT_POST,'txthoten');   		 	
		 $SoDienThoai=filter_input(INPUT_POST,'txtsdt');
		 $DiaChi=filter_input(INPUT_POST,'txtdiachi');		 
		 $GhiChu=filter_input(INPUT_POST,'txtghichu');		 
		 $NgayHD = date("Y-m-d");
		 $sql_inserthd="insert into hoa_don(TenDangNhap,NgayHD,TrangThai,GhiChu,HoTenNN,SDT,DiaChi) values('$tendangnhap','$NgayHD',0,'$GhiChu','$TenKH','$SoDienThoai','$DiaChi')";
		 $result_inserthd=mysqli_query($conn,$sql_inserthd);
		
		$qrcthd = "select MaHD from hoa_don order by MaHD desc limit 1";
        $kq = mysqli_query($conn,$qrcthd);
        $row = mysqli_fetch_array($kq);
        $MaHD = $row['MaHD'];
        foreach ($_SESSION['cart'] as $ds) {
            $MaSP = $ds['idsp'];
            $dongia = $ds['dongia'];
            $TyLeKM = 0;
            $Sl = $ds['sl'];
            $sql_insertcthd = "insert into chi_tiet_hoa_don (MaHD,MaSP,TenKH,GiaGoc,TyLeKM,SoLuongMua) values('$MaHD','$MaSP','$TenKH','$dongia','$TyLeKM','$Sl')";
            $result_insertcthd=mysqli_query($conn,$sql_insertcthd);
            unset($_SESSION['cart']);
            if($result_insertcthd)
		{
				echo "Đặt hàng thành công";
                echo "<a href='home.php'>Trang chủ</a>";



		}
		else
		{        echo "Đặt hàng không thành công";

		}

        }
        
}
   ?>

