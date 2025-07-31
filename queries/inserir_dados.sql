-- Inserindo um item de menu de exemplo
INSERT INTO MENUITEMS (miNum, modFlag, inclTax, activeTaxes, prcLvl) VALUES
(101, 0, 0.50, '1,2', 1);

-- Inserindo uma conta de cliente (pedido) de exemplo
INSERT INTO GUESTCHECKS (
    guestCheckId, chkNum, opnBusDt, opnUTC, opnLcl, clsdBusDt, clsdUTC, clsdLcl,
    lastTransUTC, lastTransLcl, lastUpdatedUTC, lastUpdatedLcl, clsdFlag, gstCnt,
    subTtl, nonTxblSlsTtl, chkTtl, dscTtl, payTtl, balDueTtl, rvcNum, otNum, ocNum,
    tblNum, tblName, empNum, numSrvcRd, numChkPrntd
) VALUES (
    1, 1001, '2023-10-27', '2023-10-27 18:00:00', '2023-10-27 15:00:00', '2023-10-27', '2023-10-27 19:00:00', '2023-10-27 16:00:00',
    '2023-10-27 18:45:00', '2023-10-27 15:45:00', '2023-10-27 19:01:00', '2023-10-27 16:01:00', 1, 2,
    50.00, 0.00, 55.00, 5.00, 55.00, 0.00, 1, 1, 1,
    10, 'Mesa 10', 123, 1, 1
);

-- Inserindo um imposto de exemplo para a conta guestCheckId = 1
INSERT INTO TAXES (guestCheckId, taxNum, txblSlsTtl, taxCollTtl, taxRate, type) VALUES
(1, 1, 50.00, 5.00, 10.00, 1);

-- Inserindo uma linha de detalhe de exemplo para a conta guestCheckId = 1, usando o menuItemNum = 101
INSERT INTO DETAILLINES (
    guestCheckLineItemId, guestCheckId, rvcNum, dtlOtNum, dtlOcNum, lineNum, dtlId,
    detailUTC, detailLcl, lastUpdateUTC, lastUpdateLcl, busDt, wsNum, dspTtl, dspQty,
    aggTtl, aggQty, chkEmpId, chkEmpNum, svcRndNum, seatNum, menuItemNum
) VALUES (
    10001, 1, 1, 1, 1, 1, 501,
    '2023-10-27 18:05:00', '2023-10-27 15:05:00', '2023-10-27 18:05:00', '2023-10-27 15:05:00', '2023-10-27', 1, 25.00, 1,
    25.00, 1, 456, 123, 1, 1, 101
);