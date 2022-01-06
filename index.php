<!DOCTYPE html>
<html lang="en">
<head>
    <title>WisataID</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->
    <?php
        include 'config/database.php';
        $ambil_kategori = mysqli_query ($kon,"select * from profil limit 1");
        $row = mysqli_fetch_assoc($ambil_kategori); 
        $nama_website = $row['nama_website'];
        $copy_right = $row['nama_website'];
    ?>
    <a class="navbar-brand" href="index.php?halaman=home"><?php echo $nama_website;?></a>

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
        <?php
            include 'config/database.php';
            $sql="select * from kategori";
            $hasil=mysqli_query($kon,$sql);
            while ($data = mysqli_fetch_array($hasil)):
        ?>
            <li class="nav-item">
                <a class="nav-link" href="tampil.php?halaman=home&kategori=<?php echo $data['id_kategori']; ?>"><?php echo $data['nama_kategori'];?></a>
            </li>
            <?php endwhile; ?>
        </ul>
        <ul class="navbar-nav  ml-auto">
            <?php 
                session_start();
                if (isset($_SESSION["id_pengguna"])) {
                        echo " <li><a class='nav-link' href='admin/index.php?halaman=kategori'>Halaman Admin</a></li>";
                }else {
                    echo " <li><a class='nav-link' href='tampil.php?halaman=login'><span class='fas fa-log-in'></span> Login</a></li>";
                }
            ?>
        </ul>
    </div>
   
</nav>
<div class="jumbotron text-center">

<?php
    $judul="Selamat Datang di Yogayakarta";   
    include 'config/database.php';
    if (isset($_GET['id'])) {
        $sql="select * from wisata where status=1 and id_wisata=".$_GET['id']."";
        $hasil=mysqli_query($kon,$sql);
        $data = mysqli_fetch_array($hasil);
        $judul=$data['nama_wisata'];  
    }else if (isset($_GET['kategori'])){
        $sql="select * from kategori where id_kategori=".$_GET['kategori']."";
        $hasil=mysqli_query($kon,$sql);
        $data = mysqli_fetch_array($hasil);
        $judul=$data['nama_kategori'];  
    }

?>
    <h2><?php echo $judul;?></h2>

</div>
<div>
<section id="page-top">
      <!-- Carousel -->
      <div id="main-slide" class="carousel slide" dataride="carousel">
        <div id="productCarousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
              <li data-target="#productCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#productCarousel" data-slide-to="1"></li>
              <li data-target="#productCarousel" data-slide-to="2"></li>
              <li data-target="#productCarousel" data-slide-to="3"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
              <div class="item active">
                  <img src="https://travelspromo.com/wp-content/uploads/2019/12/Tugu-Jogja-Simbol-Kota-Jogja-Meltyan-Photography.jpg" alt="slider" style="width:100%;height:800px;">
              </div>
              <div class="item">
                  <img src="https://paketwisatajogja75.com/wp-content/uploads/2018/09/prambanan.jpg" alt="slider" style="width:100%;height:800px;">
              </div>
              <div class="item">
                  <img src="http://duniatraveling.co.id/wp-content/uploads/2017/08/pantai-parangtritis-sewa-mobil-yogyakarta.jpg" alt="slider" style="width:100%;height:800px;">
              </div>
              <div class="item">
                  <img src="https://jogya.com/wp-content/uploads/2015/12/102-pantai-gunungkidul-jogja.jpg" alt="slider" style="width:100%;height:800px;">
              </div>
          </div>
          <a class="left carousel-control" href="#productCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#productCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
          </a>
        </div>
      <!--Indicators-->
        
      </div>
      <!-- /carousel -->
    </section>
</div>
<div class="container">
<?php 
    if(isset($_GET['halaman'])){
        $halaman = $_GET['halaman'];
        switch ($halaman) {
            case 'home':
                include "home.php";
                break;
            case 'wisata':
                include "wisata.php";
                break;
            case 'login':
                include "login.php";
                break;
            default:
            echo "<center><h3>Maaf. Halaman tidak di temukan !</h3></center>";
            break;
        }
    }else {
        include "home.php";
    }
?>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p> Lebih asik dengan <?php echo $nama_website;?> </p>
</div>
</body>
</html>