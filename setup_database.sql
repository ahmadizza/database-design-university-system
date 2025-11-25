-- Tabel Fakultas
create table fakultas (
    id_fakultas varchar(3) primary key,
    nama_fakultas varchar(50)
);

-- Tabel Program Studi
create table program_studi (
    id_program_studi varchar(4) primary key,
    nama_program_studi varchar(50),
    id_fakultas varchar(3),
    foreign key (id_fakultas) references fakultas(id_fakultas) on delete set null
);

-- Tabel Mahasiswa
create table mahasiswa (
    id_mahasiswa int primary key,
    nama_mahasiswa varchar(50),
    id_program_studi varchar(4),
    foreign key (id_program_studi) references program_studi(id_program_studi) on delete set null
);

-- Tabel Dosen
create table dosen (
    id_dosen varchar(3) primary key,
    nama_dosen varchar(50),
    alamat_dosen varchar(100)
);

-- Tabel Mata Kuliah
create table mata_kuliah (
    id_mata_kuliah varchar(4) primary key,
    nama_mata_kuliah varchar(50)
);

-- Tabel Jadwal
create table jadwal (
    id_jadwal varchar(3) primary key,
    id_mata_kuliah varchar(4),
    id_dosen varchar(3),
    id_program_studi varchar(4),
    ruangan int,
    semester int,
    tahun int,
    jadwal_kuliah varchar(50),
    foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah) on delete set null,
    foreign key (id_dosen) references dosen(id_dosen) on delete set null,
    foreign key (id_program_studi) references program_studi(id_program_studi) on delete set null
);

-- Tabel Nilai
create table nilai (
    id_mahasiswa int,
    id_jadwal varchar(3),
    nilai int,
    primary key (id_mahasiswa, id_jadwal),
    foreign key (id_mahasiswa) references mahasiswa(id_mahasiswa) on delete set null,
    foreign key (id_jadwal) references jadwal(id_jadwal) on delete set null
);


INSERT INTO dosen (id_dosen, nama_dosen, alamat_dosen)
VALUES
('D1', 'Budi Santoso', 'Jl. Merpati 12'),
('D2', 'Eka Wahyu', 'Jl. Anggrek 3'),
('D3', 'Fajar I.', 'Jl. Kenanga 21'),
('D6', 'Maya K.', 'Jl. Durian 7'),
('D7', 'Anton H.', 'Jl. Mawar 22'),
('D8', 'Rudi B.', 'Jl. Melati 1'),
('D9', 'Susi Q.', 'Jl. Dahlia 43'),
('D10', 'Lukman M.', 'Jl. Tulip 5'),
('D11', 'Nina W.', 'Jl. Cempaka 33'),
('D12', 'Bambang P.', 'Jl. Lotus 14'),
('D13', 'Rita S.', 'Jl. Apel 9'),
('D14', 'Joni K.', 'Jl. Jeruk 11'),
('D15', 'Dewi P.', 'Jl. Mangga 20'),
('D16', 'Ahmad R.', 'Jl. Nanas 5'),
('D17', 'Sari M.', 'Jl. Kiwi 8'),
('D18', 'Bambang S.', 'Jl. Durian 2'),
('D19', 'Lisa Y.', 'Jl. Melon 15'),
('D20', 'Tono J.', 'Jl. Anggur 16'),
('D21', 'Hendra T.', 'Jl. Pepaya 18');

INSERT INTO fakultas (id_fakultas, nama_fakultas)
VALUES
('F1', 'Teknik'),
('F2', 'MIPA'),
('F3', 'Sains & Teknologi'),
('F4', 'Humaniora'),
('F5', 'Ekonomi & Bisnis'),
('F7', 'Hukum'),
('F8', 'Seni & Desain'),
('F9', 'Ilmu Sosial'),
('F10', 'Arsitektur');

