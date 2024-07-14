

using Microsoft.JSInterop;

namespace Atl_Inv_Server.Helper
{
    public static class IJSRuntimeExtention
    {
        public static async ValueTask ToastrSuccess(this IJSRuntime jsRuntime, string message)
        {
            await jsRuntime.InvokeVoidAsync("ShowToastr", "success", message);
        }

        public static async ValueTask ToastrError(this IJSRuntime jsRuntime, string message)
        {
            await jsRuntime.InvokeVoidAsync("ShowToastr", "error", message);
        }
    }
}




//public static class IJSRuntimeExtention
//{
//    public static async ValueTask ToastrSuccess(this IJSRuntime jsRuntime, string message)
//    {
//        await jsRuntime.InvokeVoidAsync("ShowToastr", "success", message);
//    }

//    public static async ValueTask ToastrError(this IJSRuntime jsRuntime, string message)
//    {
//        await jsRuntime.InvokeVoidAsync("ShowToastr", "error", message);
//    }
//}