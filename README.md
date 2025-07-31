# cb_processo_seletivo

# Meu Projeto de Engenharia de Dados

Este repositório contém a solução para o desafio de engenharia de dados do Coco Bambu.

## Modelo de Banco de Dados (MER - DBML)

Abaixo está o Modelo de Entidade-Relacionamento do banco de dados, conforme definido em DBML:

```dbml
Table GUESTCHECKS {
  guestCheckId integer [primary key]
  chkNum integer
  opnBusDt date
  opnUTC timestamp
  opnLcl timestamp
  clsdBusDt date
  clsdUTC timestamp
  clsdLcl timestamp
  lastTransUTC timestamp
  lastTransLcl timestamp
  lastUpdatedUTC timestamp
  lastUpdatedLcl timestamp
  clsdFlag boolean
  gstCnt integer
  subTtl float
  nonTxblSlsTtl float
  chkTtl float
  dscTtl float
  payTtl float
  balDueTtl float
  rvcNum integer
  otNum integer
  ocNum integer
  tblNum integer
  tblName varchar
  empNum integer
  numSrvcRd integer
  numChkPrntd integer
}

Table TAXES {
  guestCheckId integer [ref: > GUESTCHECKS.guestCheckId]
  taxNum integer
  txblSlsTtl float
  taxCollTtl float
  taxRate float
  type integer

  Indexes {
    (guestCheckId, taxNum) [pk]
  }
}

Table DETAILLINES {
  guestCheckLineItemId integer [primary key]
  guestCheckId integer [ref: > GUESTCHECKS.guestCheckId]
  rvcNum integer
  dtlOtNum integer
  dtlOcNum integer
  lineNum integer
  dtlId integer
  detailUTC timestamp
  detailLcl timestamp
  lastUpdateUTC timestamp
  lastUpdateLcl timestamp
  busDt date
  wsNum integer
  dspTtl float
  dspQty integer
  aggTtl float
  aggQty integer
  chkEmpId integer
  chkEmpNum integer
  svcRndNum integer
  seatNum integer
  menuItemNum integer [ref: > MENUITEMS.miNum]
  inclTax float
  activeTaxes varchar
}

Table MENUITEMS {
  miNum integer [primary key]
  modFlag boolean
  prcLvl integer
}
