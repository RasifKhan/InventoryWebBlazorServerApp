using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace Atl_Inv_DataAccess.Data.view
{
[Keyless]
public partial class VwStockMrProdDetail
  {
    public int StockId { get; set; }
    public string? MaterialReceiptNote { get; set; }

    public DateTime? MRNDate { get; set; }

    public string? BillNo { get; set; }

    public DateTime? BillDate { get; set; }

    public string? MRNChallanNo { get; set; }

    public DateTime? MRNChallanDate { get; set; }

    public DateTime? RcvDate { get; set; }

    public int? StoreId { get; set; }

    public int? VendorId { get; set; }

    public string? PoNo { get; set; }

    public DateTime? PoDate { get; set; }

    public string? Remarks { get; set; }

    public int? Quantiy { get; set; }

    public string? ProductName { get; set; }

    public int ProductId { get; set; }
    }
}


