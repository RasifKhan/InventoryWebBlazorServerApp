using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
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
    public class ProductInfoSetupRepository : IProductInfoSetupRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public ProductInfoSetupRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<ProductInfoSetupDTO> Create(ProductInfoSetupDTO objDTO, string UserId)
        {
            var obj = _mapper.Map<ProductInfoSetupDTO, ProductInfoSetup>(objDTO);
            var addedObj = _db.ProductInfosSetup.Add(obj);
            obj.AddedBy = UserId;
            obj.AddedDate = DateTime.Now;
            await _db.SaveChangesAsync();
            return _mapper.Map<ProductInfoSetup, ProductInfoSetupDTO>(addedObj.Entity);
        }










        public async Task<IEnumerable<ProductInfoSetupDTO>> GetAll()
        {
          return _mapper.Map<IEnumerable<ProductInfoSetup>, IEnumerable<ProductInfoSetupDTO>>(_db.ProductInfosSetup);
        }

        public async Task<int> Delete(int Id)
        {
            var obj = await _db.ProductInfosSetup.FirstOrDefaultAsync(u => u.ProductId == Id);
            if (obj != null)
            {
                _db.ProductInfosSetup.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }





        public async Task<ProductInfoSetupDTO> Get(int id)
        {
            var obj = await _db.ProductInfosSetup.FirstOrDefaultAsync(u => u.ProductId == id);
            if (obj != null)
            {
                return _mapper.Map<ProductInfoSetup, ProductInfoSetupDTO>(obj);
            }
            return new ProductInfoSetupDTO();
        }


        public async Task<ProductInfoSetupDTO> Update(ProductInfoSetupDTO objDTO,string UserId)
        {
            var objFromDb = await _db.ProductInfosSetup.FirstOrDefaultAsync(u => u.ProductId == objDTO.ProductId);
            if (objFromDb != null)
            {
                objFromDb.ProductName = objDTO.ProductName;
                objFromDb.Description = objDTO.Description;
                objFromDb.ImmageUrl = objDTO.ImmageUrl;
                objFromDb.UpdatedBy = UserId;
                
                objFromDb.UpdatedDate =DateTime.Now;

                //objFromDb.ShopFavorites = objDTO.ShopFavorites;
                //objFromDb.CustomerFavorites = objDTO.CustomerFavorites;
                _db.ProductInfosSetup.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<ProductInfoSetup, ProductInfoSetupDTO>(objFromDb);
            }
            return objDTO;
        }

        //public async Task<ContactPersonInfoSetupDTO> Create(ContactPersonInfoSetupDTO objDTO)
        //{
        //    var obj = _mapper.Map<ContactPersonInfoSetupDTO, ContactPersonInfoSetup>(objDTO);
        //    var addedObj = _db.ContactPersonInfosSetup.Add(obj);

        //    await _db.SaveChangesAsync();
        //    return _mapper.Map<ContactPersonInfoSetup, ContactPersonInfoSetupDTO>(addedObj.Entity);
        //}






        //public async Task<IEnumerable<ContactPersonInfoSetupDTO>> GetAll()
        //{
        //    return _mapper.Map<IEnumerable<ContactPersonInfoSetup>, IEnumerable<ContactPersonInfoSetupDTO>>(_db.ContactPersonInfosSetup);
        //}




    }
}