INSERT INTO program_studi (id_program_studi, nama_program_studi, id_fakultas)
VALUES
('PS1', 'Teknik Informatika', 'F1'),
('PS2', 'Sistem Informasi', 'F1'),
('PS3', 'Matematika', 'F2'),
('PS6', 'Biologi', 'F3'),
('PS7', 'Kimia', 'F3'),
('PS8', 'Fisika', 'F3'),
('PS9', 'Sastra Inggris', 'F4'),
('PS10', 'Ekonomi', 'F5'),
('PS11', 'Psikologi', 'F4'),
('PS12', 'Hukum', 'F7'),
('PS13', 'Seni', 'F8'),
('PS14', 'Ilmu Komunikasi', 'F9'),
('PS15', 'Arsitektur', 'F10');

INSERT INTO mata_kuliah (id_mata_kuliah, nama_mata_kuliah)
VALUES
('MK1', 'Algoritma'),
('MK2', 'Struktur Data'),
('MK3', 'Basis Data'),
('MK4', 'Kalkulus'),
('MK11', 'Genetika'),
('MK12', 'Kimia Organik'),
('MK13', 'Biologi Sel'),
('MK14', 'Termodinamika'),
('MK15', 'Shakespeare'),
('MK16', 'Mikroekonomi'),
('MK17', 'Makroekonomi'),
('MK18', 'Analitik Kimia'),
('MK19', 'Psikologi Klinis'),
('MK20', 'Hukum Internasional'),
('MK21', 'Seni Rupa'),
('MK22', 'Fotografi'),
('MK23', 'Jurnalistik'),
('MK24', 'Public Relations'),
('MK25', 'Desain Arsitektur'),
('MK26', 'Teknik Bangunan'),
('MK27', 'Psikologi Sosial'),
('MK28', 'Psikologi Perkembangan'),
('MK29', 'Akuntansi'),
('MK30', 'Manajemen Keuangan');

INSERT INTO mahasiswa (id_mahasiswa, nama_mahasiswa, id_program_studi)
VALUES
(1, 'Aisyah', 'PS1'),
(2, 'Bagus', 'PS1'),
(3, 'Cinta', 'PS2'),
(4, 'Dodi', 'PS3'),
(5, 'Eka', 'PS2'),
(6, 'Andre', 'PS6'),
(7, 'Bunga', 'PS7'),
(8, 'Charlie', 'PS6'),
(9, 'Dina', 'PS8'),
(10, 'Elisa', 'PS9'),
(11, 'Farhan', 'PS10'),
(12, 'Gina', 'PS10'),
(13, 'Hana', 'PS7'),
(14, 'Indra', 'PS11'),
(15, 'Joko', 'PS12'),
(16, 'Kevin', 'PS13'),
(17, 'Lina', 'PS14'),
(18, 'Mario', 'PS15'),
(19, 'Nina', 'PS11'),
(20, 'Oka', 'PS10'),
(21, 'Vina', 'PS3'),
(22, 'Wulan', 'PS1'),
(23, 'Yudi', 'PS2'),
(24, 'Zara', 'PS1'),
(25, 'Andi', 'PS2');

