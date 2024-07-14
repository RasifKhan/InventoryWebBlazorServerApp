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
    public class ChallanMtRepository : IChallanMtRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public ChallanMtRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }


        public async Task<ChallanMtDTO> Create(ChallanMtDTO objDTO, string UserId)
        {
            var obj = _mapper.Map<ChallanMtDTO, ChallanMt>(objDTO);
            var addedObj = _db.ChallansMt.Add(obj);
            obj.Status = "Pending";
            obj.AddedBy = UserId;
            obj.AddedDate = DateTime.Now;
           

            //obj.BillDate = DateTime.Now;
            //obj.MrnchallanDate = DateTime.Now;
            //obj.RcvDate = DateTime.Now;
            await _db.SaveChangesAsync();
            return _mapper.Map<ChallanMt, ChallanMtDTO>(addedObj.Entity);
        }


        public async Task<IEnumerable<ChallanMtDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<ChallanMt>, IEnumerable<ChallanMtDTO>>(_db.ChallansMt);

        }


        public async Task UpdateChallansMtStatus(int challanId)
        {
            var challanMt = await _db.ChallansMt.FirstOrDefaultAsync(cm => cm.ChallanId == challanId);
                challanMt.Status = "Done";
                await _db.SaveChangesAsync();
        
        }




        //public async Task<ChallanMtDTO> Update(StockMtDTO objDTO)
        //{
        //    var objFromDb = await _db.StocksMt.FirstOrDefaultAsync(u => u.StockId == objDTO.StockId);
        //    if (objFromDb != null)
        //    {
        //        _db.StocksMt.Update(objFromDb);
        //        await _db.SaveChangesAsync();
        //        return _mapper.Map<StockMt, StockMtDTO>(objFromDb);
        //    }
        //    return objDTO;
        //}


        public async Task<ChallanMtDTO> Get(int ChallanId)
        {
            var obj = await _db.ChallansMt.FirstOrDefaultAsync(u => u.ChallanId == ChallanId);
            if (obj != null)
            {
                return _mapper.Map<ChallanMt, ChallanMtDTO>(obj);
            }
            return new ChallanMtDTO();
        }


        //public async Task<int> Delete(int StockId)
        //{
        //    var obj = await _db.StocksMt.FirstOrDefaultAsync(u => u.StockId == StockId);
        //    if (obj != null)
        //    {
        //        _db.StocksMt.Remove(obj);
        //        return await _db.SaveChangesAsync();
        //    }
        //    return 0;
        //}





        public async Task<int> GetCountChallan(string ChallanNo)
        {
            DateTime currentDate = DateTime.Now.Date;
            return await _db.ChallansMt.CountAsync(z => z.ChallanNo.StartsWith($"CHLN-{currentDate.ToString("yyMMdd")}") && z.ChallanNo != ChallanNo);
        }



        //public async Task<int> GetCountMRNChallanNo(string MRNChallanNo)
        //{
        //    DateTime currentDate = DateTime.Now.Date;
        //    return await _db.StocksMt.CountAsync(z => z.MrnchallanNo.StartsWith($"MRCHLN-{currentDate.ToString("yyMMdd")}") && z.MrnchallanNo != MRNChallanNo);
        //}



        public async Task<int> GetMaxChallanId()
        {
            var maxChallanId = await _db.ChallansMt.MaxAsync(u => (int?)u.ChallanId);

            if (maxChallanId.HasValue)
            {
                return maxChallanId.Value;
            }

            return 0; // Or any default value you want to use if there are no records
        }

    }
}
