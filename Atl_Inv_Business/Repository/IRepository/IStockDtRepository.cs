using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IStockDtRepository
    {


       

        public Task<int> InsertStockdtSP(int FromNumber,int ToNumber,string Prefix,string Postfix,int StockId, int ProductId,string AddedBy, DateTime AddedDate);
        public Task<IEnumerable<StockDtDTO>> GetAll();


        public Task<StockDtDTO> Update(StockDtDTO objDTO,string UserId);


        public Task<StockDtDTO> Get(int StockId, int ProductId);


        public Task<int> GetCountStockIdFromTo(int Productid, string ChallanStatus, int FromStockId, int ToStockId);
    }
}
