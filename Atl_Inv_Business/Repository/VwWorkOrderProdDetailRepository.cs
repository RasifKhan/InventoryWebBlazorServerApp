using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_DataAccess.Data.view;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class VwWorkOrderProdDetailRepository : IVwWorkOrderProdDetailRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public VwWorkOrderProdDetailRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

       

         public async Task<VwWorkOrderProdDetailDTO> Get(int WorkOrderId)
        {
            var obj = await _db.VW_WorkOrderProdDetails.FirstOrDefaultAsync(u => u.WorkOrderId == WorkOrderId);
            if (obj != null)
            {
                return _mapper.Map<VwWorkOrderProdDetail, VwWorkOrderProdDetailDTO>(obj);
            }
            return new VwWorkOrderProdDetailDTO();
        }


        public async Task<IEnumerable<VwWorkOrderProdDetailDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<VwWorkOrderProdDetail>, IEnumerable<VwWorkOrderProdDetailDTO>>(_db.VW_WorkOrderProdDetails);
        }



      //  public Task<int> GetSumTotalQuotProd(int WorkOrderId);

        public async Task<int> GetSumTotalQuotProd(int workOrderId)
        {
            return await _db.VW_WorkOrderProdDetails
                            .Where(w => w.WorkOrderId == workOrderId)
                            .SumAsync(w => w.QuotationQty ?? 0);
        }



    }
}
