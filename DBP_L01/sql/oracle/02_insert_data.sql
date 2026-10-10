
-- FUNKCJE
INSERT ALL
    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('SZEFUNIO', 90, 110)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('BANDZIOR', 70, 90)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('LOWCZY', 60, 70)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('LAPACZ', 50, 60)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('KOT', 40, 50)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('MILUSIA', 20, 30)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('DZIELCZY', 45, 55)

    INTO Funkcje (funkcja, min_myszy, max_myszy)
        VALUES ('HONOROWA', 6, 25)
SELECT 1 FROM dual;



-- WROGOWIE

INSERT ALL
    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('KAZIO', 10, 'CZLOWIEK', 'FLASZKA')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('GLUPIA ZOSKA', 1, 'CZLOWIEK', 'KORALIK')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('SWAWOLNY DYZIO', 7, 'CZLOWIEK', 'GUMA DO ZUCIA')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('BUREK', 4, 'PIES', 'KOSC')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('DZIKI BILL', 10, 'PIES', NULL)

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('REKSIO', 2, 'PIES', 'KOSC')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('BETHOVEN', 1, 'PIES', 'PEDIGRIPALL')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('CHYTRUSEK', 5, 'LIS', 'KURCZAK')

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('SMUKLA', 1, 'SOSNA', NULL)

    INTO Wrogowie
        (imie_wroga, stopien_wrogosci, gatunek, lapowka)
        VALUES ('BAZYLI', 3, 'KOGUT', 'KURA DO STADA')
SELECT 1 FROM dual;



-- BANDY
-- Na początku szef_bandy ustawiamy na NULL.
-- Nie możemy jeszcze wskazać kotów, ponieważ koty nie zostały
-- dodane do tabeli Kocury.


INSERT ALL
    INTO Bandy (nr_bandy, nazwa, teren, szef_bandy)
        VALUES (1, 'SZEFOSTWO', 'CALOSC', NULL)

    INTO Bandy (nr_bandy, nazwa, teren, szef_bandy)
        VALUES (2, 'CZARNI RYCERZE', 'POLE', NULL)

    INTO Bandy (nr_bandy, nazwa, teren, szef_bandy)
        VALUES (3, 'BIALI LOWCY', 'SAD', NULL)

    INTO Bandy (nr_bandy, nazwa, teren, szef_bandy)
        VALUES (4, 'LACIACI MYSLIWI', 'GORKA', NULL)

    INTO Bandy (nr_bandy, nazwa, teren, szef_bandy)
        VALUES (5, 'ROCKERSI', 'ZAGRODA', NULL)
SELECT 1 FROM dual;


-- 4. KOCURY — POZIOM 1
-- Najpierw dodajemy TYGRYSA, ponieważ jako jedyny nie ma szefa.

INSERT INTO Kocury (
    imie,
    plec,
    pseudo,
    funkcja,
    szef,
    w_stadku_od,
    przydzial_myszy,
    myszy_extra,
    nr_bandy
)
VALUES (
    'MRUCZEK',
    'M',
    'TYGRYS',
    'SZEFUNIO',
    NULL,
    DATE '2002-01-01',
    103,
    33,
    1
);



-- 5. KOCURY — POZIOM 2
-- Szefem poniższych kotów jest istniejący już TYGRYS.


INSERT ALL
    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'CHYTRY', 'M', 'BOLEK', 'DZIELCZY', 'TYGRYS',
        DATE '2002-05-05', 50, NULL, 1
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'KOREK', 'M', 'ZOMBI', 'BANDZIOR', 'TYGRYS',
        DATE '2004-03-16', 75, 13, 3
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'BOLEK', 'M', 'LYSY', 'BANDZIOR', 'TYGRYS',
        DATE '2006-08-15', 72, 21, 2
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'PUCEK', 'M', 'RAFA', 'LOWCZY', 'TYGRYS',
        DATE '2006-10-15', 65, NULL, 4
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'MICKA', 'D', 'LOLA', 'MILUSIA', 'TYGRYS',
        DATE '2009-10-14', 25, 47, 1
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'RUDA', 'D', 'MALA', 'MILUSIA', 'TYGRYS',
        DATE '2006-09-17', 22, 42, 1
    )
SELECT 1 FROM dual;



-- 6. KOCURY — POZIOM 3
-- Szefowie ZOMBI, LYSY oraz RAFA już istnieją.


INSERT ALL
    -- Szef: ZOMBI

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'SONIA', 'D', 'PUSZYSTA', 'MILUSIA', 'ZOMBI',
        DATE '2010-11-18', 20, 35, 3
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'PUNIA', 'D', 'KURKA', 'LOWCZY', 'ZOMBI',
        DATE '2008-01-01', 61, NULL, 3
    )

    -- Szef: LYSY

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'JACEK', 'M', 'PLACEK', 'LOWCZY', 'LYSY',
        DATE '2008-12-01', 67, NULL, 2
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'BARI', 'M', 'RURA', 'LAPACZ', 'LYSY',
        DATE '2009-09-01', 56, NULL, 2
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'ZUZIA', 'D', 'SZYBKA', 'LOWCZY', 'LYSY',
        DATE '2006-07-21', 65, NULL, 2
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'BELA', 'D', 'LASKA', 'MILUSIA', 'LYSY',
        DATE '2008-02-01', 24, 28, 2
    )

    -- Szef: RAFA

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'LATKA', 'D', 'UCHO', 'KOT', 'RAFA',
        DATE '2011-01-01', 40, NULL, 4
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'DUDEK', 'M', 'MALY', 'KOT', 'RAFA',
        DATE '2011-05-15', 40, NULL, 4
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'KSAWERY', 'M', 'MAN', 'LAPACZ', 'RAFA',
        DATE '2008-07-12', 51, NULL, 4
    )

    INTO Kocury (
        imie, plec, pseudo, funkcja, szef, w_stadku_od,
        przydzial_myszy, myszy_extra, nr_bandy
    )
    VALUES (
        'MELA', 'D', 'DAMA', 'LAPACZ', 'RAFA',
        DATE '2008-11-01', 51, NULL, 4
    )
