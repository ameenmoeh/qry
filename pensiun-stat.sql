--PENSIUN BY YEAR
SELECT YEAR(TMT_PENSIUN) AS TAHUN, COUNT(NIP_BARU) AS JML 
FROM vwDATA_PEGAWAI
WHERE KODE_MUTASI=1
GROUP BY YEAR(TMT_PENSIUN)
ORDER BY YEAR(TMT_PENSIUN)

--PENSIUN BY DATE AND YEAR
/*
SELECT YEAR(TMT_PENSIUN) AS TAHUN,MONTH(TMT_PENSIUN) AS BULAN, COUNT(NIP_BARU) AS JML 
FROM vwDATA_PEGAWAI
WHERE KODE_MUTASI=1
GROUP BY YEAR(TMT_PENSIUN), MONTH(TMT_PENSIUN)
ORDER BY YEAR(TMT_PENSIUN), MONTH(TMT_PENSIUN)
*/

--RUNNING MONTH PENSIUN BY YEAR
SELECT MONTH(TMT_PENSIUN) AS BLN_PENSIUN, COUNT(NIP_BARU) AS JML 
FROM vwDATA_PEGAWAI
WHERE KODE_MUTASI=1 AND YEAR(TMT_PENSIUN)=2023
GROUP BY MONTH(TMT_PENSIUN)
ORDER BY MONTH(TMT_PENSIUN)

--ALL MONTH PENSIUN BY YEAR
SELECT MONTH(TMT_PENSIUN) AS BULAN_PENSIUN, COUNT(NIP_BARU) AS JML 
FROM vwDATA_PEGAWAI
WHERE YEAR(TMT_PENSIUN)=2023
GROUP BY MONTH(TMT_PENSIUN)
ORDER BY MONTH(TMT_PENSIUN)

--SELECT NIP_BARU,NAMA_LENGKAP FROM vwDATA_PEGAWAI WHERE KODE_MUTASI=1 AND YEAR(TMT_PENSIUN)=2023 AND MONTH(TMT_PENSIUN)=9