select * from 
(
	select left(a.kode_satuan_kerja,4)+'0000000000' kode_satuan_kerja, b.SATUAN_KERJA, a.STATUS_PEGAWAI, count(a.NIP_BARU) as jumlah 
	from vwDATA_PEGAWAI a 
	left join
	tm_satuan_kerja b on left(a.kode_satuan_kerja,4)+'0000000000'=b.kode_satuan_kerja 
	where a.kode_mutasi ='1' 
	group by left(a.kode_satuan_kerja,4), b.SATUAN_KERJA, a.STATUS_PEGAWAI
) t
PIVOT
(
	sum(jumlah) for STATUS_PEGAWAI in ([PNS],[CPNS],[PPPK],[-])
) piv
order by kode_satuan_kerja

