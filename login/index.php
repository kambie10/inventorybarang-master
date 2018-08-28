
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Inventori Login</title>

  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
<div class="login-page">
  <div class="form">
  <div class="form-top-left">
                              <h3>Inventori Barang</h3>
                              
                            </div>

    <form method="POST">

      <input type="text" name="username" id="username" placeholder="username"/>
      <input type="password" name="password" id="password" placeholder="password"/>
      <button type="submit" name="login">login</button>
      
    </form>
  </div>
</div>
 <script src="js/index.js"></script>
 </body>
</html>


<?php  
@session_start(); 
include "../class/class.php";
  if (isset($_POST['login'])) {
    $cek = $admin->login_admin($_POST['username'],$_POST['password']);
    if ($cek == true) {
      echo "<script>window.location='../index.php';</script>";
    }//jika salah atau tidak benar maka login ulang
    else{
      echo "<script>alert('Login Gagal, Username dan Password Salah!');</script>";
    }
  }
?>
