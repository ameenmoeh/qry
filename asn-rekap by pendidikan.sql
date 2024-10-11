select * from 
(
	select left(a.kode_satuan_kerja,4)+'0000000000' kode_satuan_kerja, b.SATUAN_KERJA, a.JENJANG_PENDIDIKAN, count(a.NIP_BARU) as jumlah 
	from vwDATA_PEGAWAI a 
	left join
	tm_satuan_kerja b on left(a.kode_satuan_kerja,4)+'0000000000'=b.kode_satuan_kerja 
	where a.kode_mutasi ='1' 
	group by left(a.kode_satuan_kerja,4), b.SATUAN_KERJA, a.JENJANG_PENDIDIKAN
) t
PIVOT
(
	sum(jumlah) for JENJANG_PENDIDIKAN in ([SD],[SLTP],[SLTA],[D I],[D II],[D III],[SARJANA MUDA],[D IV],[S1],[S2],[S3])
) piv
order by kode_satuan_kerja