<?php include "./inc/header.php"; ?>
<?php include "./inc/navbar.php"; ?>

    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center">
            <h2 align="center" style="padding: 30px 0;">SẢN PHẨM CỦA CỬA HÀNG</h2>
        </div>
    </div>
<?php

        include '../admin/connect.php';
        
        $sql_xemsp="SELECT * FROM san_pham where TrangThai=1 ORDER BY DonGia";
        
        if (!isset ($_GET['page']) ) {

$page = 1;
} else {
$page = $_GET['page'];
}
        $results_per_page = 9;
        $page_first_result = ($page-1) * $results_per_page;
        $result_sp=mysqli_query($conn,$sql_xemsp);
        $number_of_result = mysqli_num_rows($result_sp);
        $number_of_page = ceil ($number_of_result / $results_per_page);
        $query = $sql_xemsp. ' LIMIT ' . $page_first_result . ',' . $results_per_page;
        $result = mysqli_query($conn, $query);
        ?>

    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-3 col-md-12">
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Lọc theo giá</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="price-all">
                            <label class="custom-control-label" for="price-all">Tất cả</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-1">
                            <label class="custom-control-label" for="price-1">Dưới 5.000.000</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-2">
                            <label class="custom-control-label" for="price-2">5.000.000-10.000.000</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-3">
                            <label class="custom-control-label" for="price-3">10.000.000-20.000.000</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-4">
                            <label class="custom-control-label" for="price-4">20.000.000-30.000.000</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="price-5">
                            <label class="custom-control-label" for="price-5">Trên 30.000.000</label>
                        </div>
                    </form>
                </div>
                
            </div>
           
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Tìm kiếm theo tên">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                            </form>
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sắp xếp theo
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="sanpham.php?sort=TenSP&page=1">Tên sản phẩm</a>
                                    <a class="dropdown-item" href="sanpham.php?sort=DonGia&page=1">Đơn giá</a>
                                    <a class="dropdown-item" href="sanpham.php?sort=MaSP&page=1">Mới nhất</a>
                                </div>
                            </div>
                        </div>
                    </div>
                     <?php 
                while ($data2=mysqli_fetch_array($result)) {                                  
                ?>


                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src='<?php echo "../admin/".$data2['HinhAnh'] ?>' alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><?php echo $data2['TenSP']; ?></h6>
                                <div class="d-flex justify-content-center">
                                    <h6><?php echo number_format($data2['DonGia'],0,'.','.'); ?> vnđ</h6><h6 class="text-muted ml-2"></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="chitietsp.php?id=<?php echo $data2['MaSP']; ?>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết</a>
                                <a href="cart.php?id=<?php echo $data2['MaSP']; ?>" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
                            </div>
                        </div>
                    </div>
                     <?php } ?>
                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                            <li class="page-item disabled">
                              <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                              </a>
                            </li>
                            <?php
                            if(isset($_GET['page'])) {$pageid=$_GET['page'];} else $pageid=1; 
                            for($page = 1; $page<= $number_of_page; $page++)  {
                                // code...
                             ?>
                            <li class="page-item <?php if($pageid==$page) echo 'active'; ?>"><a class="page-link" href="sanpham.php?page=<?php echo $page ?>"><?php echo $page ?></a></li>
                            <?php } ?>
                            
                            <li class="page-item">
                              <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                              </a>
                            </li>

                        
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>


    
<?php include "./inc/footer.php"; ?>