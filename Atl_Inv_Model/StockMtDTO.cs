using Atl_Inv_DataAccess.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_Model;

public partial class StockMtDTO
{
    public int StockId { get; set; }

    public string? MaterialReceiptNote { get; set; }

    public DateTime? Mrndate { get; set; }

    public string? BillNo { get; set; }

    public DateTime? BillDate { get; set; }

    public string? MrnchallanNo { get; set; }

    public DateTime? MrnchallanDate { get; set; }

    public DateTime? RcvDate { get; set; }
    public int? StoreId { get; set; }
    public int? VendorId { get; set; }
    public string? PoNo { get; set; }
    public DateTime? PoDate { get; set; }
    public string? Remarks { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }
}
