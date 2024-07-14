using Atl_Inv_DataAccess.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class ChallanMt
{
    [Key]
    public int ChallanId { get; set; }


    public string? ChallanNo { get; set; }
    


    public int? WorkOrderId { get; set; }
    [ForeignKey ("WorkOrderId")]
    public virtual WorkOrder? WorkOrder { get; set; }


    public int? QuotationId { get; set; }
    [ForeignKey("QuotationId")]
    public virtual QuotationMT? QuotationMT { get; set; }

    public string? Status { get; set; }


    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

}
