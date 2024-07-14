using Atl_Inv_DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_Model;
public partial class ChallanDtDTO
{
  
    public int ChallanDtId { get; set; }
    public int? ChallanId { get; set; }
    public virtual ChallanMt? ChallanMt { get; set; }
    public int? ProductId { get; set; }
    public int? StockdtId { get; set; }
    public virtual StockDt? StockDt { get; set; }
    public int? WorkOrderId { get; set; }
    public virtual WorkOrder? WorkOrder { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }
}
