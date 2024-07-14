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
    public class QuotationMTRepository : IQuotationMTRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public QuotationMTRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<QuotationMTDTO> Create(QuotationMTDTO objDTO, string UserId)
        {
            var obj = _mapper.Map<QuotationMTDTO, QuotationMT>(objDTO);
            var addedObj = _db.QuotationsMT.Add(obj);
            obj.ValidityDate = DateTime.Now;
            obj.AddedBy = UserId;
            obj.AddedDate = DateTime.Now;
            obj.ToDate = DateTime.Now;
            obj.NetTotal = 0;
            obj.UpdatedDate = null ;
            await _db.SaveChangesAsync();
            return _mapper.Map<QuotationMT, QuotationMTDTO>(addedObj.Entity);
        }

        public async Task<QuotationMTDTO> Update(QuotationMTDTO objDTO, string UserId)
        {
            var objFromDb = await _db.QuotationsMT.FirstOrDefaultAsync(u => u.QuotationId == objDTO.QuotationId);
            if (objFromDb != null)
            {
                objFromDb.ProjectName = objDTO.ProjectName;
                objFromDb.Subject = objDTO.Subject;
                objFromDb.UpdatedBy = UserId;
                objFromDb.UpdatedDate= DateTime.Now;
                objFromDb.QuotationStatus_Stdt = objDTO.QuotationStatus_Stdt;
             //   objFromDb.TerritorySetupDT_Id = objDTO.TerritorySetupDT_Id;
                _db.QuotationsMT.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<QuotationMT, QuotationMTDTO>(objFromDb);
            }
            return objDTO;
        }

        public async Task<IEnumerable<QuotationMTDTO>> GetAll()
        {
            // return _mapper.Map<IEnumerable<Quotation>, IEnumerable<QuotationDTO>>(_db.Quotations);
            return _mapper.Map<IEnumerable<QuotationMT>, IEnumerable<QuotationMTDTO>>(_db.QuotationsMT.Include(u => u.SetupDt_Data));
           
        }



        public async Task<int> GetCountForQuotationNo(string QuotationNo)
        {
            DateTime currentDate = DateTime.Now.Date;
            return await _db.QuotationsMT.CountAsync(z => z.QuotationNo.StartsWith($"QT-{currentDate.ToString("yyMMdd")}") && z.QuotationNo != QuotationNo);

        }



        //public async Task<int> GetCountForZoneTrack(string TrackZoneId)
        //{
        //    DateTime currentDate = DateTime.Now.Date;
        //    return await _db.Zones.CountAsync(z => z.TrackZoneId.StartsWith($"ZO-{currentDate.ToString("yyMMdd")}") && z.TrackZoneId != TrackZoneId);
        //}



        public async Task<QuotationMTDTO> Get(int QuotationId)
        {
            var obj = await _db.QuotationsMT.FirstOrDefaultAsync(u => u.QuotationId == QuotationId);
            if (obj != null)
            {
                return _mapper.Map<QuotationMT, QuotationMTDTO>(obj);
            }
            return new QuotationMTDTO();
        }


        public async Task<int> Delete(int QuotationId)
        {
            var obj = await _db.QuotationsMT.FirstOrDefaultAsync(u => u.QuotationId == QuotationId);
            if (obj != null)
            {
                _db.QuotationsMT.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }




        public async Task<decimal> UpdateNetGrandTotal(int QuotationId, decimal newNetTotal, decimal newGrandTotal)
        {
            var quotation = await _db.QuotationsMT
                                      .FirstOrDefaultAsync(q => q.QuotationId == QuotationId);

            if (quotation != null)
            {
                quotation.NetTotal = newNetTotal;
                quotation.GrandTotal= newGrandTotal;
                return await _db.SaveChangesAsync();
            }

            return 0.00M; // If no matching record is found
        }


        public async Task<int> UpdateQuotationStatus(int QuotationId)
        {
            var quotation = await _db.QuotationsMT
                                      .FirstOrDefaultAsync(q => q.QuotationId == QuotationId);

            if (quotation != null)
            {
                quotation.QuotationStatus_Stdt = 1020;     //1020 is a id from the table SetupDT_Datas
                return await _db.SaveChangesAsync();
            }

            return 1019; // If no matching record is found //1019 is a id from the table SetupDT_Datas
        }

        public async Task<int> GetMaxQuotationId()
        {
            var maxQuotationId = await _db.QuotationsMT.MaxAsync(u => (int?)u.QuotationId);

            if (maxQuotationId.HasValue)
            {
                return maxQuotationId.Value;
            }

            return 0; // Or any default value you want to use if there are no records
        }
    }
}
