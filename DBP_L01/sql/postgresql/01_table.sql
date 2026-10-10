CREATE TABLE Funkcje (
    funkcja VARCHAR(10)
        CONSTRAINT pk_funkcje PRIMARY KEY,
    
    min_myszy NUMERIC(3)
        CONSTRAINT chk_funkcje_min
        CHECK (min_myszy > 5),
    
    max_myszy NUMERIC(3)
        CONSTRAINT chk_funkcje_max
        CHECK (max_myszy < 200),

    CONSTRAINT chk_funkcje_przedzial
        CHECK (max_myszy >= min_myszy)
);


CREATE TABLE Bandy (
    nr_bandy NUMERIC(2)
        CONSTRAINT pk_bandy PRIMARY KEY,

    nazwa VARCHAR(20)
        CONSTRAINT nn_bandy_nazwa NOT NULL,
    
    teren VARCHAR(15)
        CONSTRAINT uq_bandy_teren UNIQUE,
    
    szef_bandy VARCHAR(15)
        CONSTRAINT uq_bandy_szef UNIQUE
);


CREATE TABLE Wrogowie (
    imie_wroga VARCHAR(15)
        CONSTRAINT pk_wrogowie PRIMARY KEY,

    stopien_wrogosci NUMERIC(2)
        CONSTRAINT chk_wrogowie_st_wrogosci
        CHECK (stopien_wrogosci BETWEEN 1 AND 10),

    gatunek VARCHAR(15),

    lapowka VARCHAR(20)
);


CREATE TABLE Kocury (
    imie VARCHAR(15)
        CONSTRAINT nn_kocury_imie NOT NULL,
    
    plec VARCHAR(1)
        CONSTRAINT chk_kocury_plec
        CHECK (plec IN ('M', 'D')),
    
    pseudo VARCHAR(15)
        CONSTRAINT pk_kocury PRIMARY KEY,

    funkcja VARCHAR(10)
        CONSTRAINT fk_kocury_funkcja
        REFERENCES Funkcje(funkcja),
    
    -- Kot może mieć szefa będącego innym kotem.
    -- Jest to klucz obcy prowadzący do tej samej tabeli.
    szef VARCHAR(15)
        CONSTRAINT fk_kocury_szef
        REFERENCES Kocury(pseudo),

    w_stadku_od DATE DEFAULT CURRENT_DATE,

    przydzial_myszy NUMERIC(3),

    myszy_extra NUMERIC(3),

    nr_bandy NUMERIC(2)
        CONSTRAINT fk_kocury_bandy
        REFERENCES Bandy(nr_bandy)
);


CREATE TABLE Wrogowie_kocurow (
    pseudo VARCHAR(15)
        CONSTRAINT fk_wrogowie_kocurow_kocury
        REFERENCES Kocury(pseudo),
    
    imie_wroga VARCHAR(15)
        CONSTRAINT fk_wrogowie_kocurow_wrogowie
        REFERENCES Wrogowie(imie_wroga),
    
    data_incydentu DATE
        CONSTRAINT nn_wrogowie_kocurow_data_incydentu NOT NULL,
    
    opis_incydentu VARCHAR(50),

    CONSTRAINT pk_wrogowie_kocurow
        PRIMARY KEY (pseudo, imie_wroga)
);


-- Ten ALTER TABLE jest konieczny z powodu zależności kołowej:
-- Bandy wskazują szefa z tabeli Kocury,
-- a Kocury wskazują numer bandy z tabeli Bandy.
ALTER TABLE Bandy
ADD CONSTRAINT fk_bandy_szef
FOREIGN KEY (szef_bandy)
REFERENCES Kocury(pseudo);