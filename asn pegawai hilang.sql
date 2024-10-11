select nip, nip_baru, nama, keterangan, kategori='Pangkat' from vwdata_pegawai where kode_mutasi=1 and kode_pangkat is null
--jabatan
union
select nip, nip_baru, nama, keterangan, kategori='Jabatan' from vwdata_pegawai where kode_mutasi=1 and jabatan is null
--pendidikan
union
select nip, nip_baru, nama, keterangan, kategori='Pendidikan' from vwdata_pegawai where kode_mutasi=1 and jenjang_pendidikan is null
--satker
union
select nip, nip_baru, nama, keterangan, kategori='Satker' from vwdata_pegawai where kode_mutasi=1 and kode_satuan_kerja is null
union 
select nip, nip_baru, nama, keterangan, kategori='Satker' from vwdata_pegawai where kode_mutasi=1 and kode_satuan_kerja not in (select kode_satuan_kerja from tm_satuan_kerja)
--tanggal_lahir
union
select nip, nip_baru, nama, keterangan, kategori='Tgl Lahir' from vwdata_pegawai where kode_mutasi=1 and tanggal_lahir is null

