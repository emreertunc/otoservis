<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="api.aspx.cs" Inherits="Proje.API.api" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">  
            function getAracs() {  
                $.getJSON("api/aracapi",  
                    function(data) {  
                        $('#arac').empty(); // Clear table body.  
  
                        // Loop through the list of aracs.  
                        $.each(data, function(key, val) {  
                            // Add a table row for the aracs.  
                            var row = '<tr><td>' +
                                val.aracID + '</td><td>' +
                                val.plaka + '</td><td>' +  
                                val.markaID + '</td><td>' +
                                val.modelID + '</td><td>' +
                                val.musteriID + '</td><td>' +
                                val.modelYil + '</td><td>' +
                                val.ruhsatNo + '</td><td>' +
                                val.saseNo + '</td><td>' +
                                val.motorNo + '</td><td>';  
                            $("#arac").append(row);  
  
                        });  
                    });  
            }  
            $(document).ready(getAracs);  
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h2> API ile çekilmiş araç kayıtları aşağıdadır:</h2>  
            <table>  
                <thead>  
                    <tr>  
                        <th>aracID</th>  
                        <th>plaka</th>  
                        <th>markaID</th> 
                        <th>modelID</th>  
                        <th>musteriID</th>  
                        <th>modelYil</th>  
                        <th>ruhsatNo</th>  
                        <th>saseNo</th>  
                        <th>motorNo</th> 
                    </tr>  
                </thead>  
                <tbody id="arac">  
                </tbody>  
            </table>
    </form>
</body>
</html>
