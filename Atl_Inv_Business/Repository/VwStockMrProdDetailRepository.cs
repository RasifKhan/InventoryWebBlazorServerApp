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
    public class VwStockMrProdDetailRepository : IVwStockMrProdDetailRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public VwStockMrProdDetailRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        
        public async Task<VwStockMrProdDetailDTO> Get(int StockId)
        {
            var obj = await _db.VW_StockMrProdDetails.FirstOrDefaultAsync(u => u.StockId == StockId);
            if (obj != null)
            {
                return _mapper.Map<VwStockMrProdDetail, VwStockMrProdDetailDTO>(obj);
            }
            return new VwStockMrProdDetailDTO();
        }


        public async Task<IEnumerable<VwStockMrProdDetailDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<VwStockMrProdDetail>, IEnumerable<VwStockMrProdDetailDTO>>(_db.VW_StockMrProdDetails);
        }
    }
}
