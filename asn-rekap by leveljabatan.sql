select * from 
(
	select left(a.kode_satuan_kerja,4)+'0000000000' kode_satuan_kerja, b.SATUAN_KERJA, a.KODE_LEVEL_JABATAN, count(a.NIP_BARU) as jumlah 
	from vwDATA_PEGAWAI a 
	left join
	tm_satuan_kerja b on left(a.kode_satuan_kerja,4)+'0000000000'=b.kode_satuan_kerja 
	where a.kode_mutasi ='1' 
	group by left(a.kode_satuan_kerja,4), b.SATUAN_KERJA, a.KODE_LEVEL_JABATAN
) t
PIVOT
(
	sum(jumlah) for KODE_LEVEL_JABATAN in ([201],[202],[213],[222])
) piv
order by kode_satuan_kerja

--select top 10 * from vwDATA_PEGAWAI where kode_mutasi=1
--select * from TM_LEVEL_JABATAN
--SELECT * FROM vwDATA_PEGAWAI WHERE KODE_SATUAN_KERJA like '0202%' and KODE_LEVEL_JABATAN='202'