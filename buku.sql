CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `tanggal_input` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mahasiswa`
MariaDB [simbs]> select * from kategori;
+-------------+----------+
| id_kategori | kategori |
+-------------+----------+
|          10 | novel    |
|          20 | sejarah  |
|          30 | fiksi    |
|          40 | ilmiah   |
+-------------+----------+
--

insert into buku (id_buku, judul_buku, penulis, Id_kategori, tahun_terbit, tanggal_input) 
VALUES
(1, 'Bung Karno: Penyambung Lidah Rakyat Indonesia', 'Cindy Adams', 20, 1965, '2025-11-27'),
(2, 'Api Sejarah', 'Ahmad Mansur S.', 20, 2009, '2025-11-27'),
(3, 'Laskar Pelangi', 'Andrea Hirata', 30, 2005, '2025-11-27'),
(4, 'The Hobbit', 'J.R.R Tolkien', 30, 1930, '2025-11-26'),
(5, 'Thinking, Fast and Slow', 'Daniel Kahneman', 40, 2011, '2025-11-26'),
(6, 'Bumi Manusia', 'Pramoedya Ananta Toer', 30, 1980, '2025-11-27'),
(7, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 40, 2011, '2025-11-27'),
(8, 'Sejarah Dunia yang Disembunyikan', 'Jonathan Black', 20, 2007, '2025-11-27'),
(9, 'The Lord of the Rings', 'J.R.R. Tolkien', 30, 1954, '2025-11-27'),
(10, 'Emotional Intelligence', 'Daniel Goleman', 40, 1995, '2025-11-27');
--
-- Indexes for dumped tables

CREATE TABLE user (
id_user INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL
);


SELECT
    buku.id_buku, buku.judul_buku, buku.penulis, kategori.kategori, buku.tahun_terbit, buku.tanggal_input
FROM buku
JOIN kategori
    ON buku.id_kategori = kategori.id_kategori;



+---------+-----------------------------------------------+-----------------------+----------+--------------+---------------+
| id_buku | judul_buku                                    | penulis               | kategori | tahun_terbit | tanggal_input |
+---------+-----------------------------------------------+-----------------------+----------+--------------+---------------+
|       1 | Bung Karno: Penyambung Lidah Rakyat Indonesia | Cindy Adams           | sejarah  |         1965 | 2025-11-27    |
|       2 | Api Sejarah                                   | Ahmad Mansur S.       | sejarah  |         2009 | 2025-11-27    |
|       3 | Laskar Pelangi                                | Andrea Hirata         | fiksi    |         2005 | 2025-11-27    |
|       4 | The Hobbit                                    | J.R.R Tolkien         | fiksi    |         1930 | 2025-11-26    |
|       5 | Thinking, Fast and Slow                       | Daniel Kahneman       | ilmiah   |         2011 | 2025-11-26    |
|       6 | Bumi Manusia                                  | Pramoedya Ananta Toer | fiksi    |         1980 | 2025-11-27    |
|       7 | Sapiens: A Brief History of Humankind         | Yuval Noah Harari     | ilmiah   |         2011 | 2025-11-27    |
|       8 | Sejarah Dunia yang Disembunyikan              | Jonathan Black        | sejarah  |         2007 | 2025-11-27    |
|       9 | The Lord of the Rings                         | J.R.R. Tolkien        | fiksi    |         1954 | 2025-11-27    |
|      10 | Emotional Intelligence                        | Daniel Goleman        | ilmiah   |         1995 | 2025-11-27    |
+---------+-----------------------------------------------+-----------------------+----------+--------------+---------------+
10 rows in set (0.00 sec)



UPDATE buku 
SET kategori = 'fiksi'
WHERE judul_buku = 'Laskar Pelangi';

UPDATE buku 
SET kategori = 'sejarah'
WHERE judul_buku = 'Bung Karno: Penyambung Lidah Rakyat Indonesia';

UPDATE buku 
SET kategori = 'sejarah'
WHERE judul_buku = 'Api Sejarah';

UPDATE buku 
SET kategori = 'fiksi'
WHERE judul_buku = 'The Hobbit';

UPDATE buku 
SET kategori = 'ilmiah'
WHERE judul_buku = 'Thinking, Fast and Slow';

UPDATE buku 
SET kategori = 'fiksi'
WHERE judul_buku = 'Bumi Manusia';

UPDATE buku 
SET kategori = 'ilmiah'
WHERE judul_buku = 'Sapiens: A Brief History of Humankind';

UPDATE buku 
SET kategori = 'sejarah'
WHERE judul_buku = 'Sejarah Dunia yang Disembunyikan ';

UPDATE buku 
SET kategori = 'fiksi'
WHERE judul_buku = 'The Lord of the Rings ';

UPDATE buku 
SET kategori = 'ilmiah'
WHERE judul_buku = 'Emotional Intelligence ';

ALTER TABLE kategori ADD COLUMN tanggal_input DATE;

UPDATE kategori 
SET tanggal_input = '2025-11-19'
WHERE kategori = 'ilmiah';

UPDATE kategori 
SET tanggal_input = '2025-11-20'
WHERE kategori = 'fiksi';

UPDATE kategori 
SET tanggal_input = '2025-11-17'
WHERE kategori = 'sejarah';
--
-- Indexes for table `mahasiswa`
-- --
-- ALTER TABLE `buku`
--   ADD PRIMARY KEY (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
-- ALTER TABLE `buku`
--   MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
