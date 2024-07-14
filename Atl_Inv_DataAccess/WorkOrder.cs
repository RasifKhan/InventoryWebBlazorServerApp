using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class WorkOrder
{
    [Key]
    public int WorkOrderId { get; set; }

    public string? WorkOrderNo { get; set; }

    public int? QuotationId { get; set; }
    [ForeignKey("QuotationId")]
    public virtual QuotationMT? QuotationMT { get; set; }




    public DateTime? WorkOrderDate { get; set; }

    public DateTime? Deadline { get; set; }

    public string? Details { get; set; }

    public string? Currency { get; set; }

    public decimal? QuotationNetTotal { get; set; }

    public decimal? QuotationGrandTotal { get; set; }

    public decimal? WorkOrderAmount { get; set; }

    public string? Remarks { get; set; }

    public string? ChallanStatus { get; set; }


    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }
}
