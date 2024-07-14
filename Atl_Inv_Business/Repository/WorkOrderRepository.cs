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
    public class WorkOrderRepository : IWorkOrderRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public WorkOrderRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<WorkOrderDTO> Create(WorkOrderDTO objDTO, string UserId)
        {
            var obj = _mapper.Map<WorkOrderDTO, WorkOrder>(objDTO);
            var addedObj = _db.WorkOrders.Add(obj);
            obj.WorkOrderDate= DateTime.Now;
            obj.Deadline = DateTime.Now;
            obj.AddedBy = UserId;
            obj.AddedDate = DateTime.Now;
            obj.UpdatedDate = null;
            obj.ChallanStatus = "Pending";
            await _db.SaveChangesAsync();
            return _mapper.Map<WorkOrder, WorkOrderDTO>(addedObj.Entity);
        }





        public async Task<WorkOrderDTO> Update(WorkOrderDTO objDTO, string UserId)
        {
            var objFromDb = await _db.WorkOrders.FirstOrDefaultAsync(u => u.WorkOrderId == objDTO.WorkOrderId);
            if (objFromDb != null)
            {
                //objFromDb.ProjectName = objDTO.ProjectName;
                //objFromDb.Subject = objDTO.Subject;
                //   objFromDb.TerritorySetupDT_Id = objDTO.TerritorySetupDT_Id;
                objFromDb.UpdatedBy = UserId;
                objFromDb.UpdatedDate = DateTime.Now;
               
                _db.WorkOrders.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<WorkOrder, WorkOrderDTO>(objFromDb);
            }
            return objDTO;
        }



        public async Task<IEnumerable<WorkOrderDTO>> GetAll()
        {
            // return _mapper.Map<IEnumerable<Quotation>, IEnumerable<QuotationDTO>>(_db.Quotations);
            return _mapper.Map<IEnumerable<WorkOrder>, IEnumerable<WorkOrderDTO>>(_db.WorkOrders.Include(u => u.QuotationMT));
           
        }



   


        public async Task<WorkOrderDTO> Get(int WorkOrderId)
        {
            var obj = await _db.WorkOrders.FirstOrDefaultAsync(u => u.WorkOrderId == WorkOrderId);
            if (obj != null)
            {
                return _mapper.Map<WorkOrder, WorkOrderDTO>(obj);
            }
            return new WorkOrderDTO();
        }


        public async Task<int> Delete(int WorkOrderId)
        {
            var obj = await _db.WorkOrders.FirstOrDefaultAsync(u => u.WorkOrderId == WorkOrderId);
            if (obj != null)
            {
                _db.WorkOrders.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }




        

        public async Task<int> GetCountForWorkOrderNo(string WorkOrderNo)
        {
            DateTime currentDate = DateTime.Now.Date;
            return await _db.WorkOrders.CountAsync(z => z.WorkOrderNo.StartsWith($"WO-{currentDate.ToString("yyMMdd")}") && z.WorkOrderNo != WorkOrderNo);
        }

        public async Task<int> GetMaxWorkOrderId()
        {
            var maxWorkOrderId = await _db.WorkOrders.MaxAsync(u => (int?)u.WorkOrderId);

            if (maxWorkOrderId.HasValue)
            {
                return maxWorkOrderId.Value;
            }

            return 0; // Or any default value you want to use if there are no records
        }

       

    }
}
