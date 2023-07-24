create table kursus(
    id_kursus varchar2(10) not null primary key,
    nama_kursus varchar2(20),
    harga number
);

create table departemen(
    nama_departemen varchar2(20) not null primary key,
    jumlah_karyawan number
);

create table pegawai(
    id_pegawai varchar2(10) primary key,
    id_manajer varchar2(10),
    nama_departemen varchar2(20) references departemen,
    nama_pegawai varchar2(20),
    gaji number,
    tanggal_lahir date
);

alter table pegawai add constraint pegawai_pegawai_fk foreign key (id_manajer) references pegawai (id_pegawai);

create table sertifikat(
    no_sertifikat varchar2(10) primary key,
    id_pegawai varchar2(10) not null references pegawai,
    id_kursus varchar2(10) not null references kursus,
    tanggal date
);

create table proyek(
    id_proyek varchar2(10) primary key,
    id_pegawai varchar2(10) not null references pegawai,
    nama_departemen varchar2(20) not null references departemen,
    nama_proyek varchar2(20)	
);

insert into departemen values('HARDWARE 1', 0);
insert into departemen values('HARDWARE 2', 0);
insert into departemen values('HARDWARE 3', 0);
insert into departemen values('HARDWARE 4', 0);
insert into departemen values('SOFTWARE 1', 0);
insert into departemen values('SOFTWARE 2', 0);
insert into departemen values('SOFTWARE 3', 0);
insert into departemen values('SOFTWARE 4', 0);
insert into departemen values('MARKETING 1', 0);
insert into departemen values('MARKETING 2', 0);
insert into departemen values('MARKETING 3', 0);
insert into departemen values('MARKETING 4', 0);
insert into departemen values('NETWORKING 1', 0);
insert into departemen values('NETWORKING 2', 0);
insert into departemen values('NETWORKING 3', 0);
insert into departemen values('NETWORKING 4', 0);
insert into departemen values('ANALYST 1', 0);
insert into departemen values('ANALYST 2', 0);
insert into departemen values('ANALYST 3', 0);
insert into departemen values('ANALYST 4', 0);

/
create or replace trigger karyawan_departemen
after insert on pegawai
for each row
begin
    if inserting then
        update departemen set jumlah_karyawan = jumlah_karyawan + 1
        where nama_departemen = :new.nama_departemen;
    end if;
end;
/ 
 
