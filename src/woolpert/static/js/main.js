let dataArr;
let filetype;

function hide(){
    document.getElementById("modalData").style.display = "none"
}

function show(){
    document.getElementById("modalData").style.display = "block"
}

function selectAll(){
    $('.check').each(function() {
        this.checked = true;
    })
}

function unselectAll(){
    $('.check').each(function() {
        this.checked = false;
    })
}

function databaseConn(){
    var database_host = document.getElementById("database_host").value;
    var database_name = document.getElementById("database_name").value;
    var database_user = document.getElementById("database_user").value;
    var database_psw = document.getElementById("database_psw").value;
    if(database_host == "" || database_name == "" || database_user == "" || database_psw == ""){
        return false
    }
    else{
        return true
    }
}

function submitData(){
    document.getElementById("finished").style.display = "none"
    document.getElementById("error").style.display = "none"
    document.getElementById("finished_warning").style.display = "none"

    var checkedVals = $('.check:checkbox:checked').map(function() {
        return this.value;
    }).get();

    if(!databaseConn()){
        document.getElementById("error_msg").innerHTML = "One or more fields are empty"
        document.getElementById("error").style.display = "block"
        return;
    }

    if(checkedVals.length !=0 ){
        let dataSave = new Array();
        let dataHeaders;

        if(filetype == "excel"){
            dataHeaders = dataArr[0]
        }
        else{
            dataHeaders = dataArr[dataArr.length - 1]
        }

        console.log(dataHeaders)

        for(i = 0; i < checkedVals.length; i++){
            dataSave.push(dataArr[checkedVals[i]])
        }

        let selectedLayer = $("#selectLayer :selected").val();

        let data = {
            layer: selectedLayer,
            columns: dataHeaders,
            rows: dataSave,
            database_host: document.getElementById("database_host").value,
            database_name: document.getElementById("database_name").value,
            database_user: document.getElementById("database_user").value,
            database_psw: document.getElementById("database_psw").value
        }
        document.getElementById("submitFinal").disabled = true
        document.getElementById("submitFinal").innerHTML = "Uploading ..."
        
        $.ajax({
            url: "/admin_upload/",
            type: "POST",
            data: {json_data: JSON.stringify(data)},
            success: function(data, textStatus, jqXHR) {
                console.log(data)
                document.getElementById("submitFinal").disabled = false
                document.getElementById("submitFinal").innerHTML = "Submit"
                if(data["status"] == "error"){
                    document.getElementById("error_msg").innerHTML = data["errors"]
                    document.getElementById("error").style.display = "block"
                }   
                else if(data["status"] == "finished"){
                    if(data["errors"] == "[]"){
                        document.getElementById("finished_msg").innerHTML = "The upload has finished with no errors"
                        document.getElementById("finished").style.display = "block"
                    }
                    else{
                        document.getElementById("finished_msg_war").innerHTML = "The upload has finished with errors: <br>" + data["errors"]
                        document.getElementById("finished_warning").style.display = "block"
                    }
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                document.getElementById("error").style.display = "block"
                document.getElementById("submitFinal").disabled = false
                document.getElementById("submitFinal").innerHTML = "Submit"
            }
        })
    }
    else{
        document.getElementById("error_msg").innerHTML = "Please select data in the table to upload"
        document.getElementById("error").style.display = "block"
    }
}

function scanData(){
    document.getElementById("finished").style.display = "none"
    document.getElementById("error").style.display = "none"
    document.getElementById("finished_warning").style.display = "none"

    var checkedVals = $('.check:checkbox:checked').map(function() {
        return this.value;
    }).get();

    if(!databaseConn()){
        document.getElementById("error_msg").innerHTML = "The connection parameters for the database are empty"
        document.getElementById("error").style.display = "block"
        return;
    }

    if(checkedVals.length !=0 ){
        let dataSave = new Array();
        let dataHeaders;

        if(filetype == "excel"){
            dataHeaders = dataArr[0]
        }
        else{
            dataHeaders = dataArr[dataArr.length - 1]
        }

        console.log(dataHeaders)

        for(i = 0; i < checkedVals.length; i++){
            dataSave.push(dataArr[checkedVals[i]])
        }

        let selectedLayer = $("#selectLayer :selected").val();

        let data = {
            layer: selectedLayer,
            columns: dataHeaders,
            rows: dataSave,
            database_host: document.getElementById("database_host").value,
            database_name: document.getElementById("database_name").value,
            database_user: document.getElementById("database_user").value,
            database_psw: document.getElementById("database_psw").value
        }
        
        $.ajax({
            url: "/check_columns/",
            type: "POST",
            data: {json_data: JSON.stringify(data)},
            success: function(data, textStatus, jqXHR) {
                console.log(data)
                if(data["status"] == "error"){
                    document.getElementById("error_msg").innerHTML = data["errors"]
                    document.getElementById("error").style.display = "block"
                }   
                else if(data["status"] == "finished"){
                    if(data["errors"] == "[]"){
                        document.getElementById("finished_msg").innerHTML = "The scan has finished with no errors. Please submit your data";
                        document.getElementById("finished").style.display = "block";
                        document.getElementById("submitFinal").disabled = false
                    }
                    else{
                        document.getElementById("finished_msg_war").innerHTML = "The scan has finished with errors. Please address the following issues and re-upload your file: <br>" + data["errors"]
                        document.getElementById("finished_warning").style.display = "block"
                    }
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                document.getElementById("error").style.display = "block"
            }
        })
    }
    else{
        document.getElementById("error_msg").innerHTML = "Please select data in the table to scan"
        document.getElementById("error").style.display = "block"
    }
}

const excel_file = document.getElementById('excel_file');

excel_file.addEventListener('change', (event) => {

    document.getElementById('wrong_format').style.display = "none";
    document.getElementById('zip_error').style.display = "none";

    if(!['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-excel', 'application/zip'].includes(event.target.files[0].type))
    {
        document.getElementById('wrong_format').style.display = "block";
        excel_file.value = '';
        return false;
    }
    else if(['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-excel'].includes(event.target.files[0].type)){
        filetype = "excel";
        dataArr = []
        var reader = new FileReader();
        reader.readAsArrayBuffer(event.target.files[0]);
        reader.onload = function(event){
            var data = new Uint8Array(reader.result);
            var work_book = XLSX.read(data, {type:'array'});
            var sheet_name = work_book.SheetNames;
            var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]], {header:1});
            dataArr = sheet_data;
            console.log(dataArr)
            if(sheet_data.length > 0)
            {
                var table_output = '<table id="show_table" class="table table-striped table-bordered">';
                for(var row = 0; row < sheet_data.length; row++)
                {
                    table_output += '<tr>' ;
                    if(row > 0){
                        table_output += '<td>' + "<input type='checkbox' class='check' name='select_row_upload' value="+row+" />" +'</td>';
                    }
                    else{
                        table_output += '<th>Upload Data</th>';
                    }
                    for(var cell = 0; cell < sheet_data[row].length; cell++)
                    {
                        if(row == 0)
                        {
                            table_output += '<th>'+sheet_data[row][cell]+'</th>';
                        }
                        else
                        {   
                            table_output += '<td>'+  sheet_data[row][cell]+'</td>';
                        }
                    }
                    table_output += '</tr>';
                }
                table_output += '</table>';
                document.getElementById('excel_data').innerHTML = table_output;
                document.getElementById("showTableData").style.display = "block";
                $("#show_table").fancyTable({
                    sortColumn:0,
                    pagination: true,
                    perPage:5,
                    globalSearch:false
                });	
            }
        }
        excel_file.value = '';
    } 
    else if(['application/zip'].includes(event.target.files[0].type)){
        filetype = "zip";
        var headers_arr = new Array()
        dataArr = []
        try{
            loadshp({
                url: event.target.files[0], // path or your upload file
                encoding: 'big5', // default utf-8
                EPSG: 3826 // default 4326
            }, function(geojson) {
                // geojson returned
                console.log(geojson)
                var table_output = '<table id="show_table_zip" class="table table-striped table-bordered">';
                for (var key in geojson){
                    for(var i = 0; i < geojson[key].length; i++){
                        
                        if(geojson[key][i]["properties"] != undefined){
                            table_output += '<tr>' ;
                            if(i > 0){
                                table_output += '<td>' + "<input type='checkbox' class='check' name='select_row_upload' value="+i+" />" +'</td>';
                            }
                            else{
                                table_output += '<th>Upload Data</th>';
                            }
                        }
                        var feature = new Array()
                        for(var x in geojson[key][i]["properties"]){
                            if(geojson[key][i]["properties"] != undefined){
                                if(i == 0){
                                    headers_arr.push(x)
                                    table_output += '<th>'+x+'</th>';
                                }
                                else{
                                    table_output += '<td>'+geojson[key][i]["properties"][x]+'</td>';
                                    feature.push(geojson[key][i]["properties"][x])
                                }
                            }
                        }
                        if(geojson[key][i]["properties"] != undefined){
                            table_output += '</tr>' ;
                        }
                        
                        if(feature.length != 0){
                            dataArr.push(feature)
                        }
                        
                    }
                }
                dataArr.push(headers_arr)
                table_output += '</table>';
                document.getElementById('excel_data').innerHTML = table_output;
                document.getElementById("showTableData").style.display = "block";
                console.log(dataArr)
                $("#show_table_zip").fancyTable({
                    sortColumn:0,
                    pagination: true,
                    perPage:5,
                    globalSearch:false
                });	
            });
        }
        catch{
            alert("wrong")
        }

        excel_file.value = '';
    }
    
});