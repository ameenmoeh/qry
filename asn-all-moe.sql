SELECT --TOP 100 
	A.NIP_BARU, A.NAMA_LENGKAP, IIF(A.JENIS_KELAMIN=0,'Perempuan','Laki-Laki') AS JENIS_KELAMIN, A.AGAMA, A.STATUS_KAWIN, A.STATUS_PEGAWAI,
	A.JENJANG_PENDIDIKAN, A.PANGKAT, A.GOL_RUANG, A.NO_SK_GOL, CONVERT(VARCHAR,A.TGL_SK_GOL,23) AS TGL_SK_GOL, CONVERT(VARCHAR, A.TMT_SK_GOL,23) AS TMT_SK_GOL, A.MK_TAHUN, A.MK_BULAN,
	A.JABATAN, f.LEVEL_JABATAN, A.NO_SK_JAB, CONVERT(VARCHAR, A.TGL_SK_JAB,23) AS TGL_SK_JAB, CONVERT(VARCHAR, A.TMT_SK_JAB,23) AS TMT_SK_JAB, A.GOL_RUANG_JABATAN, A.KODE_TIPE_JABATAN,
	A.NO_SK_GOL_KGB, CONVERT(VARCHAR, A.TMT_SK_GOL_KGB,23) AS TMT_SK_GOL_JAB, CONVERT(VARCHAR, A.TMT_SK_GOL_KGB,23) AS TMT_SK_GOL_KGB, A.MK_TAHUN_KGB, A.MK_BULAN_KGB, A.GOL_RUANG_KGB,
	A.USIA_PENSIUN, CONVERT(VARCHAR, A.TMT_PENSIUN,23) AS TMT_PENSIUN, G.NO_HP, G.EMAIL, H.TAHUN AS SKP2021, a.KODE_SATUAN_KERJA,
	E.SATUAN_KERJA AS SATKER1, D.SATUAN_KERJA AS SATKER2, A.SATUAN_KERJA, CONVERT(VARCHAR, LEFT(RIGHT(A.NIP_BARU,10),4)+'-'+LEFT(RIGHT(A.NIP_BARU,6),2)+'-01', 23) AS MASUK_PEGAWAI
FROM vwDATA_PEGAWAI A 
LEFT JOIN TM_SATUAN_KERJA d ON d.KODE_SATUAN_KERJA=LEFT(a.KODE_SATUAN_KERJA,6)+'00000000' 
LEFT JOIN TM_SATUAN_KERJA e ON e.KODE_SATUAN_KERJA=LEFT(a.KODE_SATUAN_KERJA,4)+'0000000000'
LEFT JOIN TM_LEVEL_JABATAN f on f.KODE_LEVEL_JABATAN = a.KODE_LEVEL_JABATAN
LEFT JOIN TD_ALAMAT G ON G.NIP = A.NIP
LEFT JOIN TR_SKP H ON H.NIP = A.NIP AND H.TAHUN='2021'
WHERE KODE_MUTASI=1 
	--AND (NO_SK_GOL='' OR NO_SK_GOL IS NULL OR NO_SK_JAB='' OR NO_SK_JAB IS NULL OR NO_SK_GOL_KGB='' OR NO_SK_GOL_KGB IS NULL OR NO_HP='' OR NO_HP IS NULL OR EMAIL='' OR EMAIL IS NULL OR H.TAHUN='' OR H.TAHUN IS NULL) 
	--AND A.KODE_SATUAN_KERJA LIKE '021558%'
order by a.KODE_SATUAN_KERJA


--SELECT * FROM TM_SATUAN_KERJA WHERE SATUAN_KERJA LIKE '%kota malang%'