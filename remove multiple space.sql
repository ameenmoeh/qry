SELECT TOP 10 * FROM TEMP_PEGAWAI_LATLON
SELECT TOP 100 * FROM referensi_unor_14
SELECT TOP 100 * FROM TM_SATUAN_KERJA
SELECT COUNT(NIP) FROM TEMP_PEGAWAI
SELECT COUNT(NIP) FROM TEMP_PEGAWAI_
SELECT COUNT(NIP_BARU) FROM TEMP_PEGAWAI_BI
SELECT COUNT(NIP_BARU) FROM TEMP_PEGAWAI_LATLON
SELECT COUNT(NIP_BARU) FROM TEMP_PEGAWAI_PANGKAT
SELECT COUNT(NIP_BARU) FROM TEMP_PEGAWAI_SSO
SELECT COUNT(NIP_BARU) FROM TEMP_PEGAWAI_SSOx
---------------------------------------

SELECT TOP 100 * FROM vwDATA_PEGAWAI WHERE KODE_MUTASI=1
--------------------------------------

SELECT TOP 100 
REPLACE(
    REPLACE(
        REPLACE(KETERANGAN,' ',CHAR(17)+CHAR(18)),
    CHAR(18)+CHAR(17),''),
CHAR(17)+CHAR(18),' ') AS KETERANGAN 
FROM vwDATA_PEGAWAI WHERE KODE_MUTASI=1

SELECT TOP 100 
    REPLACE(
        REPLACE(KETERANGAN,' ',CHAR(17)+CHAR(18)),
    CHAR(18)+CHAR(17),'') AS KETERANGAN 
FROM vwDATA_PEGAWAI WHERE KODE_MUTASI=1

SELECT TOP 100 
        REPLACE(KETERANGAN,' ',CHAR(17)+CHAR(18)) AS KETERANGAN 
FROM vwDATA_PEGAWAI WHERE KODE_MUTASI=1

SELECT CHAR(19)

-------------------------
SELECT STUFF('MICROSOFT SQL SERVER 2000', 11, 3, 'S.Q.L.') as Result;
-------------------------
DECLARE @TestString VARCHAR(200);  
SET @TestString='   Ex      ample   St  ring   '; 
 
WHILE CHARINDEX('  ',@TestString) <> 0
 SET @TestString = REPLACE(@TestString,'  ',' ');
 
SELECT @TestString AS RESULT;
-------------------------

SELECT * FROM TM_PANGKAT
SELECT * FROM TM_JABATAN
SELECT TOP 100 * FROM TR_PANGKAT

SELECT        
        NIP, MAX(KODE_PANGKAT) / 10 AS max_data, MIN(KODE_PANGKAT) / 10 AS min_data
    FROM            
        dbo.TR_PANGKAT AS TR_PANGKAT_1
    GROUP BY NIP

SELECT TMT_SK, MK_TAHUN,
COALESCE (CASE WHEN (datediff(mm, TMT_SK, GETDATE()) % 12 + mk_bulan) > 11 
                    THEN datediff(mm, TMT_SK, GETDATE()) / 12 + mk_tahun + 1 
                    ELSE datediff(mm, TMT_SK, GETDATE()) / 12 + mk_tahun END, 0) AS MK_TAHUN_1 
FROM TR_PANGKAT
WHERE NIP='150329435'

SELECT DATEDIFF(MM,TMT_SK,GETDATE()) FROM TR_PANGKAT WHERE NIP='150329435'
SELECT DATEDIFF(MM,TMT_SK,GETDATE())%12 FROM TR_PANGKAT WHERE NIP='150329435' 
SELECT DATEDIFF(MM,TMT_SK,GETDATE())%12+MK_BULAN FROM TR_PANGKAT WHERE NIP='150329435' 

------------------------------------

SELECT TOP 100 * FROM TR_JABATAN WHERE YEAR(TIME_UPDATE)=2023
SELECT TOP 100 * FROM TR_JABATAN_EDIT
SELECT TOP 100 * FROM TR_JABATAN_NON

SELECT * FROM TM_REF