<?php
require("function.php");


$error = "";
$success = "";


if (isset($_POST['tombol_registrasi'])) {


    // var_dump($_POST);
    if (registrasi($_POST) === true) {
        $success = "Register berhasil! Silakan login.";
        // echo $success;
    } else {
        $error = registrasi($_POST);
        // echo $error;
    }
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register | SIMBS</title>


    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


    <style>
        body {
            background: #4f4d52ff;
        }

        .login-card {
            margin-top: 25%;
            padding: 30px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">


                <div class="login-card">


                    <h3 class="text-center mb-4">Register</h3>

                    <?php if ($error) : ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <?= $error ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <?php endif; ?>


                    <?php if ($success) : ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <?= $success ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <?php endif; ?>

                    <form action="" method="POST">


                        <!-- Nama Lengkap -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="username" autocomplete="off" required>
                        </div>


                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="example@gmail.com" autocomplete="off" required>
                        </div>


                        <!-- Password -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Masukan pass..." autocomplete="off" required>
                        </div>


                        <!-- Confirm Password -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Konfirmasi Password</label>
                            <input type="password" name="confirm_password" class="form-control" placeholder="Konfirmasi pass..." autocomplete="off" required>
                        </div>
                        <p class="mt-2">Minimal 8 karakter.</p>


                        <!-- Tombol Register -->
                        <button type="submit" name="tombol_registrasi" class="btn btn-primary w-100">Register</button>
                        <p class="mt-2">Sudah punya akun? <a href="login.php">Login</a></p>
                    </form>

                </div>

            </div>
        </div>
    </div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>