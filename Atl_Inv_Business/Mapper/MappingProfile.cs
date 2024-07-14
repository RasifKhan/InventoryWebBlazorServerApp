using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_DataAccess.Data.view;
using Atl_Inv_Model;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Mapper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Zone, ZoneDTO>().ReverseMap();
            CreateMap<SetupMt_Data, SetupMt_DataDTO>().ReverseMap();
            CreateMap<SetupDt_Data, SetupDt_DataDTO>().ReverseMap();

            CreateMap<CompanyInfoSetup, CompanyInfoSetupDTO>().ReverseMap();
            CreateMap<ContactPersonInfoSetup, ContactPersonInfoSetupDTO>().ReverseMap();
            CreateMap<EmployeeInfoSetup, EmployeeInfoSetupDTO>().ReverseMap();
            CreateMap<QuotationMT, QuotationMTDTO>().ReverseMap();
            CreateMap<QuotationDt, QuotationDtDTO>().ReverseMap();
            CreateMap<ProductInfoSetup, ProductInfoSetupDTO>().ReverseMap();
            CreateMap<WorkOrder, WorkOrderDTO>().ReverseMap();
            CreateMap<StockMt, StockMtDTO>().ReverseMap();
            CreateMap<StockDt, StockDtDTO>().ReverseMap();
            CreateMap<ChallanMt, ChallanMtDTO>().ReverseMap();

            CreateMap<VwStockMrProdDetail, VwStockMrProdDetailDTO>().ReverseMap();
            CreateMap<VwWorkOrderProdDetail, VwWorkOrderProdDetailDTO>().ReverseMap();
            CreateMap<VwExistingStockProd, VwExistingStockProdDTO>().ReverseMap();
            CreateMap<ChallanDt, ChallanDtDTO>().ReverseMap();


            CreateMap<AspNetUserRole, AspNetUserRoleDTO>().ReverseMap();

            //CreateMap<AspNetUser, AspNetUserDTO>().ReverseMap();
            //CreateMap<AspNetRole, AspNetRoleDTO>().ReverseMap();
            


        }
    }
}



