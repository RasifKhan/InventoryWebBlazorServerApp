using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class StockDtDTO
{
    public int StockdtId { get; set; }
    public int? StockId { get; set; }
    [Range(1, int.MaxValue, ErrorMessage = "StockId is required")]
    public virtual StockMt? StockMt { get; set; }
    public string? Status { get; set; }
    [Range(1, int.MaxValue, ErrorMessage = "Product is required")]
    public int ProductId { get; set; }
    public virtual ProductInfoSetupDTO? ProductInfoSetup { get; set; }

   // public string? ProductName => ProductInfoSetup?.ProductName;

    public int? ProdQuantity { get; set; }
    public string? SerialNo { get; set; }
    public int? SerialId { get; set; }

    public string? ChallanStatus { get; set; }


    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

}
