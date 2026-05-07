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
  ```

<img width="203" height="143" alt="{C4CED160-B198-4EEE-B753-E4E9C70508E6}" src="https://github.com/user-attachments/assets/32acda5f-45b3-4012-a289-66eb215abc94" />

