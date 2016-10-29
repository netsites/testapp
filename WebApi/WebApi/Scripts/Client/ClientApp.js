var ClientApp = ClientApp || {};

(function ($, ClientApp) {
    ClientApp.selectedAreaId = 0;

    ClientApp.GetAreas = function () {
        var url = "/api/areas";
        $.getJSON(url,{},ClientApp.ManageGetAreasResponse);
    };

    ClientApp.ManageGetAreasResponse = function (data) {
            var tempFn = doT.template($('#areasListTemplate').html());            
            var resultText = tempFn(data);
            $('#grid').html(resultText);
    };

    ClientApp.ShowEditModal = function (areaId) {
        ClientApp.selectedAreaId = areaId;
        $('#txtEditNombreArea').val($('#area-' + areaId + ' td:eq(1)').text());
        $('#modal').modal('show');
    };
    ClientApp.ShowDeleteModal = function (areaId) {
        ClientApp.selectedAreaId = areaId;
        $('#deleteModal').modal('show');
    };

    ClientApp.GetAreas();

    ClientApp.AddArea = function (areaName) {
        var url = "/api/areas";
        var data = { Nombre: areaName };
        $.post(url, data, ClientApp.ManageAddOrEditAreaResponse, 'json');
    };

    ClientApp.EditArea = function (areaId,areaName) {
        var url = "/api/areas/"+areaId;
        var data = {Id:areaId, Nombre: areaName };

        $.ajax({
            type: 'put',
            url: url,
            data: data,
            success: ClientApp.ManageAddOrEditAreaResponse
        });
        //$.put(url, data, ClientApp.ManageAddOrEditAreaResponse, 'json');
    };

    ClientApp.ManageAddOrEditAreaResponse = function (data) {
        ClientApp.GetAreas();

        $('#modal').modal('hide');
    };

    ClientApp.CancelDelete = function () {
        $('#deleteModal').modal('hide');
    };

    ClientApp.DeleteArea = function (areaId) {
        var url = "/api/areas/" + areaId;
        $.ajax({
            type: 'delete',
            url: url,
            success: ClientApp.ManageDeleteAreaResponse
        });
    };

    ClientApp.ManageDeleteAreaResponse = function () {
        ClientApp.GetAreas();
        $('#deleteModal').modal('hide');
    };



    $('#btnAdd').click(function () {

        var areaName = $('#txtNombreArea').val();
        ClientApp.AddArea(areaName);
    });

    $('#btnEdit').click(function () {
        var areaName = $('#txtEditNombreArea').val();
        ClientApp.EditArea(ClientApp.selectedAreaId, areaName);
    });


    $('#btnDelete').click(function () {
        ClientApp.DeleteArea(ClientApp.selectedAreaId);
    });

})(jQuery,ClientApp);