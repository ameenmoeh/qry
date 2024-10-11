select a.kode_satuan_kerja, b.satuan_kerja, a.Jumlah
from 
(select left(a.kode_satuan_kerja,4)+'0000000000' kode_satuan_kerja, count(NIP_BARU) AS Jumlah, sum(count(NIP_BARU)) OVER() as Total
	from vwdata_pegawai a 
	where a.kode_mutasi ='1' 
	group by left(a.kode_satuan_kerja,4)
) A
LEFT JOIN
    tm_satuan_kerja b on a.kode_satuan_kerja=b.kode_satuan_kerja
ORDER by a.kode_satuan_kerja


--select * from vwDATA_PEGAWAI WHERE kode_mutasi='1' AND KODE_SATUAN_KERJA='01010000000000'
--select * from vwDATA_PEGAWAI WHERE kode_mutasi='1' and status_pegawai='-' 