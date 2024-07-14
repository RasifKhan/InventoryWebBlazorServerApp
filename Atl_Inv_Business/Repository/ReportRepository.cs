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
    public class ReportRepository : IReportRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public ReportRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        //public async Task<IEnumerable<ProductInfoSetupDTO>> GetProductReport(string productName)
        //{
        //     throw new NotImplementedException();
        //}


        //ProductReport
        public async Task<IEnumerable<ProductInfoSetupDTO>> GetProductReport(string productName)
        {
            IEnumerable<ProductInfoSetup> productList;

            if (!string.IsNullOrEmpty(productName))
            {
                // If productName is provided, filter the results based on it
                productList = await _db.ProductInfosSetup.Where(o => o.ProductName == productName)
                                  .ToListAsync();
            }
            else
            {
                // If no productName provided, retrieve all order details
                productList = await _db.ProductInfosSetup.ToListAsync();
                //orderDetailList = await _db.VwCategoryProducts .ToListAsync();
            }

            List<ProductInfoSetupDTO> productDTOList = new List<ProductInfoSetupDTO>();
            foreach (ProductInfoSetup item in productList)
            {
                ProductInfoSetupDTO productInfoSetupDTO = new ProductInfoSetupDTO
                {
                    ProductId = item.ProductId,
                    ProductName = item.ProductName,
                   // Price = item.Price,
                };
                productDTOList.Add(productInfoSetupDTO);
            }
            return productDTOList;
        }


        

              public async Task<IEnumerable<QuotationDtDTO>> GetQuotationReport(string quotationNo)
        {
            IEnumerable<QuotationDt> quotationDtList;

            if (!string.IsNullOrEmpty(quotationNo))
            {
                // If productName is provided, filter the results based on it
                quotationDtList = await _db.QuotationsDt.Where(o => o.QuotationNo == quotationNo)
                                  .ToListAsync();
            }
            else
            {
                // If no productName provided, retrieve all order details
                quotationDtList = await _db.QuotationsDt.ToListAsync();
                //orderDetailList = await _db.VwCategoryProducts .ToListAsync();
            }

            List<QuotationDtDTO> quotationDtDtoList = new List<QuotationDtDTO>();
            foreach (QuotationDt item in quotationDtList)
            {
                QuotationDtDTO quotationDtDTO = new QuotationDtDTO
                {
                     
                    QuotationNo = item.QuotationNo,
                    ProductId = Convert.ToInt32(item.ProductId),
                    Quantity = Convert.ToInt32(item.Quantity),
                    UnitPrice = Convert.ToDecimal(item.UnitPrice),


                };
                quotationDtDtoList.Add(quotationDtDTO);
            }
            return quotationDtDtoList;
        }



















    }
}
