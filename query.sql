select * from mahasiswa m ;
SELECT * FROM fakultas f;
SELECT * FROM program_studi ps;
SELECT * FROM mata_kuliah mk ;
SELECT * FROM dosen d ;
SELECT * FROM jadwal j ;
SELECT * FROM nilai n ;

-- No 1
select ps.nama_program_studi, round((count(case when n.nilai >= 60 then 1 end) * 100.0) / count(*) , 2) as persentase_kelulusan
from nilai n 
join jadwal j on n.id_jadwal = j.id_jadwal 
join program_studi ps on j.id_program_studi = ps.id_program_studi 
group by ps.nama_program_studi 
order by persentase_kelulusan;

-- No 2
select mk.nama_mata_kuliah, ps.nama_program_studi,
    count(case when n.nilai between 80 and 100 then 1 end) as jumlah_A,
    count(case when n.nilai between 70 and 79 then 1 end) as jumlah_B,
    count(case when n.nilai between 60 and 69 then 1 end) as jumlah_C,
    count(case when n.nilai between 50 and 59 then 1 end) as jumlah_D,
    count(case when n.nilai < 50 then 1 end) as jumlah_E
from nilai n
join jadwal j on n.id_jadwal = j.id_jadwal
join mata_kuliah mk on j.id_mata_kuliah = mk.id_mata_kuliah
join program_studi ps on j.id_program_studi = ps.id_program_studi
group by mk.nama_mata_kuliah, ps.nama_program_studi
order by mk.nama_mata_kuliah, ps.nama_program_studi;

-- No 3
select mk.nama_mata_kuliah, string_agg(distinct d.nama_dosen, ', ') as daftar_dosen
from jadwal j 
join mata_kuliah mk on j.id_mata_kuliah = mk.id_mata_kuliah 
join dosen d on j.id_dosen = d.id_dosen 
group by mk.nama_mata_kuliah 
having count(distinct d.id_dosen) > 1;

-- No 4
select f.nama_fakultas, avg(n.nilai) as rata_rata_nilai
from fakultas f
join program_studi ps on f.id_fakultas = ps.id_fakultas
join mahasiswa m on ps.id_program_studi = m.id_program_studi
join nilai n on m.id_mahasiswa = n.id_mahasiswa
group by f.nama_fakultas, f.id_fakultas 
order by rata_rata_nilai desc;

-- No 5
with RataRataNilai as (
    select m.id_mahasiswa, m.nama_mahasiswa, ps.nama_program_studi, n.nilai, j.semester,
        avg(n.nilai) over (partition by m.id_mahasiswa, j.semester) as rata_rata_per_semester
    from mahasiswa m
    join program_studi ps on m.id_program_studi = ps.id_program_studi
    join nilai n on m.id_mahasiswa = n.id_mahasiswa
    join jadwal j on n.id_jadwal = j.id_jadwal
    where ps.id_program_studi = 'PS15' -- Ganti dengan ID program studi yang diinginkan
),
RataRataTertinggi as (
    select semester, max(rata_rata_per_semester) as rata_rata_tertinggi
    from RataRataNilai
    group by semester
)
select r.id_mahasiswa, r.nama_mahasiswa, r.nama_program_studi, r.rata_rata_per_semester
from RataRataNilai r
join RataRataTertinggi rt on r.semester = rt.semester
where r.rata_rata_per_semester = rt.rata_rata_tertinggi
group by r.id_mahasiswa, r.nama_mahasiswa, r.nama_program_studi, r.rata_rata_per_semester
having count(distinct r.semester) = (select count(distinct semester) from RataRataNilai where id_mahasiswa = r.id_mahasiswa);