insert into pegawai values('PG001', '', '', 'Raisa Tampubolon', 30000000, '13/02/1971');
insert into pegawai values('PG002', 'PG001', 'HARDWARE 1', 'Cemplunk Hastuti', 20000000, '18/10/1971');
insert into pegawai values('PG003', 'PG001', 'SOFTWARE 1', 'Zulaikha Wastuti', 20000000, '19/04/1973');
insert into pegawai values('PG004', 'PG001', 'MARKETING 1', 'Uli Hidayanto', 20000000, '16/02/1975');
insert into pegawai values('PG005', 'PG002', 'HARDWARE 2', 'Salsabila Hutagalung', 10000000, '16/05/1975');
insert into pegawai values('PG006', 'PG002', 'HARDWARE 3', 'Kamila Narpati', 10000000, '26/09/1977');
insert into pegawai values('PG007', 'PG002', 'NETWORKING 1', 'Kezia Aryani', 10000000, '25/11/1977');
insert into pegawai values('PG008', 'PG002', 'NETWORKING 3', 'Edison Yulianti', 10000000, '28/09/1978');
insert into pegawai values('PG009', 'PG003', 'SOFTWARE 4', 'Dinda Sihombing', 10000000, '19/11/1979');
insert into pegawai values('PG010', 'PG003', 'SOFTWARE 3', 'Cahyono Safitri', 10000000, '24/10/1979');
insert into pegawai values('PG011', 'PG003', 'SOFTWARE 2', 'Dimas Lailasari', 10000000, '28/12/1980');
insert into pegawai values('PG012', 'PG003', 'ANALYST 3', 'Tira Habibi', 10000000, '15/05/1982');
insert into pegawai values('PG013', 'PG004', 'MARKETING 4', 'Kadir Nainggolan', 10000000, '28/07/1989');
insert into pegawai values('PG014', 'PG004', 'MARKETING 2', 'Farhunnisa Utama', 10000000, '19/09/1989');
insert into pegawai values('PG015', 'PG004', 'ANALYST 1', 'Ganjaran Maryadi', 10000000, '29/07/1990');
insert into pegawai values('PG016', 'PG004', 'ANALYST 2', 'Nadine Fujiati', 10000000, '17/04/1993');
insert into pegawai values('PG017', 'PG005', 'HARDWARE 4', 'Daryani Wibowo', 5000000, '22/12/1994');
insert into pegawai values('PG018', 'PG005', 'ANALYST 4', 'Artanto Purwanti', 5000000, '14/12/1995');
insert into pegawai values('PG019', 'PG006', 'NETWORKING 2', 'Queen Mayasari', 5000000, '14/04/1998');
insert into pegawai values('PG020', 'PG006', 'NETWORKING 4', 'Hasim Maryati', 5000000, '19/02/2000');
insert into pegawai values('PG021', 'PG007', 'MARKETING 3', 'Estiawan Wijayanti', 5000000, '13/11/1980');
insert into pegawai values('PG022', 'PG007', 'ANALYST 4', 'Koko Susanti', 5000000, '15/01/1980');
insert into pegawai values('PG023', 'PG008', 'ANALYST 4', 'Caraka Santoso', 5000000, '16/06/1981');
insert into pegawai values('PG024', 'PG008', 'ANALYST 4', 'Adika Andriani', 5000000, '15/07/1982');
insert into pegawai values('PG025', 'PG009', 'SOFTWARE 2', 'Ratih Permadi', 5000000, '14/07/1982');
insert into pegawai values('PG026', 'PG009', 'HARDWARE 3', 'Ikin Budiman', 5000000, '14/12/1983');
insert into pegawai values('PG027', 'PG010', 'ANALYST 2', 'Almira Mustofa', 5000000, '28/03/1986');
insert into pegawai values('PG028', 'PG010', 'SOFTWARE 2', 'Galak Aryani', 5000000, '21/01/1988');
insert into pegawai values('PG029', 'PG011', 'SOFTWARE 2', 'Shania Suryatmi', 5000000, '30/06/1989');
insert into pegawai values('PG030', 'PG011', 'HARDWARE 3', 'Lukman Prasetya', 5000000, '22/12/1989');
insert into pegawai values('PG031', 'PG012', 'NETWORKING 3', 'Vega Manullang', 5000000, '16/06/1990');
insert into pegawai values('PG032', 'PG012', 'MARKETING 2', 'Cahyo Prakasa', 5000000, '23/10/1990');
insert into pegawai values('PG033', 'PG013', 'HARDWARE 1', 'Citra Melani', 5000000, '20/05/1993');
insert into pegawai values('PG034', 'PG013', 'SOFTWARE 4', 'Anastasia Latupono', 5000000, '18/08/1993');
insert into pegawai values('PG035', 'PG014', 'SOFTWARE 1', 'Mila Rahayu', 5000000, '29/10/1994');
insert into pegawai values('PG036', 'PG014', 'MARKETING 1', 'Wawan Safitri', 5000000, '22/05/1995');
insert into pegawai values('PG037', 'PG015', 'MARKETING 3', 'Chandra Pratama', 5000000, '15/07/1995');
insert into pegawai values('PG038', 'PG015', 'NETWORKING 2', 'Faizah Mustofa', 5000000, '25/12/1995');
insert into pegawai values('PG039', 'PG016', 'HARDWARE 1', 'Garan Safitri', 5000000, '13/05/1999');
insert into pegawai values('PG040', 'PG016', 'HARDWARE 1', 'Hasim Samosir', 5000000, '13/08/1999');
 
