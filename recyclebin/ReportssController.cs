using AspNetCore.Reporting;
using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace Atl_Inv_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class ReportssController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly IReportRepository _reportRepository;
        public ReportssController(IWebHostEnvironment webHostEnvironment, IReportRepository reportRepository, ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
            _webHostEnvironment = webHostEnvironment;
            _reportRepository = reportRepository;
            System.Text.Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        }
        [HttpGet]
        [Route("GetProductReport")]
        // public async Task<IActionResult> GetNewReport(int reportType)
        public async Task<IActionResult> GetProductReport(int reportType, string? productName)
        {
            try
            {
                //var orderData = await _reportEmployeeList.GetOrderReport();
                var dt = await _reportRepository.GetProductReport(productName);
                if (dt == null || !dt.Any())
                {
                    return BadRequest("No data available for the report.");
                }
                string mimeType = "";
                int extension = 1;
                // var path = $"{this._webHostEnvironment.WebRootPath}\\Reports\\Report1.rdlc";
                //   var path = $"{this._webHostEnvironment.WebRootPath}Report\\reportOrderInfo.rdlc";
                //var path = $"{this._webHostEnvironment.WebRootPath}Reports\\ProductInfo.rdlc";       //ProductTestNew
                var path = $"{this._webHostEnvironment.WebRootPath}Reports\\testproductrpt.rdlc";
                Dictionary<string, string> parameters = new Dictionary<string, string>(); //del
                parameters.Add("param", productName);   //del


                LocalReport localReport = new LocalReport(path);
                // localReport.AddDataSource("dsProdInfo", dt);
                //localReport.AddDataSource("ProductDataSet", dt);
                localReport.AddDataSource("InventoryWebDataSet", dt);


                if (reportType == 1)
                {
                    var result = localReport.Execute(RenderType.Pdf, extension, parameters, mimeType);
                    return File(result.MainStream, "application/pdf");
                }

                else
                {
                    var result = localReport.Execute(RenderType.Excel, extension, parameters, mimeType);
                    return File(result.MainStream, "application/msexcel", "report.xls");
                }
            }

            catch (Exception ex)
            {
                Console.Error.WriteLine($"An error occurred: {ex.Message}");
                return StatusCode(500, "An error occurred while generating the report.");
            }
        }
    }
    }
