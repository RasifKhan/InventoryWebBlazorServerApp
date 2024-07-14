using Atl_Inv_DataAccess.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class QuotationMT
{
    [Key]
    public int QuotationId { get; set; }
    public string? QuotationNo { get; set; }
    public int? ProjectTypeId_Stdt { get; set; }
    [ForeignKey("ProjectTypeId_Stdt")]
    public virtual SetupDt_Data? SetupDt_Data { get; set; }

    public string? Subject { get; set; }
    public string? ProjectName { get; set; }

    public decimal? NetTotal { get; set; }

    public decimal? GrandTotal { get; set; }

    public decimal? Discount { get; set; }

    public decimal? DiscountedTotal { get; set; }
    public int? CompanyId { get; set; }
    [ForeignKey("CompanyId")]
    public virtual CompanyInfoSetup? CompanyInfoSetup { get; set; }
    public int? ContactPersonId { get; set; }
    [ForeignKey("ContactPersonId")]
    public virtual ContactPersonInfoSetup? ContactPersonInfoSetup { get; set; }
    public DateTime? ToDate { get; set; }
    public DateTime? ValidityDate { get; set; }




    public int? Currency_Stdt { get; set; }
    [ForeignKey("Currency_Stdt")]
    public virtual SetupDt_Data? SetupDt_Data_Currency { get; set; }




    public int? ToClientDesigId_Stdt { get; set; }
    [ForeignKey("ToClientDesigId_Stdt")]
    public virtual SetupDt_Data? SetupDt_Data_ToClientDesig { get; set; }
    public int? QuotationStatus_Stdt { get; set; }
    [ForeignKey("QuotationStatus_Stdt")]
    public virtual SetupDt_Data? SetupDt_Data_QuotationStatus { get; set; }
    public int? SignedById { get; set; }
    [ForeignKey("SignedById")]
    public virtual EmployeeInfoSetup? EmployeeInfoSetup { get; set; }
    public ICollection<QuotationDt> QuotationsDt { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }



}
