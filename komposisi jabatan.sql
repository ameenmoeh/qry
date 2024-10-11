select tipe_jabatan, jabatan_gabung, count(nip) jml, kodjab, kode_bidang_studi, kode_level_jabatan_2
	from (
		select 
			a.nip, jabatan, level_jabatan, replace(bidang_studi, 'pada','') bidang_studi, 
			--if non fungsional tertentu say jabatan
			case when d.kode_tipe_jabatan=2 then 
				case when b.kode_jabatan in ('20134','20126','20130','22021','20133','20125','20129','22020','20132','20124','20128','22019','20135','20127','20131','22022','21806','21805','21804') 
					then Level_jabatan+ '/Kepala'
				else	
					 rtrim(Level_jabatan) +' ' + replace(coalesce(bidang_studi,''), ', pada','') end 
				else jabatan end jabatan_gabung,
			case when b.kode_jabatan in ('20134','20126','20130','22021','20133','20125','20129','22020','20132','20124','20128','22019','20135','20127','20131','22022','21806','21805','21804') 
				then  'Kepala' else
			case when c.kode_level_jabatan='202' then 'Dosen' else
			case when c.kode_level_jabatan='201' then 'Guru' else
			case when d.kode_tipe_jabatan='2' then c.kode_level_jabatan else
				 b.kode_jabatan end end end end as kodJab, 

			case when b.kode_jabatan in ('20134','20126','20130','22021','20133','20125','20129','22020','20132','20124','20128','22019','20135','20127','20131','22022','21806','21805','21804') then
				'' else
			coalesce(b.kode_bidang_studi,'') end kode_bidang_studi, 

			c.kode_level_jabatan,
			case when c.kode_level_jabatan='101' then '800' else c.kode_level_jabatan end kode_level_jabatan_2,
			tipe_jabatan
		from 
			tm_pegawai a left join 
			tr_jabatan b on a.nip=b.nip and a.no_urut_jabatan=b.no_urut left join
			tm_jabatan c on b.kode_jabatan=c.kode_jabatan left join 
			tm_level_jabatan d on c.kode_level_jabatan=d.kode_level_jabatan left join
			tm_bidang_studi e on b.kode_bidang_studi=e.kode_bidang_studi left join
			tm_tipe_jabatan f on d.kode_tipe_jabatan=f.kode_tipe_jabatan
		where  kode_mutasi=1
		)a 
	group by jabatan_gabung, kode_level_jabatan_2, tipe_jabatan, kodjab, kode_bidang_studi
	order by kode_level_jabatan_2, jabatan_gabung 