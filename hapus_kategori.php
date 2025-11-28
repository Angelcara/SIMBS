<?php 


    session_start();
    if( !isset($_SESSION["login"]) ) {
        header("Location: login.php");
        exit;
    }

    
    require("function2.php");
    $id_kategori = $_GET['id_kategori'];
    // $kategori = $query;

    // jika query hapus data yang ada di fungsi hapus_data() di function.php bernilai true (berhasil dihapus)
    // maka tampilkan alert bahwa data berhasil dihapus
    if(hapus_kategori($id_kategori) > 0){
        echo "
            <script>
                alert('Data berhasil dihapus dari database!');
                document.location.href = 'index_kategori.php';
            </script>
        ";
    }else{
        echo "
            <script>
                alert('Data gagal dihapus dari database!');
                document.location.href = 'index_kategori.php';
            </script>
        ";
    }
?>
