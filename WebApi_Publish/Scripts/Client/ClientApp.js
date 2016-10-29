var ClientApp = ClientApp || {};

(function ($, ClientApp) {

    ClientApp.GetAreas = function () {
        var url = "/api/areas";
        $.getJSON(url,{},ClientApp.ManageGetAreasResponse);
    };

    ClientApp.ManageGetAreasResponse = function (data) {
            var tempFn = doT.template($('#areasListTemplate').html());            
            var resultText = tempFn(data);
            $('#grid').html(resultText);
    };

    ClientApp.GetAreas();

    ClientApp.AddArea = function (areaName) {
        var url = "/api/areas";
        var data = { Nombre: areaName };
        $.post(url,data,ClientApp.ManageAddAreaResponse,'json');
    };

    ClientApp.ManageAddAreaResponse = function(data){
        ClientApp.GetAreas();
    };

    $('#btnAdd').click(function () {

        var areaName = $('#txtNombreArea').val();
        ClientApp.AddArea(areaName);
    });

})(jQuery,ClientApp);