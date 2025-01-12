SELECT 
CASE 
WHEN LEN(LTRIM(RTRIM(A.GDN1)))>0 AND LEN(LTRIM(RTRIM(A.GDN2)))>0 AND LEN(LTRIM(RTRIM(A.GBN)))>0 THEN A.GDN1+' '+A.GDN2+' '+REPLACE(A.NAMA,',','')+', '+A.GBN
WHEN LEN(LTRIM(RTRIM(A.GDN1)))>0 AND LEN(LTRIM(RTRIM(A.GDN2)))=0 AND LEN(LTRIM(RTRIM(A.GBN)))=0 THEN A.GDN1+' '+REPLACE(A.NAMA,',','')
WHEN LEN(LTRIM(RTRIM(A.GDN1)))>0 AND LEN(LTRIM(RTRIM(A.GDN2)))>0 AND LEN(LTRIM(RTRIM(A.GBN)))=0 THEN A.GDN1+' '+A.GDN2+' '+REPLACE(A.NAMA,',','')
WHEN LEN(LTRIM(RTRIM(A.GDN1)))=0 AND LEN(LTRIM(RTRIM(A.GDN2)))>0 AND LEN(LTRIM(RTRIM(A.GBN)))=0 THEN A.GDN2+' '+REPLACE(A.NAMA,',','')
WHEN LEN(LTRIM(RTRIM(A.GDN1)))>0 AND LEN(LTRIM(RTRIM(A.GDN2)))=0 AND LEN(LTRIM(RTRIM(A.GBN)))>0 THEN A.GDN1+' '+REPLACE(A.NAMA,',','')+', '+A.GBN
WHEN LEN(LTRIM(RTRIM(A.GDN1)))=0 AND LEN(LTRIM(RTRIM(A.GDN2)))>0 AND LEN(LTRIM(RTRIM(A.GBN)))>0 THEN A.GDN2+' '+REPLACE(A.NAMA,',','')+', '+A.GBN
WHEN LEN(LTRIM(RTRIM(A.GDN1)))=0 AND LEN(LTRIM(RTRIM(A.GDN2)))=0 AND LEN(LTRIM(RTRIM(A.GBN)))>0 THEN REPLACE(A.NAMA,',','')+', '+A.GBN
WHEN LEN(LTRIM(RTRIM(A.GDN1)))=0 AND LEN(LTRIM(RTRIM(A.GDN2)))=0 AND LEN(LTRIM(RTRIM(A.GBN)))=0 THEN REPLACE(A.NAMA,',','')
ELSE ''
END AS NAMA_LENGKAP,
A.TEMPAT_LAHIR, A.TANGGAL_LAHIR, 
CASE A.JENIS_KELAMIN
WHEN 0 THEN 'Wanita'
ELSE 'Pria'
END AS JK,
CASE LEN(LTRIM(RTRIM(A.NIP_BARU)))
WHEN 0 THEN A.NIP
ELSE A.NIP_BARU
END AS NIP, A.NIP AS NIP_LAMA,
G.PANGKAT, G.GOL_RUANG, 
CASE WHEN LEFT(D.SATUAN_KERJA,3)='MAN' THEN 'PNS'
WHEN LEFT(D.SATUAN_KERJA,4)='MTsN' THEN 'PNS'
WHEN LEFT(D.SATUAN_KERJA,3)='MIN' THEN 'PNS'
ELSE 'PNS DPK/DPB' END AS STATUS_PNS, C.TAMPIL_JABATAN, 
CASE WHEN LEFT(D.SATUAN_KERJA,2)='MA' THEN 'MA Sederajat'
WHEN LEFT(D.SATUAN_KERJA,3)='MTs' THEN 'MTs Sederajat'
WHEN LEFT(D.SATUAN_KERJA,2)='MI' THEN 'MI Sederajat'
WHEN LEFT(D.SATUAN_KERJA,2)='RA' THEN 'RA Sederajat'
WHEN LEFT(D.SATUAN_KERJA,3)='SMA' THEN 'MA Sederajat'
WHEN LEFT(D.SATUAN_KERJA,4)='SLTA' THEN 'MA Sederajat'
WHEN LEFT(D.SATUAN_KERJA,3)='SMP' THEN 'MTs Sederajat'
WHEN LEFT(D.SATUAN_KERJA,4)='SLTP' THEN 'MTs Sederajat'
WHEN LEFT(D.SATUAN_KERJA,2)='SD' THEN 'MI Sederajat'
END AS JENJANG_PENDIDIKAN, 
D.SATUAN_KERJA AS NAMA_MADRASAH, 
CASE WHEN LEFT(D.SATUAN_KERJA,3)='MAN' THEN 'Negeri'
WHEN LEFT(D.SATUAN_KERJA,4)='MTsN' THEN 'Negeri'
WHEN LEFT(D.SATUAN_KERJA,3)='MIN' THEN 'Negeri'
WHEN LEFT(D.SATUAN_KERJA,11)='SLTA Negeri' THEN 'Negeri'
WHEN LEFT(D.SATUAN_KERJA,11)='SLTP Negeri' THEN 'Negeri'
WHEN LEFT(D.SATUAN_KERJA,9)='SD Negeri' THEN 'Negeri'
WHEN LEFT(D.SATUAN_KERJA,3)='MAS' THEN 'Swasta'
WHEN LEFT(D.SATUAN_KERJA,4)='MTsS' THEN 'Swasta'
WHEN LEFT(D.SATUAN_KERJA,3)='MIS' THEN 'Swasta'
WHEN LEFT(D.SATUAN_KERJA,11)='SLTA Swasta' THEN 'Swasta'
WHEN LEFT(D.SATUAN_KERJA,11)='SLTP Swasta' THEN 'Swasta'
WHEN LEFT(D.SATUAN_KERJA,9)='SD Swasta' THEN 'Swasta'
ELSE 'Tidak Diketahui' END AS STATUS_LEMBAGA,
I.SATUAN_KERJA AS KAB_KOTA, J.SATUAN_KERJA AS PROVINSI,
B.TMT_SK AS TMT_SK_AWAL, B.NO_SK AS NO_SK_AWAL,
B.TMT_SK AS TMT_SK_AKHIR, B.NO_SK AS NO_SK_AKHIR,
H.JENJANG_PENDIDIKAN +' '+ E.JURUSAN +' Tahun '+ E.TAHUN_LULUS AS PENDIDIKAN
FROM TM_PEGAWAI A
LEFT JOIN TR_JABATAN B ON B.NIP=A.NIP 
LEFT JOIN TM_JABATAN C ON C.KODE_JABATAN=B.KODE_JABATAN
LEFT JOIN TM_SATUAN_KERJA D ON D.KODE_SATUAN_KERJA=B.KODE_SATUAN_KERJA
LEFT JOIN TR_PENDIDIKAN E ON E.NIP=A.NIP
LEFT JOIN TR_PANGKAT F ON F.NIP=A.NIP
LEFT JOIN TM_PANGKAT G ON G.KODE_PANGKAT=F.KODE_PANGKAT
LEFT JOIN TM_JENJANG_PENDIDIKAN H ON H.KODE_JENJANG_PENDIDIKAN=E.KODE_JENJANG_PENDIDIKAN
LEFT JOIN TM_SATUAN_KERJA I ON I.KODE_SATUAN_KERJA=LEFT(B.KODE_SATUAN_KERJA,6)+'00000000'
LEFT JOIN TM_SATUAN_KERJA J ON J.KODE_SATUAN_KERJA=LEFT(B.KODE_SATUAN_KERJA,4)+'0000000000'
WHERE A.KODE_MUTASI='1' AND 
B.NO_URUT=A.NO_URUT_JABATAN AND 
E.NO_URUT=A.NO_URUT_PENDIDIKAN AND 
F.NO_URUT=A.NO_URUT_PANGKAT AND 
A.KODE_AGAMA=1 AND D.SATUAN_KERJA LIKE 'URUSAN TATA%'
ORDER BY D.KODE_SATUAN_KERJA, C.KODE_JABATAN, G.KODE_PANGKAT, A.NAMA ASC