INSERT INTO jadwal (id_jadwal, id_mata_kuliah, id_dosen, id_program_studi, ruangan, semester, tahun, jadwal_kuliah)
VALUES
('J1', 'MK1', 'D1', 'PS1', 101, 1, 2023, 'Senin, 10.00-12.00'),
('J2', 'MK2', 'D1', 'PS1', 102, 2, 2023, 'Selasa, 13.00-15.00'),
('J3', 'MK3', 'D2', 'PS2', 103, 1, 2023, 'Rabu, 09.00-11.00'),
('J4', 'MK4', 'D3', 'PS3', 104, 2, 2023, 'Kamis, 13.00-15.00'),
('J5', 'MK1', 'D2', 'PS2', 105, 1, 2023, 'Jumat, 10.00-12.00'),
('J6', 'MK11', 'D6', 'PS6', 110, 2, 2023, 'Senin, 08.00-10.00'),
('J7', 'MK12', 'D7', 'PS7', 111, 3, 2023, 'Selasa, 11.00-13.00'),
('J8', 'MK13', 'D6', 'PS6', 112, 1, 2023, 'Rabu, 09.00-11.00'),
('J9', 'MK14', 'D8', 'PS8', 113, 2, 2023, 'Kamis, 13.00-15.00'),
('J10', 'MK15', 'D9', 'PS9', 114, 1, 2023, 'Jumat, 10.00-12.00'),
('J11', 'MK16', 'D10', 'PS10', 115, 2, 2023, 'Senin, 14.00-16.00'),
('J12', 'MK17', 'D10', 'PS10', 116, 3, 2023, 'Selasa, 08.00-10.00'),
('J13', 'MK18', 'D7', 'PS7', 117, 1, 2023, 'Rabu, 10.00-12.00'),
('J14', 'MK19', 'D11', 'PS11', 118, 4, 2023, 'Kamis, 09.00-11.00'),
('J15', 'MK20', 'D12', 'PS12', 119, 2, 2023, 'Jumat, 11.00-13.00'),
('J16', 'MK21', 'D13', 'PS13', 120, 3, 2023, 'Senin, 08.00-10.00'),
('J17', 'MK22', 'D14', 'PS13', 121, 3, 2023, 'Selasa, 11.00-13.00'),
('J18', 'MK23', 'D15', 'PS14', 122, 4, 2023, 'Rabu, 09.00-11.00'),
('J19', 'MK24', 'D16', 'PS14', 123, 4, 2023, 'Kamis, 13.00-15.00'),
('J20', 'MK25', 'D17', 'PS15', 124, 2, 2023, 'Jumat, 10.00-12.00'),
('J21', 'MK26', 'D18', 'PS15', 125, 2, 2023, 'Senin, 14.00-16.00'),
('J22', 'MK27', 'D19', 'PS11', 126, 1, 2023, 'Selasa, 08.00-10.00'),
('J23', 'MK28', 'D11', 'PS11', 127, 1, 2023, 'Rabu, 10.00-12.00'),
('J24', 'MK29', 'D20', 'PS10', 128, 1, 2023, 'Kamis, 09.00-11.00'),
('J25', 'MK30', 'D21', 'PS10', 129, 1, 2023, 'Jumat, 13.00-15.00'),
('J26', 'MK4', 'D3', 'PS3', 135, 1, 2023, 'Senin, 08.00-10.00'),
('J27', 'MK4', 'D3', 'PS1', 136, 1, 2023, 'Selasa, 11.00-13.00'),
('J28', 'MK4', 'D3', 'PS2', 137, 1, 2023, 'Rabu, 09.00-11.00'),
('J29', 'MK1', 'D1', 'PS1', 138, 2, 2023, 'Kamis, 13.00-15.00'),
('J30', 'MK1', 'D1', 'PS2', 139, 2, 2023, 'Jumat, 10.00-12.00');

INSERT INTO nilai (id_mahasiswa, id_jadwal, nilai)
VALUES
(1, 'J1', 85),
(2, 'J2', 90),
(3, 'J3', 88),
(4, 'J4', 92),
(5, 'J5', 87),
(6, 'J6', 91),
(7, 'J7', 89),
(8, 'J8', 85),
(9, 'J9', 92),
(10, 'J10', 87),
(11, 'J11', 90),
(12, 'J12', 93),
(13, 'J13', 88),
(14, 'J14', 86),
(15, 'J15', 89),
(16, 'J16', 86),
(16, 'J17', 90),
(17, 'J18', 88),
(17, 'J19', 85),
(18, 'J20', 92),
(18, 'J21', 91),
(19, 'J22', 93),
(19, 'J23', 90),
(20, 'J24', 85),
(20, 'J25', 88),
(21, 'J26', 88),
(22, 'J27', 92),
(23, 'J28', 85),
(24, 'J29', 91),
(25, 'J30', 89);
