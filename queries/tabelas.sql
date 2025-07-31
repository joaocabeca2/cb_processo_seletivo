
CREATE TABLE GUESTCHECKS (
    guestCheckId INTEGER PRIMARY KEY,
    chkNum INTEGER,
    opnBusDt DATE,
    opnUTC TIMESTAMP,
    opnLcl TIMESTAMP,
    clsdBusDt DATE,
    clsdUTC TIMESTAMP,
    clsdLcl TIMESTAMP,
    lastTransUTC TIMESTAMP,
    lastTransLcl TIMESTAMP,
    lastUpdatedUTC TIMESTAMP,
    lastUpdatedLcl TIMESTAMP,
    clsdFlag INTEGER, -- 0 for false, 1 for true
    gstCnt INTEGER,
    subTtl NUMERIC(10, 2),
    nonTxblSlsTtl NUMERIC(10, 2),
    chkTtl NUMERIC(10, 2),
    dscTtl NUMERIC(10, 2),
    payTtl NUMERIC(10, 2),
    balDueTtl NUMERIC(10, 2),
    rvcNum INTEGER,
    otNum INTEGER,
    ocNum INTEGER,
    tblNum INTEGER,
    tblName VARCHAR(255),
    empNum INTEGER,
    numSrvcRd INTEGER,
    numChkPrntd INTEGER
);

CREATE TABLE TAXES (
    guestCheckId INTEGER,
    taxNum INTEGER,
    txblSlsTtl NUMERIC(10, 2),
    taxCollTtl NUMERIC(10, 2),
    taxRate NUMERIC(5, 2),
    type INTEGER,
    PRIMARY KEY (guestCheckId, taxNum), -- Chave primária composta
    FOREIGN KEY (guestCheckId) REFERENCES GUESTCHECKS(guestCheckId)
);

CREATE TABLE DETAILLINES (
    guestCheckLineItemId INTEGER PRIMARY KEY,
    guestCheckId INTEGER,
    rvcNum INTEGER,
    dtlOtNum INTEGER,
    dtlOcNum INTEGER,
    lineNum INTEGER,
    dtlId INTEGER,
    detailUTC TIMESTAMP,
    detailLcl TIMESTAMP,
    lastUpdateUTC TIMESTAMP,
    lastUpdateLcl TIMESTAMP,
    busDt DATE,
    wsNum INTEGER,
    dspTtl NUMERIC(10, 2),
    dspQty INTEGER,
    aggTtl NUMERIC(10, 2),
    aggQty INTEGER,
    chkEmpId INTEGER,
    chkEmpNum INTEGER,
    svcRndNum INTEGER,
    seatNum INTEGER,
    menuItemNum INTEGER,
    FOREIGN KEY (guestCheckId) REFERENCES GUESTCHECKS(guestCheckId),
    FOREIGN KEY (menuItemNum) REFERENCES MENUITEMS(miNum)
);

CREATE TABLE MENUITEMS (
    miNum INTEGER PRIMARY KEY,
    modFlag INTEGER, -- 0 for false, 1 for true
    inclTax NUMERIC(10, 2),
    activeTaxes VARCHAR(255),
    prcLvl INTEGER
);