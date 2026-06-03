## Andmetebaaside konspektid / Karolina


[[Põhimõisted](README.md)] [[Protsedur](protsedur.md)] [[protsedur/XAMPP](protseduurXAMPP.md)] [[Hotelliruum](Hotelliruum.md)] [[Hotelliruum/XAMPP](hotellstseblokina.sql)] [[Triger](triger.md)]


## Andmebaasi võtmed


### Primary Key
Andmebaaside relatsioonimudelis on primaarvõti määratud atribuutide (veergude) kogum, mis suudab usaldusväärselt tuvastada ja eristada iga üksikut kirjet tabelis. Andmebaasi looja saab valida tabelist olemasoleva unikaalse atribuudi või atribuutide kombinatsiooni (loomulik võti), mis toimib primaarvõtmena, või luua uue atribuudi, mis sisaldab unikaalset ID-d, mis eksisteerib ainult selleks otstarbeks (asendusvõti).

Looduslike võtmete näited, mis võivad olla sobivad primaarvõtmed, hõlmavad andmeid, mis on juba definitsiooni järgi unikaalsed kõigile tabeli üksustele, näiteks isikuandmete riikliku identifitseerimisnumbri atribuut või väga täpse ajatempli atribuudi ja väga täpse asukoha atribuudi kombinatsioon sündmuste kirjete jaoks.

Formaalsemalt öeldes on primaarvõti minimaalse atribuutide komplekti valik, mis määrab unikaalselt relatsioonis (tabelis) oleva tuuple (rea). Primaarvõti on kandidaatvõtme valik [selgitus on vajalik] (minimaalne supervõti); iga teine ​​kandidaatvõti on alternatiivvõti.

<img width="581" height="359" alt="{476D6A92-F7C4-4040-A9FB-106880D0ABBC}" src="https://github.com/user-attachments/assets/f5e4c61f-bec5-4212-90d1-1452f3366e0e" />


See kood loob "nutika" veeru, mis nummerdab read järjestikku (1, 2, 3...) ja tagab, et need numbrid ei lähe kunagi segamini ega dubleerita.


### Foreign key
Võõrvõti on tabelis olevate atribuutide kogum, mis viitab teise tabeli primaarvõtmele, sidudes need kaks tabelit. Relatsioonandmebaaside kontekstis kehtib võõrvõtmele kaasamissõltuvuse piirang, mille kohaselt peavad ühe relatsiooni R võõrvõtme atribuutidest koosnevad tuupled eksisteerima ka mõnes teises (mitte tingimata erinevas) relatsioonis S; lisaks peavad need atribuudid olema ka S-i kandidaatvõtmed.

Teisisõnu, võõrvõti on atribuutide kogum, mis viitab kandidaatvõtmele. Näiteks tabelil nimega TEAM võib olla atribuut MEMBER_NAME, mis on võõrvõti, mis viitab kandidaatvõtmele PERSON_NAME tabelis PERSON. Kuna MEMBER_NAME on võõrvõti, peab iga TEAM-i liikme nimena eksisteerima ka isiku nimena tabelis PERSON; teisisõnu, iga TEAM-i liige on ka PERSON.


<img width="898" height="570" alt="{F56E9173-30FA-43EB-BA95-68D61CC1BC7A}" src="https://github.com/user-attachments/assets/4c4317c4-b4c6-4936-ad82-62c0c065cfe0" />

Kui proovite kogemata sisestada tellimuste tabelisse user_id = 999 (ja ettevõttes selle ID-ga kasutajat ei eksisteeri), annab andmebaas vea ja blokeerib päringu. See lihtsalt ei lase teil tellimust olematu isikuga seostada.


