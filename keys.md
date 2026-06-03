## Andmebaasi võtmed



### Primary Key
Andmebaaside relatsioonimudelis on primaarvõti määratud atribuutide (veergude) kogum, mis suudab usaldusväärselt tuvastada ja eristada iga üksikut kirjet tabelis. Andmebaasi looja saab valida tabelist olemasoleva unikaalse atribuudi või atribuutide kombinatsiooni (loomulik võti), mis toimib primaarvõtmena, või luua uue atribuudi, mis sisaldab unikaalset ID-d, mis eksisteerib ainult selleks otstarbeks (asendusvõti).

Looduslike võtmete näited, mis võivad olla sobivad primaarvõtmed, hõlmavad andmeid, mis on juba definitsiooni järgi unikaalsed kõigile tabeli üksustele, näiteks isikuandmete riikliku identifitseerimisnumbri atribuut või väga täpse ajatempli atribuudi ja väga täpse asukoha atribuudi kombinatsioon sündmuste kirjete jaoks.

Formaalsemalt öeldes on primaarvõti minimaalse atribuutide komplekti valik, mis määrab unikaalselt relatsioonis (tabelis) oleva tuuple (rea). Primaarvõti on kandidaatvõtme valik [selgitus on vajalik] (minimaalne supervõti); iga teine ​​kandidaatvõti on alternatiivvõti.

<img width="581" height="359" alt="{476D6A92-F7C4-4040-A9FB-106880D0ABBC}" src="https://github.com/user-attachments/assets/f5e4c61f-bec5-4212-90d1-1452f3366e0e" />


See kood loob "nutika" veeru, mis nummerdab read järjestikku (1, 2, 3...) ja tagab, et need numbrid ei lähe kunagi segamini ega dubleerita.


### Foreign key
Võõrvõti on tabelis olevate atribuutide kogum, mis viitab teise tabeli primaarvõtmele, sidudes need kaks tabelit. Relatsioonandmebaaside kontekstis kehtib võõrvõtmele kaasamissõltuvuse piirang, mille kohaselt peavad ühe relatsiooni R võõrvõtme atribuutidest koosnevad tuupled eksisteerima ka mõnes teises (mitte tingimata erinevas) relatsioonis S; lisaks peavad need atribuudid olema ka S-i kandidaatvõtmed.[1][2][3]

Teisisõnu, võõrvõti on atribuutide kogum, mis viitab kandidaatvõtmele. Näiteks tabelil nimega TEAM võib olla atribuut MEMBER_NAME, mis on võõrvõti, mis viitab kandidaatvõtmele PERSON_NAME tabelis PERSON. Kuna MEMBER_NAME on võõrvõti, peab iga TEAM-i liikme nimena eksisteerima ka isiku nimena tabelis PERSON; teisisõnu, iga TEAM-i liige on ka PERSON.


<img width="898" height="570" alt="{F56E9173-30FA-43EB-BA95-68D61CC1BC7A}" src="https://github.com/user-attachments/assets/4c4317c4-b4c6-4936-ad82-62c0c065cfe0" />

Kui proovite kogemata sisestada tellimuste tabelisse user_id = 999 (ja ettevõttes selle ID-ga kasutajat ei eksisteeri), annab andmebaas vea ja blokeerib päringu. See lihtsalt ei lase teil tellimust olematu isikuga seostada.


### Unique Key
Relatsioonandmebaaside haldussüsteemides on unikaalne võti kandidaatvõti. Kõik relatsiooni kandidaatvõtmed saavad relatsiooni kirjeid unikaalselt identifitseerida, kuid ainult ühte neist kasutatakse relatsiooni primaarvõtmena. Ülejäänud kandidaatvõtmeid nimetatakse unikaalseteks võtmeteks, kuna need saavad relatsioonis kirje unikaalselt identifitseerida. Unikaalsed võtmed võivad koosneda mitmest veerust. Unikaalseid võtmeid nimetatakse ka alternatiivvõtmeteks. Unikaalsed võtmed on relatsiooni primaarvõtme alternatiiv. SQL-is on unikaalsetele võtmetele määratud UNIQUE piirang, et vältida duplikaate (duplikaatkirje ei ole unikaalses veerus kehtiv). Alternatiivseid võtmeid saab kasutada nagu primaarvõtit ühe tabeli valikul või WHERE-klausli filtreerimisel, kuid neid ei kasutata tavaliselt mitme tabeli ühendamiseks.
