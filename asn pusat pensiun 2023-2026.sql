SELECT 
A.NIP_BARU, A.NAMA_LENGKAP, CONVERT(VARCHAR, A.TMT_PENSIUN,23) AS TMT_PENSIUN, YEAR(a.TMT_PENSIUN) as THN_PENSIUN, 
A.JABATAN, f.LEVEL_JABATAN, 
a.KODE_SATUAN_KERJA, E.SATUAN_KERJA AS SATKER1, D.SATUAN_KERJA AS SATKER2, A.SATUAN_KERJA, MUTASI
FROM vwDATA_PEGAWAI A 
LEFT JOIN TM_SATUAN_KERJA d ON d.KODE_SATUAN_KERJA=LEFT(a.KODE_SATUAN_KERJA,6)+'00000000' 
LEFT JOIN TM_SATUAN_KERJA e ON e.KODE_SATUAN_KERJA=LEFT(a.KODE_SATUAN_KERJA,4)+'0000000000'
LEFT JOIN TM_LEVEL_JABATAN f on f.KODE_LEVEL_JABATAN = a.KODE_LEVEL_JABATAN
--LEFT JOIN TD_ALAMAT G ON G.NIP = A.NIP
--LEFT JOIN TR_SKP H ON H.NIP = A.NIP AND H.TAHUN='2021'
WHERE KODE_MUTASI IN ('1','2','3','12') AND YEAR(TMT_PENSIUN) IN ('2023', '2024', '2025', '2026') AND A.KODE_SATUAN_KERJA LIKE '01%'
order by a.KODE_SATUAN_KERJA, YEAR(TMT_PENSIUN)


--SELECT * FROM TM_MUTASI