### Unique Key
Relatsioonandmebaaside haldussüsteemides on unikaalne võti kandidaatvõti. Kõik relatsiooni kandidaatvõtmed saavad relatsiooni kirjeid unikaalselt identifitseerida, kuid ainult ühte neist kasutatakse relatsiooni primaarvõtmena. Ülejäänud kandidaatvõtmeid nimetatakse unikaalseteks võtmeteks, kuna need saavad relatsioonis kirje unikaalselt identifitseerida. Unikaalsed võtmed võivad koosneda mitmest veerust. Unikaalseid võtmeid nimetatakse ka alternatiivvõtmeteks. Unikaalsed võtmed on relatsiooni primaarvõtme alternatiiv. SQL-is on unikaalsetele võtmetele määratud UNIQUE piirang, et vältida duplikaate (duplikaatkirje ei ole unikaalses veerus kehtiv). Alternatiivseid võtmeid saab kasutada nagu primaarvõtit ühe tabeli valikul või WHERE-klausli filtreerimisel, kuid neid ei kasutata tavaliselt mitme tabeli ühendamiseks.

<img width="567" height="466" alt="{FFAB391E-BE99-4F92-BA06-2D632B1DDD5E}" src="https://github.com/user-attachments/assets/4f4712d2-433d-486b-81dd-9ed217151e24" />

Unikaalse võtme piirangul on kolm olulist operatiivset omadust: esiteks saab seda rakendada ühe tabeli mitmele veerule (näiteks muutes e-posti, telefoni ja sisselogimise korraga unikaalseks), erinevalt ühest primaarvõtmest; teiseks pakub see reaalajas valideerimist, mis tähendab, et andmebaas blokeerib kohe INSERT- või UPDATE-käsud ja tagastab vea, kui tuvastab duplikaadi, kaitstes süsteemi "määrdunud" andmete eest; ja kolmandaks on sellel sarnane nüanss SQL Serveri NULL-iga – lahtri tühjaks jätmine on võimalik, kuid ainult ühe rea jaoks, kuna andmebaas blokeerib teise tühja kirje, pidades seda esimese NULL-i duplikaadiks.


### Simple key

Lihtvõtit kohtab kõige sagedamini relatsioonandmebaaside kujundamise kontekstis ja see viitab primaarvõtmele, mis koosneb ainult ühest väljast (veergust).

<img width="572" height="435" alt="{4F76650C-0762-4905-AF3C-B5A70C58C20C}" src="https://github.com/user-attachments/assets/68eb53f7-d5b5-4162-a436-5fb8a6d29b85" />


Tegime seda kiire ja usaldusväärse tööstruktuuri loomiseks:
Ladina tähestik kaitseb koodi kodeerimisvigade eest (ilma ??? märkideta) ja tagab stabiilse töö mis tahes serveris.
Lihtvõti (employee_id) annab reale lihtsa digitaalse ID. Andmebaas leiab kirjed koheselt ühe numbri järgi, ilma pikki nimesid otsimata, ja seob tabeleid hõlpsalt omavahel.

### Composite key

Andmebaaside disainimisel on liitvõti kandidaatvõti, mis koosneb kahest või enamast atribuudist(tabeli veerud), mis koos identifitseerivad unikaalselt üksuse esinemise (tabeli rea).
Liitvõti on liitvõti, mille iga võtit moodustav atribuut on omaette võõrvõti.

<img width="865" height="621" alt="{32E7372B-630E-4848-950E-05EB383570C6}" src="https://github.com/user-attachments/assets/8cb0d56a-62bc-4f8a-860e-37cce35fc484" />


Selle koodi põhisisu ühes lauses: liitvõtit (student_id, course_id) on vaja selleks, et üliõpilased saaksid valida paljude erinevate kursuste vahel ja kursus ise saaks vastu võtta palju erinevaid üliõpilasi, kuid samal ajal on rangelt keelatud samal inimesel samale kursusele kaks korda registreeruda.


### Compound Key

Liitvõti on võti, mille puhul kasutatakse kahte või enamat atribuuti tabeli iga kirje unikaalseks identifitseerimiseks.
Iga liitvõtme atribuut on primaarvõti erinevast tabelist.
Liitvõtit kasutatakse siis, kui ühtegi tabeli atribuuti ei saa primaarvõtmena kasutada.



