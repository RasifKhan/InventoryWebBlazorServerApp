using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class QuotationDtRepository : IQuotationDtRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public QuotationDtRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        //public async Task<QuotationDtDTO> Create(QuotationDtDTO objDTO)
        //{
        //    var obj = _mapper.Map<QuotationDtDTO, QuotationDt>(objDTO);
        //    var addedObj = _db.QuotationsDt.Add(obj);
        //    await _db.SaveChangesAsync();
        //    return _mapper.Map<QuotationDt, QuotationDtDTO>(addedObj.Entity);
        //}



        public async Task<QuotationDtDTO> Create(QuotationDtDTO objDTO, string UserId)
        {
            // Check if the product already exists
            bool productExists = await _db.QuotationsDt.AnyAsync(q => q.ProductId == objDTO.ProductId && q.QuotationId == objDTO.QuotationId);

            if (productExists)
            {
                // Product already exists, return appropriate message or handle as needed
                throw new InvalidOperationException("Product already exists in the quotation.");
            }
           else
            {
                var obj = _mapper.Map<QuotationDtDTO, QuotationDt>(objDTO);
                var addedObj = _db.QuotationsDt.Add(obj);
                obj.AddedBy = UserId;
                obj.AddedDate = DateTime.Now;
                obj.UpdatedBy = "N/A";
                await _db.SaveChangesAsync();
                return _mapper.Map<QuotationDt, QuotationDtDTO>(addedObj.Entity);
            }
        }


        //public async Task<QuotationDtDTO> Create(QuotationDtDTO objDTO)
        //{
        //    // Check if the product already exists
        //    bool productExists = await _db.QuotationsDt.AnyAsync(q => q.ProductId == objDTO.ProductId && q.QuotationId == objDTO.QuotationId);

        //    if (productExists)
        //    {
        //        // Product already exists, set validation message
        //        //objDTO.ValidationMessages.Add("Product already exists in the quotation.");
        //        //return objDTO;
        //    }
        //    else
        //    {
        //        var obj = _mapper.Map<QuotationDtDTO, QuotationDt>(objDTO);
        //        var addedObj = _db.QuotationsDt.Add(obj);
        //        await _db.SaveChangesAsync();
        //        return _mapper.Map<QuotationDt, QuotationDtDTO>(addedObj.Entity);
        //    }

        //    // Return DTO with or without validation message
        //    return objDTO;
        //}



        public async Task<IEnumerable<QuotationDtDTO>> GetAll(int? id = null)
        {

            if (id != null && id > 0)
            {
                return _mapper.Map<IEnumerable<QuotationDt>, IEnumerable<QuotationDtDTO>>
                    (_db.QuotationsDt.Include(u => u.ProductInfoSetup).
                    Where(u => u.QuotationId == id)
                    );
            }
            else
            {
                return _mapper.Map<IEnumerable<QuotationDt>, IEnumerable<QuotationDtDTO>>(_db.QuotationsDt);
            }
        }


        public async Task<IEnumerable<QuotationDtDTO>> GetAll2(int? id = null)
        {

            if (id != null && id > 0)
            {
                return _mapper.Map<IEnumerable<QuotationDt>, IEnumerable<QuotationDtDTO>>
                    (_db.QuotationsDt.Include(u => u.ProductInfoSetup).
                    Where(u => u.QuotationDtId == id)
                    );
            }
            else
            {
                return _mapper.Map<IEnumerable<QuotationDt>, IEnumerable<QuotationDtDTO>>(_db.QuotationsDt);
            }
        }



        //public async Task<IEnumerable<QuotationDtDTO>> GetAll(int? id = null)
        //{

        //    if (id != null && id > 0)
        //    {
        //        return _mapper.Map<IEnumerable<QuotationDt>, IEnumerable<QuotationDtDTO>>
        //            (_db.QuotationsDt.Include(u => u.ProductInfoSetup).
        //            Where(u => u.QuotationDtId == id)
        //            );
        //    }
        //    else
        //    {
        //        return _mapper.Map<IEnumerable<QuotationDt>, IEnumerable<QuotationDtDTO>>(_db.QuotationsDt);
        //    }


        //}





        public async Task<QuotationDtDTO> Update(QuotationDtDTO objDTO, string UserId)
        {
            var objFromDb = await _db.QuotationsDt.FirstOrDefaultAsync(u => u.QuotationDtId == objDTO.QuotationDtId);
            if (objFromDb != null)
            {
                objFromDb.UnitPrice = objDTO.UnitPrice;
                objFromDb.Quantity = objDTO.Quantity;
                objFromDb.ProductId = objDTO.ProductId;
                objFromDb.TotalPrice = objDTO.TotalPrice;
               
              //  objFromDb.QuotationId = objDTO.QuotationId;
                objFromDb.VatPercent = objDTO.VatPercent;
                objFromDb.VatAmount = objDTO.VatAmount;
                objFromDb.TaxPercent = objDTO.TaxPercent;
                objFromDb.TaxAmount = objDTO.TaxAmount;

                objFromDb.AtiPercent = objDTO.AtiPercent;
                objFromDb.AtiAmount = objDTO.AtiAmount;
                objFromDb.OtherRemarks = objDTO.OtherRemarks;
                objFromDb.OtherPercent = objDTO.OtherPercent;
                objFromDb.OtherAmount = objDTO.OtherAmount;

                objFromDb.UpdatedBy = UserId;
                objFromDb.UpdatedDate = DateTime.Now;
                _db.QuotationsDt.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<QuotationDt, QuotationDtDTO>(objFromDb);
            }
            return objDTO;
        }
        public async Task<decimal> GetNetTotalSum(int quotationId)
        {
            var sum = await _db.QuotationsDt
                              .Where(q => q.QuotationId == quotationId)
                              .SumAsync(q => (decimal?)q.TotalPrice) ?? 0;
            return sum;
        }

        public async Task<decimal> GetGrandTotalSum(int quotationId)
        {
            var sum = await _db.QuotationsDt
                              .Where(q => q.QuotationId == quotationId)
                              .SumAsync(q => (decimal?)q.TotalPrice+q.VatAmount+q.TaxAmount+q.AtiAmount+ q.OtherAmount) ?? 0;
            return sum;

           /*Note: Here I Used LINQ for retrieving Data. this one actually works like the SQLquerry down bello :
            * SELECT SUM(TotalPrice +VatAmount + TaxAmount + AtiAmount + OtherAmount) AS TotalSum
            FROM QuotationsDT
            WHERE QuotationId = 2038;
           */
        }

        public async Task<int> Delete(int Id)
        {
            var obj = await _db.QuotationsDt.FirstOrDefaultAsync(u => u.QuotationDtId == Id);
            if (obj != null)
            {
                _db.QuotationsDt.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }
        public async Task<QuotationDtDTO> Get(int QuotationDtId)
        {
            var obj = await _db.QuotationsDt.FirstOrDefaultAsync(u => u.QuotationDtId == QuotationDtId);
            if (obj != null)
            {
                return _mapper.Map<QuotationDt, QuotationDtDTO>(obj);
            }
            return new QuotationDtDTO();
        }
    }
}










