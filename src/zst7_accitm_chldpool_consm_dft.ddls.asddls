@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view for accounting line items'
@Metadata.allowExtensions: true
define view entity ZST7_ACCITM_CHLDPOOL_CONSM_DFT
  as projection on ZST7_ACCITM_CHILD_POOL_DFT
{
  key item_uuid         as itmuuid,
  key bukrs             as compcd,
  key belnr             as docno,
  key gjahr             as fiscyear,
  key buzei             as linenum,
      con_uuid          as connuuid,
      @ObjectModel.text.element: ['postkeydesc']
      bschl             as postkey,
      @Semantics.text: true
      postkeydesc       as postkeydesc,
      @ObjectModel.text.element: ['acctypdesc']
      koart             as acctyp,
      @Semantics.text: true
      acctyptext        as acctypdesc,
      @ObjectModel.text.element: ['dbcrdesc']
      shkzg             as dbcrindc,
      @Semantics.text: true
      dbcrtext          as dbcrdesc,
      @ObjectModel.text.element: ['bussareadesc']
      gsber             as bussarea,
      @Semantics.text: true
      bussaredesc       as bussareadesc,
      @ObjectModel.text.element: ['taxcddesc']
      mwskz             as taxcd,
      @Semantics.text: true
      taxcddesc         as taxcddesc,
      dmbtr             as amount,
      mwsts             as taxamt,
      waers             as currcode,
      kostl             as costcntr,
      @ObjectModel.text.element: ['venddesc']
      lifnr             as vendor,
      @Semantics.text: true
      venddesc          as venddesc,
      changed_dt_time   as createddttime,
      local_chg_dt_time as changdttime,


      /* Associations */
      _bussAreaDesc,
      _postKeyDesc,
      _taxDesc,
      _vendDesc,

      _header : redirected to parent ZST7_ACCHDR_ROOTPOOL_CONSM_DFT

}
