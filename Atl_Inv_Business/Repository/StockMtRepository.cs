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
    public class StockMtRepository : IStockMtRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public StockMtRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<StockMtDTO> Create(StockMtDTO objDTO, string UserId)
        {
            var obj = _mapper.Map<StockMtDTO, StockMt>(objDTO);
            var addedObj = _db.StocksMt.Add(obj);
            //obj.Mrndate = DateTime.Now;
            //obj.BillDate = DateTime.Now;
            //obj.MrnchallanDate = DateTime.Now;
            //obj.RcvDate = DateTime.Now;
            obj.AddedBy  = UserId;
            obj.AddedDate = DateTime.Now;
            await _db.SaveChangesAsync();
            return _mapper.Map<StockMt, StockMtDTO>(addedObj.Entity);
        }


        public async Task<StockMtDTO> Update(StockMtDTO objDTO, string UserId)
        {
            var objFromDb = await _db.StocksMt.FirstOrDefaultAsync(u => u.StockId == objDTO.StockId);
            if (objFromDb != null)
            {
                _db.StocksMt.Update(objFromDb);

                objFromDb.UpdatedBy = UserId;
                objFromDb.UpdatedDate= DateTime.Now;
                await _db.SaveChangesAsync();
                return _mapper.Map<StockMt, StockMtDTO>(objFromDb);
            }
            return objDTO;
        }


        public async Task<IEnumerable<StockMtDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<StockMt>, IEnumerable<StockMtDTO>>(_db.StocksMt);

        }

        //public async Task<IEnumerable<StockMtDTO>> GetAll()
        //{
        //    // Assuming _db.StocksMt returns Task<IEnumerable<StockMt>> asynchronously
        //    var stocks = await _db.StocksMt.ToListAsync(); // Example of async database call

        //    // Map asynchronously
        //    var dtos = _mapper.Map<IEnumerable<StockMt>, IEnumerable<StockMtDTO>>(stocks);

        //    return dtos;
        //}



        public async Task<StockMtDTO> Get(int StockId)
        {
            var obj = await _db.StocksMt.FirstOrDefaultAsync(u => u.StockId == StockId);
            if (obj != null)
            {
                return _mapper.Map<StockMt, StockMtDTO>(obj);
            }
            return new StockMtDTO();
        }
        public async Task<int> Delete(int StockId)
        {
            var obj = await _db.StocksMt.FirstOrDefaultAsync(u => u.StockId == StockId);
            if (obj != null)
            {
                _db.StocksMt.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }




   



        public async Task<int> GetCountMaterialReceiptNote(string MaterialReceiptNote)
        {
            DateTime currentDate = DateTime.Now.Date;
            return await _db.StocksMt.CountAsync(z => z.MaterialReceiptNote.StartsWith($"MRN-{currentDate.ToString("yyMMdd")}") && z.MaterialReceiptNote != MaterialReceiptNote);
        }
        public async Task<int> GetCountMRNChallanNo(string MRNChallanNo)
        {
            DateTime currentDate = DateTime.Now.Date;
            return await _db.StocksMt.CountAsync(z => z.MrnchallanNo.StartsWith($"MRCHLN-{currentDate.ToString("yyMMdd")}") && z.MrnchallanNo != MRNChallanNo);
        }




        public async Task<int> GetMaxStockId()
        {
            var maxStockId = await _db.StocksMt.MaxAsync(u => (int?)u.StockId);

            if (maxStockId.HasValue)
            {
                return maxStockId.Value;
            }

            return 0; // Or any default value you want to use if there are no records
        }
    }
}
