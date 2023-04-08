@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view for accounting header'
@Metadata.allowExtensions: true
define root view entity ZST7_ACCHDR_ROOTPOOL_CONSM_DFT
  as projection on ZST7_ACCHDR_ROOT_POOL_DFT
  //composition of target_data_source_name as _association_name
{
  key con_uuid               as uuid,
  key bukrs                  as compcd,
  key belnr                  as docno,
  key gjahr                  as fiscyear,
//      @Consumption.valueHelpDefinition: [{ entity: { name: 'T003', element: 'CSH_T003' } }]
      @ObjectModel.text.element: ['doctypdesc']
      blart                  as doctyp,
      @Semantics.user.createdBy: true //Automatically update the created by date on creation of new entry
      bldat                  as docdt,
      @Semantics.user.createdBy: true //Automatically update the created by user ID on creation of new entry
      cpudt                  as cpudate,
      cputm                  as cputime,
      usnam                  as usernm,
      bktxt                  as doctxt,
      tcode                  as tcode,
      xblnr                  as refno,
      createddt_time         as createddt,
      changeddt_time         as createdtm,
      lastchngdttm           as lastchgtm,
      _compCdDesc.descr      as compcddesc,
      @Semantics.text: true
      _docTypDesc.doctypdesc as doctypdesc,

      /* Associations */
       _compCdDesc,
       _docTypDesc,
       
      _items : redirected to composition child ZST7_ACCITM_CHLDPOOL_CONSM_DFT
}
