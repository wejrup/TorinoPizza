USE torinopizza;

-- 1. List alle kunder:
SELECT * FROM kundeoplysninger;

-- 2. List alle kunder med postnummer 7400 Herning
SELECT * FROM kundeoplysninger WHERE postnummer = "7400";

-- 3. List alle odrer for kundeID 1
SELECT * FROM ordreregistrering WHERE kundeID = 1; 

-- 4. List hele menuen
SELECT * FROM menu;

-- 5. List alle ordre sorteret i rækkefølge efter ordretidspunkt
SELECT * FROM ordreregistrering ORDER BY Ordrertidspunkt ASC;

-- 6. List kunderne med bynavn via JOIN
SELECT k.KundeID, k.Navn, k.Adresse, k.Postnummer, p.bynavn FROM kundeoplysninger k JOIN postnummer p ON k.Postnummer = p.postnr;

-- 7. List alle kunder der hedder Jens "Wildcard"
SELECT * FROM kundeoplysninger WHERE Navn LIKE 'Jens%';

-- 8. Grupper alle ordrer efter KundeID / Tæl op hvor mange ordre hver kunde har lavet
SELECT KundeID, COUNT(*) AS AntalOrdrer FROM ordreregistrering GROUP BY KundeID;


-- 9 . List alle ordrer inklusiv navnet på de forskellige pizzaer
SELECT ov.OrdrerID, ov.OrdrervarerID, m.Navn AS PizzaNavn, ov.Kvantitet, m.Beskrivelse, ov.Tilpasning 
FROM ordrervarer ov JOIN menu m ON ov.MenuID = m.VareID ORDER BY ov.OrdrerID;

-- 10. Se hvor meget hver kunde har købt for
SELECT k.KundeID, k.Navn, SUM(o.Totalpris) AS "TotalKøbtFor" FROM kundeoplysninger k 
JOIN ordreregistrering o ON k.KundeID = o.KundeID GROUP BY k.KundeID, k.Navn;
