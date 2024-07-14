using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IChallanDtRepository
    {

        public Task<int> InsertChallanDtSP(int StockdtId,int ProductId, int ChallanId, int WorkOrderId, string AddedBy, DateTime AddedDate);
        public Task<int> InsertChallansDtSP(int FromStockIdSelected, int ToStockIdSelected, int ChallanId, int ProductId, int WorkOrderId ,string AddedBy,DateTime AddedDate);
        public Task<int> GetCountChallanDtAddedProd(int ChallanId,int ProductId);
        public Task<int> GetChallanDtProdCount(int ChallanId);

        //public Task<ChallanMtDTO> Create(ChallanMtDTO objDTO);
        //public Task<ChallanMtDTO> Get(int ChallanId);
        //public Task<IEnumerable<ChallanMtDTO>> GetAll();
        //public Task<int> GetCountChallan(string ChallanNo);

        //   public Task<int> GetCountMRNChallanNo(string MRNChallanNo);
        //   public Task<int> GetMaxStockId();

    }
}
