exports.create = function(){
  var xbrl = "xbrli:xbrl";

  var tdnet_rvfc = { 
                     code_ : "tse-t-ed:SecuritiesCode",
                     date_ : "tse-t-rv:ReportingDateOfFinancialForecastCorrection",
                     company_ : "tse-t-ed:CompanyName",
                     document_ : "tse-t-ed:DocumentName",
                     body_ : "tse-t-rv:ReasonForForecastCorrection"
                   };

  var tdnet_rvdf = {
                     code_ : "tse-t-ed:SecuritiesCode",
                     date_ : "tse-t-rv:ReportingDateOfDividendForecastCorrection",
                     company_ : "tse-t-ed:CompanyName",
                     document_ : "tse-t-ed:DocumentName",
                     body_ : "tse-t-rv:ReasonForDividendForecastCorrection"
                   };

  var tdnet_qcedjpsm = {
                         code_ : "tse-t-ed:SecuritiesCode",
                         date_ : "tse-t-ed:FilingDate",
                         company_ : "tse-t-ed:CompanyName",
                         document_ : "tse-t-ed:DocumentName",
                         body_ : "tse-t-hi:ExpressionOfImplementationStatusOfQuarterlyReviewProcedures"
                       };

  var tdnet_qcedjpfr = {
                         code_ : "tse-o-di:SecuritiesCode",
                         date_ : "-",
                         company_ : "jpfr-di:EntityNameJaEntityInformation",
                         document_ : "-",
                         body_ : "-"
                       };

  var tdnet_cgau = {
                     code_ : "tse-t-cg:SecuritiesCode",
                     date_ : "tse-t-cg:FinalUpdate",
                     company_ : "tse-t-cg:CompanyName",
                     document_ : "-",
                     body_ : "-"
                   };
  var q_code = {
                 tdnet_rvfc : xbrl + '.' + tdnet_rvfc.code_ + '.' + '#',
                 tdnet_rvdf : xbrl + '.' + tdnet_rvdf.code_ + '.' + '#',
                 tdnet_qcedjpsm : xbrl + '.' + tdnet_qcedjpsm.code_ + '.' + '#',
                 tdnet_qcedjpfr : xbrl + '.' + tdnet_qcedjpfr.code_ + '.' + '#',
                 tdnet_cgau : xbrl + '.' + tdnet_cgau.code_ + '.' + '#'
               }
  var q_date = {
                 tdnet_rvfc : xbrl + '.' + tdnet_rvfc.date_ + '.' + '#',
                 tdnet_rvdf : xbrl + '.' + tdnet_rvdf.date_ + '.' + '#',
                 tdnet_qcedjpsm : xbrl + '.' + tdnet_qcedjpsm.date_ + '.' + '#'
               }
  var q_company = {
                 tdnet_rvfc : xbrl + '.' + tdnet_rvfc.company_ + '.' + '#',
                 tdnet_rvdf : xbrl + '.' + tdnet_rvdf.company_ + '.' + '#',
                 tdnet_qcedjpsm : xbrl + '.' + tdnet_qcedjpsm.company_ + '.' + '#'
               }
  var q_document = {
                 tdnet_rvfc : xbrl + '.' + tdnet_rvfc.document_ + '.' + '#',
                 tdnet_rvdf : xbrl + '.' + tdnet_rvdf.document_ + '.' + '#',
                 tdnet_qcedjpsm : xbrl + '.' + tdnet_qcedjpsm.documet_ + '.' + '#'
               }

  return {
          code_ : "code_",
          date_ : "date_",
          company_ : "company_",
          document_ : "document_",
          keyword_ : "keyword_",
          xbrl : xbrl,
          link : "link:schemaRef",
          href : "xlink:href",
          tdnet_rvfc : tdnet_rvfc,
          tdnet_rvdf : tdnet_rvdf,
          tdnet_qcedjpsm : tdnet_qcedjpsm,
          tdnet_qcedjpfr : tdnet_qcedjpfr,
          tdnet_cgau : tdnet_cgau,
          q_code : q_code,
          q_date : q_date,
          q_company : q_company,
          q_document : q_document
         };
};
