using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess.Data;

public partial class QuotationDt
{
    public int QuotationDtId { get; set; }

    public int? QuotationId { get; set; }
    [ForeignKey("QuotationId")]
    public virtual QuotationMT? QuotationMT { get; set; }
    public string? QuotationNo { get; set; }
    public int? ProductId { get; set; }
    [ForeignKey("ProductId")]
    public virtual ProductInfoSetup? ProductInfoSetup { get; set; }
    public int? Quantity { get; set; }
    public decimal? UnitPrice { get; set; }
    public decimal? TotalPrice { get; set; }



    public decimal? VatPercent { get; set; }
    public decimal? VatAmount { get; set; }

    public decimal? TaxPercent { get; set; }
    public decimal? TaxAmount { get; set; }


    public decimal? AtiPercent { get; set; }
    public decimal? AtiAmount { get; set; }

    public decimal? OtherPercent { get; set; }
    public decimal? OtherAmount { get; set; }

    public string? OtherRemarks { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }


}