SELECT 1 FROM dual;

-- 7. KOCURY — POZIOM 4
-- ZERO podlega KURCE, która została dodana w poprzednim kroku.


INSERT INTO Kocury (
    imie,
    plec,
    pseudo,
    funkcja,
    szef,
    w_stadku_od,
    przydzial_myszy,
    myszy_extra,
    nr_bandy
)
VALUES (
    'LUCEK',
    'M',
    'ZERO',
    'KOT',
    'KURKA',
    DATE '2010-03-01',
    43,
    NULL,
    3
);



-- 8. UZUPEŁNIENIE SZEFÓW BAND
--
-- Koty pełniące funkcję szefów już istnieją.


UPDATE Bandy
SET szef_bandy =
    CASE nr_bandy
        WHEN 1 THEN 'TYGRYS'
        WHEN 2 THEN 'LYSY'
        WHEN 3 THEN 'ZOMBI'
        WHEN 4 THEN 'RAFA'
    END
WHERE nr_bandy IN (1, 2, 3, 4);



--  WROGOWIE KOCURÓW
-- Wszystkie potrzebne koty i wszystkie osoby z tabeli
-- Wrogowie już istnieją.


INSERT ALL
    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'TYGRYS', 'KAZIO', DATE '2004-10-13',
        'USILOWAL NABIC NA WIDLY'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'ZOMBI', 'SWAWOLNY DYZIO', DATE '2005-03-07',
        'WYBIL OKO Z PROCY'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'BOLEK', 'KAZIO', DATE '2005-03-29',
        'POSZCZUL BURKIEM'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'SZYBKA', 'GLUPIA ZOSKA', DATE '2006-09-12',
        'UZYLA KOTA JAKO SCIERKI'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'MALA', 'CHYTRUSEK', DATE '2007-03-07',
        'ZALECAL SIE'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'TYGRYS', 'DZIKI BILL', DATE '2007-06-12',
        'USILOWAL POZBAWIC ZYCIA'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'BOLEK', 'DZIKI BILL', DATE '2007-11-10',
        'ODGRYZL UCHO'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'LASKA', 'DZIKI BILL', DATE '2008-12-12',
        'POGRYZL ZE LEDWO SIE WYLIZALA'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'LASKA', 'KAZIO', DATE '2009-01-07',
        'ZLAPAL ZA OGON I ZROBIL WIATRAK'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'DAMA', 'KAZIO', DATE '2009-02-07',
        'CHCIAL OBEDRZEC ZE SKORY'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'MAN', 'REKSIO', DATE '2009-04-14',
        'WYJATKOWO NIEGRZECZNIE OBSZCZEKAL'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'LYSY', 'BETHOVEN', DATE '2009-05-11',
        'NIE PODZIELIL SIE SWOJA KASZA'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'RURA', 'DZIKI BILL', DATE '2009-09-03',
        'ODGRYZL OGON'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'PLACEK', 'BAZYLI', DATE '2010-07-12',
        'DZIOBIAC UNIEMOZLIWIL PODEBRANIE KURCZAKA'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'PUSZYSTA', 'SMUKLA', DATE '2010-11-19',
        'OBRZUCILA SZYSZKAMI'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'KURKA', 'BUREK', DATE '2010-12-14',
        'POGONIL'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'MALY', 'CHYTRUSEK', DATE '2011-07-13',
        'PODEBRAL PODEBRANE JAJKA'
    )

    INTO Wrogowie_kocurow (
        pseudo, imie_wroga, data_incydentu, opis_incydentu
    )
    VALUES (
        'UCHO', 'SWAWOLNY DYZIO', DATE '2011-07-14',
        'OBRZUCIL KAMIENIAMI'
    )
SELECT 1 FROM dual;


-- Zapisanie zmian w bazie
COMMIT;


-- ============================================================
-- 10. SPRAWDZENIE LICZBY REKORDÓW
-- ============================================================

SELECT 'FUNKCJE' AS tabela, COUNT(*) AS liczba
FROM Funkcje

UNION ALL

SELECT 'BANDY', COUNT(*)
FROM Bandy

UNION ALL

SELECT 'WROGOWIE', COUNT(*)
FROM Wrogowie

UNION ALL

SELECT 'KOCURY', COUNT(*)
FROM Kocury

UNION ALL

SELECT 'WROGOWIE_KOCUROW', COUNT(*)
FROM Wrogowie_kocurow;

-- -- 1. Usuwamy powiązania kotów z wrogami
-- DELETE FROM Wrogowie_kocurow;

-- -- 2. Usuwamy wskazania szefów band, aby przerwać
-- -- zależność kołową pomiędzy Bandy i Kocury
-- UPDATE Bandy
-- SET szef_bandy = NULL;

-- -- 3. Teraz można usunąć koty
-- DELETE FROM Kocury;

-- -- 4. Następnie bandy
-- DELETE FROM Bandy;

-- -- 5. Wrogowie nie są już używani
-- DELETE FROM Wrogowie;

-- -- 6. Funkcje nie są już przypisane do kotów
-- DELETE FROM Funkcje;

-- -- Zapisujemy usunięcie danych
-- COMMIT;