insert into proyek values('PR001', 'PG003', 'SOFTWARE 1', 'AI 1');
insert into proyek values('PR002', 'PG025', 'SOFTWARE 2', 'AI 2');
insert into proyek values('PR003', 'PG026', 'SOFTWARE 3', 'AI 3');
insert into proyek values('PR004', 'PG027', 'SOFTWARE 4', 'AI 4');
insert into proyek values('PR005', 'PG028', 'NETWORKING 1', 'INTERNET 1');
insert into proyek values('PR006', 'PG002', 'HARDWARE 1', 'QUANTUM 1');
insert into proyek values('PR007', 'PG029', 'HARDWARE 2', 'QUANTUM 2');
insert into proyek values('PR008', 'PG030', 'HARDWARE 3', 'QUANTUM 3');
insert into proyek values('PR009', 'PG005', 'HARDWARE 4', 'QUANTUM 4');
insert into proyek values('PR010', 'PG006', 'NETWORKING 2', 'INTERNET 2');
insert into proyek values('PR011', 'PG031', 'SOFTWARE 1', 'ML 1');
insert into proyek values('PR012', 'PG007', 'SOFTWARE 2', 'ML 2');
insert into proyek values('PR013', 'PG008', 'SOFTWARE 3', 'ML 3');
insert into proyek values('PR014', 'PG011', 'SOFTWARE 4', 'ML 4');
insert into proyek values('PR015', 'PG012', 'NETWORKING 3', 'INTERNET 3');
insert into proyek values('PR016', 'PG013', 'MARKETING 1', 'ASIA 1');
insert into proyek values('PR017', 'PG014', 'MARKETING 2', 'ASIA 2');
insert into proyek values('PR018', 'PG015', 'MARKETING 3', 'ASIA 3');
insert into proyek values('PR019', 'PG016', 'MARKETING 4', 'ASIA 4');
insert into proyek values('PR020', 'PG004', 'NETWORKING 4', 'INTERNET 4');
insert into proyek values('PR021', 'PG033', 'MARKETING 1', 'AMERICA 1');
insert into proyek values('PR022', 'PG034', 'MARKETING 2', 'AMERICA 2');
insert into proyek values('PR023', 'PG035', 'MARKETING 3', 'AMERICA 3');
insert into proyek values('PR024', 'PG036', 'MARKETING 4', 'AMERICA 4');
insert into proyek values('PR025', 'PG017', 'NETWORKING 1', 'INTERNET 5');
insert into proyek values('PR026', 'PG037', 'SOFTWARE 1', 'OS 1');
insert into proyek values('PR027', 'PG038', 'SOFTWARE 2', 'OS 2');
insert into proyek values('PR028', 'PG021', 'SOFTWARE 3', 'OS 3');
insert into proyek values('PR029', 'PG023', 'SOFTWARE 4', 'OS 4');
insert into proyek values('PR030', 'PG024', 'SOFTWARE 1', 'OS 5');
insert into proyek values('PR031', 'PG039', 'HARDWARE 1', 'CPU 1');
insert into proyek values('PR032', 'PG040', 'HARDWARE 2', 'CPU 2');
insert into proyek values('PR033', 'PG009', 'HARDWARE 3', 'CPU 3');
insert into proyek values('PR034', 'PG010', 'HARDWARE 4', 'CPU 4');
insert into proyek values('PR035', 'PG018', 'HARDWARE 2', 'CPU 5');
insert into proyek values('PR036', 'PG019', 'HARDWARE 1', 'GPU 1');
insert into proyek values('PR037', 'PG020', 'HARDWARE 2', 'GPU 2');
insert into proyek values('PR038', 'PG029', 'HARDWARE 3', 'GPU 3');
insert into proyek values('PR039', 'PG021', 'HARDWARE 4', 'GPU 4');
insert into proyek values('PR040', 'PG022', 'HARDWARE 3', 'GPU 5');

