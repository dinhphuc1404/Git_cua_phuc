<?php include "./inc/header.php";
if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
include "./inc/navbar.php"; ?>


    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Chi tiết sản phẩm</h1>
            <!-- <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Chi tiết sản phẩm</p>
            </div> -->
        </div>
    </div>
    <!-- Page Header End -->

    <?php 
        include '../admin/connect.php';
        $idsp=filter_input(INPUT_GET, 'id');
        $sql_chitietsp="SELECT *,avg(SoSao) as Sao, COUNT(d.SoSao) as Dem FROM san_pham s,danhgia d where s.MaSP=d.MaSP and s.MaSP='$idsp'";
        $result_chitietsp=mysqli_query($conn,$sql_chitietsp);
        ?>

    <!-- Shop Detail Start -->
    <?php
                if ($result_chitietsp){
                    while($data=mysqli_fetch_array($result_chitietsp)){
                        $madm=$data['MaDM'];

                 ?>             
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src='<?php echo "../admin/".$data['HinhAnh'] ?>' alt="Image">
                        </div>
                        <!-- <div class="carousel-item">
                            <img class="w-100 h-100" src="img/product-2.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/product-3.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/product-4.jpg" alt="Image">
                        </div> -->
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold"><?php echo $data['TenSP']; ?></h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">

                        <?php for($i=0;$i<$data['Sao'];$i++) {
                            if($data['Sao']-$i>=1){?>
                        <small class="fas fa-star"></small>
                    <?php }
                        else if($data['Sao']-$i>=0.5){?>
                            <small class="fas fa-star-half-alt"></small>
                        <?php }} ?>
                       <!--  <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small> -->
                    </div>
                    <small class="pt-1">(<?php echo $data['Dem']; ?> đánh giá)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4"><?php echo number_format($data['DonGia'],0,'.','.'); ?> vnđ</h3>
                <p class="mb-4">Mô tả: <?php echo $data['MoTa']; ?></p>
                <!-- <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                    <form>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-1" name="size">
                            <label class="custom-control-label" for="size-1">XS</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-2" name="size">
                            <label class="custom-control-label" for="size-2">S</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-3" name="size">
                            <label class="custom-control-label" for="size-3">M</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-4" name="size">
                            <label class="custom-control-label" for="size-4">L</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-5" name="size">
                            <label class="custom-control-label" for="size-5">XL</label>
                        </div>
                    </form>
                </div> -->
                <!-- <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
                    <form>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-1" name="color">
                            <label class="custom-control-label" for="color-1">Black</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-2" name="color">
                            <label class="custom-control-label" for="color-2">White</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-3" name="color">
                            <label class="custom-control-label" for="color-3">Red</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-4" name="color">
                            <label class="custom-control-label" for="color-4">Blue</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-5" name="color">
                            <label class="custom-control-label" for="color-5">Green</label>
                        </div>
                    </form>
                </div> -->
                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus" >
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control bg-secondary text-center" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <a href="cart.php?id=<?php echo $data['MaSP']; ?>" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i>Thêm vào giỏ hàng</a>
                </div>
                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
                    <!-- <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a> -->
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Đánh giá (<?php echo $data['Dem']; ?>)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Mô tả sản phẩm</h4>
                        <p> <?php echo $data['MoTa'] ?></p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Additional Information</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                  </ul> 
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                  </ul> 
                            </div>
                        </div>
                    </div>

                    <?php       
                     $sql_xemdg="SELECT * FROM danhgia where MaSP='$idsp'";
                     $result_dg=mysqli_query($conn,$sql_xemdg);
                    ?>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4"><?php echo $data['Dem']; ?> đánh giá cho <?php echo $data['TenSP']; ?></h4>
                                <?php 
                  
                                while ($dg=mysqli_fetch_array($result_dg)) {                                  
                                ?>

                                <div class="media mb-4">
                                    <img src="img/user.png" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                    <div class="media-body">
                                        <h6><?php echo $dg['TenDangNhap']; ?><small> - <i><?php echo $dg['NgayDG']; ?></i></small></h6>
                                        <div class="text-primary mb-2">
                                            <?php for($i=0;$i<$dg['SoSao'];$i++) {
                            if($dg['SoSao']-$i>=1){?>
                        <small class="fas fa-star"></small>
                    <?php }
                        else if($dg['SoSao']-$i>=0.5){?>
                            <small class="fas fa-star-half-alt"></small>
                        <?php }} ?>
                                        </div>
                                        <p><?php echo $dg['NoiDung']; ?></p>
                                    </div>
                                </div>
                            <?php } ?>

                            </div>

                            <div class="col-md-6">
                                <form method="post" action="chitietsp.php?id=<?php echo $idsp; ?>">
                                <h4 class="mb-4">ĐÁNH GIÁ</h4>
                                <small>Your email address will not be published. Required fields are marked *</small>
                                <div class="d-flex my-3">
                                    <p class="mb-0 mr-2">Số sao * :</p>
                                    <div class="text-primary">
                                       <!-- <button type="submit"><i class="far fa-star"></i></button> 
                                        <button><i class="far fa-star"></i></button> 
                                        <button><i class="far fa-star"></i></button> 
                                        <button><i class="far fa-star"></i></button> 
                                        <button><i class="far fa-star"></i></button> 
                                        -->
                                        <input type="number" name="txtsosao">
                                    </div>
                                </div>
                                
                                    <div class="form-group">
                                        <label for="message">Nội dung đánh giá *</label>
                                        <textarea id="message" cols="30" rows="5" class="form-control" name="txtnoidung"></textarea>
                                    </div>
                                    <!-- <div class="form-group">
                                        <label for="name">Your Name *</label>
                                        <input type="text" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Your Email *</label>
                                        <input type="email" class="form-control" id="email">
                                    </div> -->
                                    <div class="form-group mb-0">
                                        <input type="submit" name="btnguidg" value="Gửi đánh giá" class="btn btn-primary px-3">
                                    </div>
                                </form>


                                <?php 
                                
                                if(isset($_POST['btnguidg']))
                                {
                                    if(!isset($_SESSION['tendn'])) echo "<script>window.location.href='dangnhap.php';</script>";
                                    else
                                    {
                                        $today = date("Y-m-d");
                                        $tendn = $_SESSION['tendn'];
                                        $sosao= $_POST['txtsosao'];
                                        $noidung=$_POST['txtnoidung'];

                                        $sql_insert="INSERT INTO danhgia(MaSP,TenDangNhap,SoSao,NoiDung,NgayDG,TrangThai) values ('$idsp','$tendn','$sosao','$noidung','$today',1)";
            $result_insert=mysqli_query($conn,$sql_insert);
            if($result_insert)
            {
                echo "<script> window.location.href='chitietsp.php?id=".$idsp."'; </script>";
                
            }
            else
            {
                echo 'Them khong thanh cong';
            }
                                    }
                            }


                                 ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->

<?php }} ?>

<?php
        
        $sql_xemsp="SELECT * FROM san_pham where MaDM='$madm'";
        $result_sp=mysqli_query($conn,$sql_xemsp);
        ?>


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Sản Phẩm Tương Tự</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">

                    <?php 
                  
                while ($data1=mysqli_fetch_array($result_sp)) {                                  
                ?>

                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src='<?php echo "../admin/".$data1['HinhAnh'] ?>' alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3"><?php echo $data1['TenSP']; ?></h6>
                            <div class="d-flex justify-content-center">
                                <h6><?php echo number_format($data1['DonGia'],0,'.','.'); ?> vnđ</h6><h6 class="text-muted ml-2"></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="chitietsp.php?id=<?php echo $data1['MaSP']; ?>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết</a>
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ hàng</a>
                        </div>
                    </div>
                <?php } ?>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->

<?php include "./inc/footer.php"; ?>