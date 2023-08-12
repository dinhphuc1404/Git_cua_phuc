<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
        <div class="grid_10">
            <div class="box round first grid">
              
                <h2>THÊM MỚI THUẾ</h2>
               <div class="block copyblock"> 
                 <form action="themthue.php" method="get">
                    <table class="form">					
                        
                        <tr>
                        <td>
                                Tên Thuế :<input type="text" placeholder="Nhập Tên Thuế..." class="medium" name="txttenthue" />
                        </td>
                        </tr>
                        <tr>
                        <td>
                        	Tỷ Lệ Thuế :<input type="number"  placeholder="Nhập Tỷ Lệ Thuế..." class="medium" name="txttylethue" />
						</td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" name="btnLuu" Value="Lưu" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
        <?php 
		include 'connect.php';
		 $a=filter_input(INPUT_GET,'btnHuy');
		 $b=filter_input(INPUT_GET,'btnLuu');
		 if(isset($a))
		 {}
			if(isset($b))
		 {
		 	
		 	$tenthue=filter_input(INPUT_GET,'txttenthue');		 	
		 	$tylethue=filter_input(INPUT_GET,'txttylethue');
		 	
		 	$sql_insert="INSERT INTO thue(TenThue,TyLeThue) values ('$tenthue','$tylethue')";
		 	$result_insert=mysqli_query($conn,$sql_insert);
			if($result_insert)
			{
				echo "<script> window.location.href='xemdanhsachthue.php'; </script>";
                
			}
			else
			{
				echo 'Them khong thanh cong';
			}
		 			  
		 
		 }

		 ?>
<?php include 'inc/footer.php';?>
