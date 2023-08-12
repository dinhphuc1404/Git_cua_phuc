<?php include 'inc/header.php';
include 'inc/sidebar.php'?>

<?php
		include 'connect.php';
		$sql_thongke="SELECT chi_tiet_hoa_don.*,sum(SoLuongMua) as 'TongBanRa',  san_pham.TenSP FROM chi_tiet_hoa_don inner join san_pham on chi_tiet_hoa_don.MaSP = san_pham.MaSP group by chi_tiet_hoa_don.MaSP;";
		$result=mysqli_query($conn,$sql_thongke);
        $result1=mysqli_query($conn,$sql_thongke);
?>

<div class="grid_10">
            <div class="box round first grid">
				<form action="xemtaikhoan.php" method="get">
                <h2>Thống kê sản phẩm bán chạy</h2>
                <div class="chart-container chart-container--size-2">
  <canvas id="chartVerticalBar"></canvas>
</div>
			   </form>
            </div>
        </div>
<script type="text/javascript">

    

    window.addEventListener('load', function () {
  var ctx = document.getElementById('chartVerticalBar').getContext('2d');
  var chart = new Chart(ctx, {

    type: 'bar',

    data: {
      labels:
      
      [
        
            <?php
                
                while ($data=mysqli_fetch_array($result)) {									
                    ?>
                          "<?php echo $data['TenSP'];?>",
                            <?php
                    }
                
            ?>
        ],
      datasets: [{
        label: "Số lượng đã bán",
        backgroundColor: 'rgba(245,34,34,.5)',
        borderColor: 'rgba(245,34,34,1)',
        data: [
            
            <?php
                
                while ($data1=mysqli_fetch_array($result1)) {									
                    ?>
                          "<?php echo $data1['TongBanRa'];?>",
                            <?php
                    }
                
            ?>
            ],
      }]
    },

    options: {
      responsive: true,
      title: {
        display: true,
        text: 'Các sản phẩm bán chạy nhất'
      },
      tooltips: {
        mode: 'index',
        intersect: false,
      },
      hover: {
        mode: 'nearest',
        intersect: true,
      },
      scales: {
        xAxes: [{
          display: true,
          scaleLabel: {
            display: false,
            labelString: 'Mois'
          }
        }],
        yAxes: [{
          ticks: {
            beginAtZero: true
          },
          display: true,
          scaleLabel: {
            display: true,
            labelString: 'Số lượng bán ra'
          }

        }]
      }
    }
  });
  var mediaQuery = window.matchMedia('(min-width: 768px)');

  function toggleAspectRatio(mq) {
    chart.options.maintainAspectRatio = mq.matches;
    chart.resize();
  }

  toggleAspectRatio(mediaQuery);

  mediaQuery.addListener(toggleAspectRatio);
})

</script>
<?php include 'inc/footer.php';?>