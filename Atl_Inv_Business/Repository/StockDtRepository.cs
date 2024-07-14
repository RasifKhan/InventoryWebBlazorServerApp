using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_DataAccess.Data.view;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class StockDtRepository : IStockDtRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public StockDtRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }




        //public async Task<int> InsertStockdtSP(int FromNumber, int ToNumber, string Prefix, string Postfix,
        //                                       int StockId, int ProductId, string AddedBy,DateTime AddedDate)
        //{
        //    var result = await _db.Database
        //    .ExecuteSqlInterpolatedAsync($"SP_StockDtInsertData {FromNumber},{ToNumber},{Prefix},{Postfix},{StockId},{ProductId},{AddedBy},{AddedDate}");
        //    return result;
        //}
        //To Protect SQL Injection

        public async Task<int> InsertStockdtSP(int FromNumber, int ToNumber, string Prefix, string Postfix,
                                       int StockId, int ProductId, string AddedBy, DateTime AddedDate)
        {
            var fromNumberParam = new SqlParameter("@FromNumber", FromNumber);
            var toNumberParam = new SqlParameter("@ToNumber", ToNumber);
            var prefixParam = new SqlParameter("@Prefix", Prefix ?? (object)DBNull.Value);
            var postfixParam = new SqlParameter("@Postfix", Postfix ?? (object)DBNull.Value);
            var stockIdParam = new SqlParameter("@StockId", StockId);
            var productIdParam = new SqlParameter("@ProductId", ProductId);
            var addedByParam = new SqlParameter("@AddedBy", AddedBy ?? (object)DBNull.Value);
            var addedDateParam = new SqlParameter("@AddedDate", AddedDate);

            var result = await _db.Database
                .ExecuteSqlRawAsync("EXEC SP_StockDtInsertData @FromNumber, @ToNumber, @Prefix, @Postfix, @StockId, @ProductId, @AddedBy, @AddedDate",
                                    fromNumberParam, toNumberParam, prefixParam, postfixParam, stockIdParam, productIdParam, addedByParam, addedDateParam);
            return result;
        }


        public async Task<IEnumerable<StockDtDTO>> GetAll()
        {
            //return _mapper.Map<IEnumerable<StockDt>, IEnumerable<StockDtDTO>>(_db.StocksDt);
            return _mapper.Map<IEnumerable<StockDt>, IEnumerable<StockDtDTO>>(_db.StocksDt.Include(u => u.ProductInfoSetup));
        }


        public async Task<StockDtDTO> Update(StockDtDTO objDTO, string UserId)
        {
            var objFromDb = await _db.StocksDt.FirstOrDefaultAsync(u => u.StockdtId == objDTO.StockdtId);
            if (objFromDb != null)
            {
                objFromDb.SerialNo = objDTO.SerialNo;
                objFromDb.UpdatedBy = UserId;
                objFromDb.UpdatedDate = DateTime.Now;
                _db.StocksDt.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<StockDt, StockDtDTO>(objFromDb);
            }
            return objDTO;
        }


        public async Task<StockDtDTO> Get(int StockId, int ProductId)
        {
            var obj = await _db.StocksDt.FirstOrDefaultAsync(u => u.StockId == StockId && u.ProductId == ProductId);
            if (obj != null)
            {
                return _mapper.Map<StockDt, StockDtDTO>(obj);
            }
            return new StockDtDTO();
        }


        // public Task<int> GetCountStockIdFromTo(int Productid, string ChallanStatus, int FromStockId, int ToStockId);
        public async Task<int> GetCountStockIdFromTo(int Productid, string ChallanStatus, int FromStockId, int ToStockId)
        {
            return await _db.StocksDt
              .Where(s => s.ProductId == Productid && s.ChallanStatus == "N" && s.StockdtId >= FromStockId && s.StockdtId <= ToStockId)
              .CountAsync();
        }
    }
}
