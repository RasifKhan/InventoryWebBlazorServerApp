window.ShowToastr = (type, message) => {
    if (type === "success") {
        toastr.success(message, "Operation Successfull", { timeOut: 5000 });
    }
    if (type === "error") {
        toastr.error(message, "Operation failed", { timeOut: 5000 });
    }
}


function ShowDeleteConfirmationModal() {
    $('#deleteConfirmationModal').modal('show');
}


function HideDeleteConfirmationModal() {
    $('#deleteConfirmationModal').modal('hide');
}


window.bootstrapModalShow = (modalId) => {
	$('#' + modalId).modal('show');
};


window.bootstrapModalHide = (modalId) => {
    $('#' + modalId).modal('hide');
};

window.bootstrapEditModalShow = (modalId) => {
    $('#' + modalId).modal('show');
};



window.bootstrapEditModalHide = (modalId) => {
    $('#' + modalId).modal('hide');
};


function setFocusToProductId() {
    document.getElementById('productIdInput').focus();
}





// wwwroot/index.html















