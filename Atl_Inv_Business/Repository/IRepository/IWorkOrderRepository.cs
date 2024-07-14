using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IWorkOrderRepository
    {

        public Task<WorkOrderDTO> Create(WorkOrderDTO objDTO, string UserId);
        public Task<WorkOrderDTO> Update(WorkOrderDTO objDTO, string UserId);

        public Task<WorkOrderDTO> Get(int WorkOrderId);

        public Task<IEnumerable<WorkOrderDTO>> GetAll();

        public Task<int> Delete(int WorkOrderId);

        public Task<int> GetCountForWorkOrderNo(string WorkOrderNo);
        
        public Task<int> GetMaxWorkOrderId();

      
    }
}
