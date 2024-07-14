using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface ISetupMt_DataRepository
    {
        public Task<SetupMt_DataDTO> Create(SetupMt_DataDTO objDTO, string UserId);
        public Task<SetupMt_DataDTO> Get(int SetupMT_Id);
        public Task<SetupMt_DataDTO> Update(SetupMt_DataDTO objDTO, string UserId);
        public Task<int> Delete(int SetupMT_Id);
        public Task<IEnumerable<SetupMt_DataDTO>> GetAll();
    }
}
