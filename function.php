<?php
// koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "simbs");

// cek koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// fungsi untuk menampilkan data
function query($query)
{
    global $conn;

    $result = mysqli_query($conn, $query);
    if (!$result) {
        die("Query Error: " . mysqli_error($conn));
    }

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

// fungsi untuk menambahkan data
function tambah_data($data)
{
    global $conn;

    $judul_buku   = $data['judul_buku'];
    $penulis      = $data['penulis'];
    $id_kategori  = $data['id_kategori']; // dari form
    $tahun_terbit = $data['tahun_terbit'];
    $tanggal_input = $data['tanggal_input'];

    // ambil nama kategori dari tabel kategori
    $result = mysqli_query($conn, "SELECT kategori FROM kategori WHERE id_kategori = $id_kategori");
    $row = mysqli_fetch_assoc($result);
    $kategori = $row['kategori'];

    $query = "INSERT INTO buku (judul_buku, penulis, kategori, tahun_terbit, tanggal_input)
              VALUES ('$judul_buku', '$penulis', '$kategori', '$tahun_terbit', '$tanggal_input')";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}


// fungsi untuk menghapus data
function hapus_data($id_buku)
{
    global $conn;
    $query = "DELETE FROM buku WHERE id_buku = $id_buku";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

// fungsi untuk mengubah data
function ubah_data($data)
{
    global $conn;

    $id_buku      = $data['id_buku'];
    $judul_buku   = $data['judul_buku'];
    $penulis      = $data['penulis'];
    $kategori     = $data['kategori'];
    $tahun_terbit = $data['tahun_terbit'];
    $tanggal_input = $data['tanggal_input'];

    $query = "UPDATE buku SET
                judul_buku   = '$judul_buku',
                penulis      = '$penulis',
                kategori     = '$kategori',
                tahun_terbit = '$tahun_terbit',
                tanggal_input = '$tanggal_input'
              WHERE id_buku = $id_buku";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

// fungsi untuk mencari data
function search_data($keyword)
{
    global $conn;
    $query = "SELECT * FROM buku
              WHERE
              judul_buku LIKE '%$keyword%' OR
              penulis LIKE '%$keyword%' OR
              kategori LIKE '%$keyword%' OR
              tanggal_input LIKE '%$keyword%' OR
              tahun_terbit LIKE '%$keyword%'";
    return query($query);
}

// fungsi register
function registrasi($data_registrasi)
{
    global $conn;

    $username = strtolower($data_registrasi['username']);
    $email = $data_registrasi['email'];
    $password = mysqli_real_escape_string($conn, $data_registrasi['password']);
    $confirm_password = mysqli_real_escape_string($conn, $data_registrasi['confirm_password']);

    // cek panjang password minimal 8 karakter
    if (strlen($password) < 8) {
        return "Password minimal 8 karakter!";
    }

    // cek username sudah ada atau belum
    $query = mysqli_query($conn, "SELECT username FROM user WHERE username = '$username'");
    $result = mysqli_fetch_assoc($query);
    if ($result != NULL) {
        return "Username sudah terdaftar di database!";
    }

    if ($password !== $confirm_password) {
        return "Konfirmasi password tidak sesuai!";
    }

    // enkripsi password
    $password = password_hash($password, PASSWORD_DEFAULT);

    // tambahkan user baru ke database
    mysqli_query($conn, "INSERT INTO user (id_user, username, email, password) VALUES('', '$username', '$email', '$password')");

    return true;
}


// fungsi login
function login($data)
{
    global $conn;

    $username = $data['username'];
    $password = $data['password'];

    $query = "SELECT * FROM user WHERE username = '$username'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);

        if (password_verify($password, $row["password"])) {
            $_SESSION['login'] = true;
            $_SESSION['username'] = $row['username'];
            return true;
        } else {
            return "Password salah!";
        }
    } else {
        return "Username tidak ditemukan!";
    }
}
