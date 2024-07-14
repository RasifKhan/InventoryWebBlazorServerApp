using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IChallanMtRepository
    {

        public Task<ChallanMtDTO> Create(ChallanMtDTO objDTO,string UserId);
        public Task<ChallanMtDTO> Get(int ChallanId);
        public Task<IEnumerable<ChallanMtDTO>> GetAll();
        public Task<int> GetCountChallan(string ChallanNo);
        public Task UpdateChallansMtStatus(int ChallanId);

        //   public Task<int> GetCountMRNChallanNo(string MRNChallanNo);
        //   public Task<int> GetMaxStockId();
        public Task<int> GetMaxChallanId();

    }
}
