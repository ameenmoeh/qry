USE simpeg_2024
SELECT --TOP 100
    A.NIP, A.NIP_BARU,  
    LTRIM(COALESCE (A.GDN1, '') + ' ') + LTRIM(COALESCE(RTRIM(A.GDN2), '') + ' ') + LTRIM(COALESCE (RTRIM(REPLACE(A.NAMA,',','')), '')) + LTRIM(COALESCE (CASE WHEN LEN(A.GBN)>1 THEN + ', ' + A.GBN END, '')) AS NAMA_LENGKAP, 
    HA.KODE_PANGKAT, HA.PANGKAT, 
	CASE WHEN A.KODE_STATUS_PEGAWAI <> 3 THEN HA.GOL_RUANG ELSE HA.GOL_PPPK END GOL_RUANG,  
    A.NO_URUT_JABATAN, IA.KODE_JABATAN, IA.JABATAN, JB.LEVEL_JABATAN,
    I.KODE_SATUAN_KERJA, 
    IC.KETERANGAN_SATUAN_KERJA
FROM            
    dbo.TM_PEGAWAI AS A LEFT OUTER JOIN
    dbo.TM_AGAMA AS B ON A.KODE_AGAMA = B.KODE_AGAMA LEFT OUTER JOIN
    dbo.TM_STATUS_KAWIN AS C ON A.KODE_STATUS_KAWIN = C.KODE_STATUS_KAWIN LEFT OUTER JOIN
    dbo.TM_STATUS_PEGAWAI AS D ON A.KODE_STATUS_PEGAWAI = D.KODE_STATUS_PEGAWAI LEFT OUTER JOIN
    dbo.TM_JENIS_PEGAWAI AS E ON A.KODE_JENIS_PEGAWAI = E.KODE_JENIS_PEGAWAI LEFT OUTER JOIN
    dbo.TM_MUTASI AS F ON A.KODE_MUTASI = F.KODE_MUTASI LEFT OUTER JOIN
    dbo.TR_PENDIDIKAN AS G ON A.NIP = G.NIP AND A.NO_URUT_PENDIDIKAN = G.NO_URUT LEFT OUTER JOIN
    dbo.TM_JENJANG_PENDIDIKAN AS GA ON G.KODE_JENJANG_PENDIDIKAN = GA.KODE_JENJANG_PENDIDIKAN LEFT OUTER JOIN
    dbo.TM_FAKULTAS_PENDIDIKAN AS GB ON G.KODE_FAKULTAS_PENDIDIKAN = GB.KODE_FAKULTAS_PENDIDIKAN LEFT OUTER JOIN
    (SELECT        
        NIP, NO_URUT, KODE_PANGKAT, NO_SK, TGL_SK, TMT_SK, MK_TAHUN, MK_BULAN, KETERANGAN, 
        USER_ADD, TIME_ADD, USER_UPDATE, TIME_UPDATE, JENIS_SK, PENANDATANGAN, DASAR_HUKUM, GAJI_POKOK
    FROM            
        dbo.TR_PANGKAT) AS H ON A.NIP = H.NIP AND A.NO_URUT_PANGKAT = H.NO_URUT LEFT OUTER JOIN
    dbo.TM_PANGKAT AS HA ON H.KODE_PANGKAT = HA.KODE_PANGKAT LEFT OUTER JOIN
    dbo.TR_JABATAN AS I ON A.NIP = I.NIP AND A.NO_URUT_JABATAN = I.NO_URUT LEFT OUTER JOIN
    dbo.TM_JABATAN AS IA ON I.KODE_JABATAN = IA.KODE_JABATAN LEFT OUTER JOIN
    dbo.TM_LEVEL_JABATAN AS JB ON IA.KODE_LEVEL_JABATAN = JB.KODE_LEVEL_JABATAN LEFT OUTER JOIN
    dbo.TM_BIDANG_STUDI AS IB ON I.KODE_BIDANG_STUDI = IB.KODE_BIDANG_STUDI LEFT OUTER JOIN
    dbo.TM_SATUAN_KERJA AS IC ON I.KODE_SATUAN_KERJA = IC.KODE_SATUAN_KERJA LEFT OUTER JOIN
    dbo.TM_GRUP_SATUAN_KERJA AS ICC ON IC.KODE_GRUP_SATUAN_KERJA=ICC.KODE_GRUP_SATUAN_KERJA LEFT OUTER JOIN
    dbo.TM_JABATAN AS IE ON I.KODE_JABATAN_2 = IE.KODE_JABATAN LEFT OUTER JOIN
    dbo.TM_JABATAN_TUKIN AS IK ON I.KODE_JABATAN = IK.KODE_JABATAN LEFT OUTER JOIN
    dbo.TM_SATUAN_KERJA AS IG ON I.KODE_SATUAN_KERJA_2 = IG.KODE_SATUAN_KERJA LEFT OUTER JOIN
    dbo.TM_SATUAN_KERJA AS S1 ON S1.KODE_SATUAN_KERJA= LEFT(I.KODE_SATUAN_KERJA,2)+'000000000000' LEFT OUTER JOIN
    dbo.TM_SATUAN_KERJA AS S2 ON S2.KODE_SATUAN_KERJA= LEFT(I.KODE_SATUAN_KERJA,4)+'0000000000' LEFT OUTER JOIN
    dbo.TM_SATUAN_KERJA AS S3 ON S3.KODE_SATUAN_KERJA= LEFT(I.KODE_SATUAN_KERJA,6)+'00000000' LEFT OUTER JOIN
    dbo.TM_SATUAN_KERJA AS S4 ON S4.KODE_SATUAN_KERJA= LEFT(I.KODE_SATUAN_KERJA,8)+'000000' LEFT OUTER JOIN
    dbo.TM_PANGKAT AS IH ON I.KODE_PANGKAT = IH.KODE_PANGKAT LEFT OUTER JOIN
    dbo.TR_KGB AS J ON A.NIP = J.NIP AND A.NO_URUT_KGB = J.NO_URUT LEFT OUTER JOIN
    (SELECT        
        NIP, MAX(KODE_PANGKAT) / 10 AS max_data, MIN(KODE_PANGKAT) / 10 AS min_data
    FROM            
        dbo.TR_PANGKAT AS TR_PANGKAT_1
    GROUP BY NIP) AS K ON A.NIP = K.NIP LEFT OUTER JOIN
    dbo.TD_TAKAH AS TK ON A.NIP = TK.NIP LEFT OUTER JOIN
    dbo.fnPengurangMK() AS l ON K.min_data = l.mk_awal AND K.max_data = l.mk_akhir 
WHERE A.KODE_MUTASI=1