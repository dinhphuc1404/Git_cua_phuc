<?php include 'inc/header.php';
include 'inc/sidebar.php'?>
		<?php
		include 'connect.php';
		$sql_xemthue="SELECT * FROM thue";
		$result_thue=mysqli_query($conn,$sql_xemthue);
		?>

        <div class="grid_10">
            <div class="box round first grid">
				<form action="xemdanhsachthue.php" method="get">
                <h2>Danh sách thuế</h2>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>STT</th>
							<th>Tên thuế</th>
							<th>Tỷ lệ thuế</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<?php 
					$stt=1;
				while ($data=mysqli_fetch_array($result_thue)) {									
				?>
						<tr class="odd gradeX">
							<td><?php echo $stt++;?></td>
							<td><?php echo $data['TenThue'];?></td>
							<td><?php echo $data['TyLeThue'];?></td>
							<td><a href="suathue.php?id=<?php echo $data['MaThue']?>">Edit</a> || <a href="xoathue.php?id=<?php echo $data['MaThue']?>" onclick="return comfirm('Ban co muon xoa khong?')">Delete</a></td>
						</tr>
						<?php
				}
				?>
     
					</tbody>
				</table>
               </div>
			   </form>
            </div>
        </div>
<script type="text/javascript">
	$(document).ready(function () {
	    setupLeftMenu();

	    $('.datatable').dataTable();
	    setSidebarHeight();
	});
</script>
<?php include 'inc/footer.php';?>

