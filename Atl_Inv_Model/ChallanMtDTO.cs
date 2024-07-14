using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_Model;

public partial class ChallanMtDTO
{
    public int ChallanId { get; set; }
    public string? ChallanNo { get; set; }

    [Range(1, int.MaxValue, ErrorMessage = "WorkOrderId is required")]
    public int? WorkOrderId { get; set; }
    public virtual WorkOrder? WorkOrder { get; set; }


    [Range(1, int.MaxValue, ErrorMessage = "QuotationId is required")]
    public int? QuotationId { get; set; }
    public virtual QuotationMT? QuotationMT { get; set; }

    public string? Status { get; set; }


    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }
}
