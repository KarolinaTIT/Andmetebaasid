## SQL Protseduurid
- store protcedure - salvestatud protseduurid - хранимые процедуры
- sama nagu funktsioonid programmerimises - mingid tefevused mis käivitakse automaatselt protseduuri kasutamisel
  
  ```sql
CREATE PROCEDURE lisaGuest
-- @parameetrid
@uusNimi varchar(25),
@uusPerenimi varchar(30),
@kuupäev date
AS
BEGIN
--protseduuri sisu
	insert into guest(firstname , lastname, membersince)
	values(@uusNimi,@uusPerenimi,@kuupäev);
	select * from guest;
END

<img width="203" height="143" alt="{C4CED160-B198-4EEE-B753-E4E9C70508E6}" src="https://github.com/user-attachments/assets/32acda5f-45b3-4012-a289-66eb215abc94" />

<img width="479" height="242" alt="{E29041E1-E8F2-4272-A311-50B535851DB2}" src="https://github.com/user-attachments/assets/28bdc918-fbc1-4916-a6a0-2fe80774dc4d" />

<img width="509" height="619" alt="{F2259D21-2A33-4994-AEE5-765FE785A3F4}" src="https://github.com/user-attachments/assets/d660ade3-d274-4d85-868e-7b0cecbc1936" />
