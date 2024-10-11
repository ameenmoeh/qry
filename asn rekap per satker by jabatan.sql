select * from 
(
	select left(a.kode_satuan_kerja,4)+'0000000000' kode_satuan_kerja, b.SATUAN_KERJA, c.LEVEL_JABATAN, count(a.NIP_BARU) as jumlah 
	from vwDATA_PEGAWAI a 
	left join
	tm_satuan_kerja b on left(a.kode_satuan_kerja,4)+'0000000000'=b.kode_satuan_kerja left join
    tm_level_jabatan c on a.KODE_LEVEL_JABATAN=c.KODE_LEVEL_JABATAN
	where a.kode_mutasi ='1' 
	group by left(a.kode_satuan_kerja,4), b.SATUAN_KERJA, c.LEVEL_JABATAN
) t
PIVOT
(
	--sum(jumlah) for level_jabatan in ([guru],[dosen],[asesor sdm aparatur])
	sum(jumlah) for level_jabatan in ([Jabatan Fungsional Umum],[Jabatan Pelaksana])
) piv
order by kode_satuan_kerja


--select * from TM_LEVEL_JABATAN
--select * from TM_JABATAN
--SELECT * FROM TEMP_PEGAWAI_SSO WHERE TAMBAH_PEGAWAI=1
--select * from TM_TUKIN
update [TM_PEGAWAI] set KODE_STATUS_PEGAWAI=1 where KODE_STATUS_PEGAWAI=2 and KODE_MUTASI=1 and YEAR(MASUK_PEGAWAI)<2021
select * from TM_STATUS_PEGAWAI
select * from TM_REF

select * from TM_GRUP_SATUAN_KERJA

select A.*, B.GRUP_SATUAN_KERJA from TM_SATUAN_KERJA A LEFT JOIN TM_GRUP_SATUAN_KERJA B ON A.KODE_GRUP_SATUAN_KERJA=B.KODE_GRUP_SATUAN_KERJA

SELECT COUNT(distinct NIP) from TR_JABATAN