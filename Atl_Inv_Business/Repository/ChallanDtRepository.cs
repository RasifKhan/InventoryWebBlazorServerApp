using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class ChallanDtRepository : IChallanDtRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;



        public ChallanDtRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }



   
        public async Task<int> InsertChallanDtSP(int StockdtId ,int ProductId ,int ChallanId, int WorkOrderId,string AddedBy,DateTime AddedDate)
        {
            var result = await _db.Database
            .ExecuteSqlInterpolatedAsync($"SP_ChallanDtInsertData {StockdtId},{ProductId},{ChallanId},{WorkOrderId},{AddedBy},{AddedDate}");
            return result;
        }



        public async Task<int> InsertChallansDtSP(int FromStockIdSelected, int ToStockIdSelected, int ChallanId, int ProductId,
                                                  int WorkOrderId, string AddedBy, DateTime AddedDate)
        {
            var result = await _db.Database
            .ExecuteSqlInterpolatedAsync($"SP_InsertChallansDt {FromStockIdSelected},{ToStockIdSelected},{ChallanId},{ProductId} ,{WorkOrderId},{AddedBy},{AddedDate}");
            return result;
        }




        public async Task<int> GetCountChallanDtAddedProd(int ChallanId, int ProductId)
        {
            return await _db.ChallansDt
                   .Where(c => c.ChallanId == ChallanId && c.ProductId == ProductId)
                   .CountAsync();
        }
        public async Task<int> GetChallanDtProdCount(int challanId)
        {
            return await _db.ChallansMt
                            .Join(_db.ChallansDt, cm => cm.ChallanId, cd => cd.ChallanId, (cm, cd) => new { cm, cd })
                            .Where(joined => joined.cm.ChallanId == challanId)
                            .Select(joined => joined.cd.ChallanDtId)
                            .CountAsync();
        }
    }
}
