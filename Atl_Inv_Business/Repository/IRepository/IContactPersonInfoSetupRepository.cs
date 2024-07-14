using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IContactPersonInfoSetupRepository
    {
        public Task<ContactPersonInfoSetupDTO> Create(ContactPersonInfoSetupDTO objDTO);
        public Task<ContactPersonInfoSetupDTO> Get(int ContactPersonId);
     
      public Task<IEnumerable<ContactPersonInfoSetupDTO>> GetAll();
    }
}