insert into kursus values('KR001', 'BELAJAR C++ 1', 200000);
insert into kursus values('KR002', 'BELAJAR C++ 2', 250000);
insert into kursus values('KR003', 'BELAJAR JAVA 1', 250000);
insert into kursus values('KR004', 'BELAJAR JAVA 2', 300000);
insert into kursus values('KR005', 'BELAJAR AI 1', 500000);
insert into kursus values('KR006', 'BELAJAR AI 2', 700000);
insert into kursus values('KR007', 'BELAJAR MARKETING 1', 300000);
insert into kursus values('KR008', 'BELAJAR MARKETING 2', 300000);
insert into kursus values('KR009', 'BELAJAR CPU 1', 350000);
insert into kursus values('KR010', 'BELAJAR CPU 2', 400000);
insert into kursus values('KR011', 'BELAJAR GPU 1', 350000);
insert into kursus values('KR012', 'BELAJAR GPU 2', 400000);
insert into kursus values('KR013', 'BELAJAR WINDOWS 1', 300000);
insert into kursus values('KR014', 'BELAJAR WINDOWS 2', 350000);
insert into kursus values('KR015', 'BELAJAR LINUX 1', 450000);
insert into kursus values('KR016', 'BELAJAR LINUX 2', 500000);
insert into kursus values('KR017', 'BASIS DATA 1', 200000);
insert into kursus values('KR018', 'BASIS DATA 2', 400000);
insert into kursus values('KR019', 'BASIS DATA 3', 600000);
insert into kursus values('KR020', 'BASIS DATA 4', 800000);
 
 
insert into sertifikat values('ST01', 'PG002', 'KR009', '25/01/2017');
insert into sertifikat values('ST02', 'PG003', 'KR003', '13/02/2017');
insert into sertifikat values('ST03', 'PG004', 'KR007', '15/07/2017');
insert into sertifikat values('ST04', 'PG005', 'KR009', '28/04/2017');
insert into sertifikat values('ST05', 'PG006', 'KR009', '24/05/2017');
insert into sertifikat values('ST06', 'PG007', 'KR009', '13/07/2017');
insert into sertifikat values('ST07', 'PG008', 'KR009', '19/11/2017');
insert into sertifikat values('ST08', 'PG009', 'KR001', '28/10/2017');
insert into sertifikat values('ST09', 'PG010', 'KR001', '24/06/2018');
insert into sertifikat values('ST10', 'PG011', 'KR001', '27/06/2018');
insert into sertifikat values('ST11', 'PG012', 'KR001', '19/12/2018');
insert into sertifikat values('ST12', 'PG013', 'KR007', '23/11/2018');
insert into sertifikat values('ST13', 'PG014', 'KR007', '16/01/2019');
insert into sertifikat values('ST14', 'PG015', 'KR007', '20/03/2019');
insert into sertifikat values('ST15', 'PG016', 'KR007', '15/08/2019');
insert into sertifikat values('ST16', 'PG017', 'KR009', '21/09/2019');
insert into sertifikat values('ST17', 'PG018', 'KR013', '22/09/2019');
insert into sertifikat values('ST18', 'PG019', 'KR009', '22/11/2019');
insert into sertifikat values('ST19', 'PG020', 'KR013', '24/11/2019');
insert into sertifikat values('ST20', 'PG021', 'KR011', '25/11/2019');
insert into sertifikat values('ST21', 'PG022', 'KR013', '29/12/2017');
insert into sertifikat values('ST22', 'PG023', 'KR011', '19/02/2017');
insert into sertifikat values('ST23', 'PG024', 'KR013', '29/03/2017');
insert into sertifikat values('ST24', 'PG025', 'KR015', '17/04/2017');
insert into sertifikat values('ST25', 'PG002', 'KR015', '18/04/2017');
insert into sertifikat values('ST26', 'PG003', 'KR005', '22/04/2017');
insert into sertifikat values('ST27', 'PG004', 'KR008', '25/07/2017');
insert into sertifikat values('ST28', 'PG005', 'KR011', '14/10/2017');
insert into sertifikat values('ST29', 'PG006', 'KR011', '28/10/2017');
insert into sertifikat values('ST30', 'PG007', 'KR011', '25/11/2017');
insert into sertifikat values('ST31', 'PG008', 'KR011', '25/12/2017');
insert into sertifikat values('ST32', 'PG009', 'KR017', '15/01/2018');
insert into sertifikat values('ST33', 'PG010', 'KR017', '29/03/2018');
insert into sertifikat values('ST34', 'PG011', 'KR017', '15/03/2018');
insert into sertifikat values('ST35', 'PG012', 'KR017', '21/05/2018');
insert into sertifikat values('ST36', 'PG013', 'KR008', '22/07/2018');
insert into sertifikat values('ST37', 'PG014', 'KR008', '23/10/2018');
insert into sertifikat values('ST38', 'PG015', 'KR008', '15/01/2019');
insert into sertifikat values('ST39', 'PG016', 'KR008', '17/03/2019');
insert into sertifikat values('ST40', 'PG017', 'KR011', '14/07/2019');



select * from departemen;
select * from pegawai;
select * from proyek;
select * from kursus;
select * from sertifikat;

update pegawai set gaji = 15000000 where id_pegawai = 'PG009';

select nama_pegawai from pegawai join proyek using (id_pegawai)
where nama_proyek = 'AI 4';

select sum(jumlah_karyawan) from departemen;

select nama_departemen from departemen
where jumlah_karyawan =
(select min(jumlah_karyawan) from departemen);