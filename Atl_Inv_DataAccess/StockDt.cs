using Atl_Inv_DataAccess.Data;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace Atl_Inv_DataAccess;

public partial class StockDt
{
    [Key]
    public int StockdtId { get; set; }
    public int? StockId { get; set; }
    [ForeignKey("StockId")]
    public virtual StockMt? StockMt { get; set; }
    public string? Status { get; set; }
    public int? ProductId { get; set; }
    [ForeignKey("ProductId")]
    public virtual ProductInfoSetup? ProductInfoSetup { get; set; }
    public int? ProdQuantity { get; set; }
    public string? SerialNo { get; set; }
    public int? SerialId { get; set; }

    public string? ChallanStatus { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

}
