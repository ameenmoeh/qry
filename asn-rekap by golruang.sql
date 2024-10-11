select * from 
(
	select left(a.kode_satuan_kerja,4)+'0000000000' kode_satuan_kerja, b.SATUAN_KERJA, a.GOL_RUANG, count(a.NIP_BARU) as jumlah 
	from vwDATA_PEGAWAI a 
	left join
	tm_satuan_kerja b on left(a.kode_satuan_kerja,4)+'0000000000'=b.kode_satuan_kerja 
	where a.kode_mutasi ='1' 
	group by left(a.kode_satuan_kerja,4), b.SATUAN_KERJA, a.GOL_RUANG
) t
PIVOT
(
	sum(jumlah) for GOL_RUANG in ([I/a],[I/b],[I/c],[I/d],[II/a],[II/b],[II/c],[II/d],[III/a],[III/b],[III/c],[III/d],[IV/a],[IV/b],[IV/c],[IV/d],[IV/e])
) piv
order by kode_satuan_kerja