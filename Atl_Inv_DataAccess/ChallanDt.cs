using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;
public partial class ChallanDt
{
    [Key]
    public int ChallanDtId { get; set; }
    public int? ChallanId { get; set; }
    [ForeignKey("ChallanId")]
    public virtual ChallanMt? ChallanMt { get; set; }
    public int? ProductId { get; set; }
    public int? StockdtId { get; set; }
    [ForeignKey("StockdtId")]
    public virtual StockDt? StockDt { get; set; }


    public int? WorkOrderId { get; set; }
    [ForeignKey("WorkOrderId")]
    public virtual WorkOrder? WorkOrder { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

}
