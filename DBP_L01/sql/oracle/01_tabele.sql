CREATE TABLE Funkcje(
    funkcja VARCHAR2(10)
        CONSTRAINT pk_funckje PRIMARY KEY,
    
    min_myszy NUMBER(3) 
        CONSTRAINT chk_funkcje_min
        CHECK (min_myszy > 5),
    
    max_myszy NUMBER(3)
        CONSTRAINT chk_funckje_max
        CHECK (200 > max_myszy),

    CONSTRAINT chk_funckje_przedzial
    CHECK (max_myszy >= min_myszy)
);

CREATE TABLE Bandy(
    nr_bandy NUMBER(2)
        CONSTRAINT pk_bandy PRIMARY KEY,

    nazwa VARCHAR2(20)
        CONSTRAINT nn_bandy_nazwa NOT NULL,
    
    teren VARCHAR2(15) 
        CONSTRAINT uq_bandy_teren UNIQUE,
    
    szef_bandy VARCHAR2(15)
        CONSTRAINT uq_bandy_szef UNIQUE
);

CREATE TABLE Wrogowie(
    -- Czy imie powinno byc kluczem jakiejs tabeli ?
    imie_wroga VARCHAR2(15) 
        CONSTRAINT pk_wrogowie PRIMARY KEY,

    stopien_wrogosci NUMBER(2) 
        CONSTRAINT chk_wrogowie_st_wrogosci
        CHECK (stopien_wrogosci BETWEEN 1 AND 10),

    gatunek VARCHAR2(15),

    lapowka VARCHAR2(20)
);

CREATE TABLE Kocury(
    imie VARCHAR2(15) 
        CONSTRAINT nn_kocury_imie NOT NULL,
    
    plec VARCHAR2(1) 
        CONSTRAINT chk_kocury_plec
        CHECK (plec IN ('M', 'D')),
    
    pseudo VARCHAR2(15)
        CONSTRAINT pk_kocury PRIMARY KEY,

    funkcja VARCHAR2(10)
        CONSTRAINT fk_kocury_funkcja
        REFERENCES Funkcje(funkcja),
    
    --Kot moze miec szefa bedacym innym kotem.
    --Klucz obcy do tej samej tabeli.
    szef VARCHAR2(15) 
        CONSTRAINT fk_kocury_szef
        REFERENCES Kocury(pseudo),

    w_stadku_od DATE DEFAULT SYSDATE,

    przydzial_myszy NUMBER(3),

    myszy_extra NUMBER(3),

    nr_bandy NUMBER(2)
        CONSTRAINT fk_kocury_bandy
        REFERENCES Bandy(nr_bandy)
);

CREATE TABLE Wrogowie_kocurow(
    pseudo VARCHAR2(15) 
        CONSTRAINT fk_wrogowie_kocurow_kocury
        REFERENCES Kocury(pseudo),
    
    imie_wroga VARCHAR2(15)
        CONSTRAINT fk_wrogowie_kocurow_wrogowie
        REFERENCES Wrogowie(imie_wroga),
    
    data_incydentu DATE 
        CONSTRAINT nn_wrogowie_kocurow_data_incydentu NOT NULL,
    
    opis_incydentu VARCHAR2(50),

    CONSTRAINT pk_wrogowie_kocurow
    PRIMARY KEY (pseudo, imie_wroga)
);


-- Dodanie brakujacego klucza obcego 
-- tabela kocury juz istnieje wiec mozemy dodac to ograniczenie.
ALTER TABLE Bandy
ADD CONSTRAINT fk_bandy_szef
FOREIGN KEY (szef_bandy)
REFERENCES Kocury(pseudo);

