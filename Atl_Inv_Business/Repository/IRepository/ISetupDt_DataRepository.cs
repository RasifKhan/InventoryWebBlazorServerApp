using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface ISetupDt_DataRepository
    {
        public Task<SetupDt_DataDTO> Create(SetupDt_DataDTO objDTO, string UserId);
        public Task<SetupDt_DataDTO> Get(int SetupDT_Id);
        public Task<SetupDt_DataDTO> Update(SetupDt_DataDTO objDTO, string UserId);
        public Task<int> Delete(int SetupDT_Id);
        public Task<IEnumerable<SetupDt_DataDTO>> GetAll();

       
    }
}
