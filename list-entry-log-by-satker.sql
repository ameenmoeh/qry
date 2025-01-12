SELECT 
        distinct D.NIP, D.NAMA, Z.NIP NIP_PEGAWAI, B.NAMA NAMA_PEGAWAI, Z.TIME_UPDATE, Z.JENIS_DATA,
        F1.KODE_SATUAN_KERJA, F1.SATUAN_KERJA AS SATKER_1, 
        F2.SATUAN_KERJA AS SATKER_2, F2.KODE_SATUAN_KERJA AS KODE_SATKER_2, 
        F3.SATUAN_KERJA AS SATKER_3, F3.KODE_SATUAN_KERJA AS KODE_SATKER_3, 
        F4.SATUAN_KERJA AS SATKER_4, F4.KODE_SATUAN_KERJA AS KODE_SATKER_4, 
        F5.SATUAN_KERJA AS SATKER_5, F5.KODE_SATUAN_KERJA AS KODE_SATKER_5, 
        F5.KODE_GRUP_SATUAN_KERJA AS GRUP_SATKER, F1.KETERANGAN_SATUAN_KERJA
FROM
(
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Data Utama' AS JENIS_DATA FROM TM_PEGAWAI 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Pendidikan' AS JENIS_DATA FROM TR_PENDIDIKAN 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Pangkat' AS JENIS_DATA FROM TR_PANGKAT 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Jabatan' AS JENIS_DATA FROM TR_JABATAN 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Diklat' AS JENIS_DATA FROM TR_DIKLAT 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Indisipliner' AS JENIS_DATA FROM TR_INDISIPLINER 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION 
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Suami-Istri' AS JENIS_DATA FROM TD_SUAMI_ISTRI 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Anak' AS JENIS_DATA FROM TD_ANAK 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'Alamat' AS JENIS_DATA FROM TD_ALAMAT 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
        UNION
        SELECT USER_UPDATE, NIP, TIME_UPDATE, 'SKP' AS JENIS_DATA FROM TR_SKP 
        WHERE TIME_UPDATE BETWEEN '2023-02-01' AND '2023-02-28'
) Z LEFT JOIN 
TM_PEGAWAI B ON Z.NIP=B.NIP LEFT JOIN
TR_JABATAN C ON B.NO_URUT_JABATAN=C.NO_URUT AND B.NIP=C.NIP left join
TS_USER D ON Z.USER_UPDATE=D.USERNAME LEFT OUTER JOIN
TM_SATUAN_KERJA F1 ON F1.KODE_SATUAN_KERJA = LEFT(D.SATKER_KELOLA, 10) + '0000' LEFT OUTER JOIN
TM_SATUAN_KERJA F2 ON F2.KODE_SATUAN_KERJA = LEFT(D.SATKER_KELOLA, 8) + '000000' LEFT OUTER JOIN
TM_SATUAN_KERJA F3 ON F3.KODE_SATUAN_KERJA = LEFT(D.SATKER_KELOLA, 6) + '00000000' LEFT OUTER JOIN
TM_SATUAN_KERJA F4 ON F4.KODE_SATUAN_KERJA = LEFT(D.SATKER_KELOLA, 4) + '0000000000' LEFT OUTER JOIN
TM_SATUAN_KERJA F5 ON F5.KODE_SATUAN_KERJA = LEFT(D.SATKER_KELOLA, 2) + '000000000000' 