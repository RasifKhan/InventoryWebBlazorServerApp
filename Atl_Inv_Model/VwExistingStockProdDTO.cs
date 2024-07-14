using System;
using System.Collections.Generic;
namespace Atl_Inv_Model;

public partial class VwExistingStockProdDTO
{
    public int StockdtId { get; set; }

    public int? ProdQuantity { get; set; }

    public string? SerialNo { get; set; }

    public int? SerialId { get; set; }

    public int WorkOrderId { get; set; }

    public string? WorkOrderNo { get; set; }

    public int ProductId { get; set; }

    public string? ProductName { get; set; }

    public int ChallanId { get; set; }
}
