using Microsoft.AspNetCore.Components.Forms;

namespace Atl_Inv_Server.Service.IService
{
    public interface IFileUpload
    {
        // Task<string> UploadFile(IBrowserFile file);

        Task<string> UploadFile(IBrowserFile file);

        bool DeleteFile(string filePath);

    }
}
