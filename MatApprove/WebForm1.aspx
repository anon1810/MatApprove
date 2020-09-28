<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MatApprove.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">

    function ConvertToImage(btnExport) {
        html2canvas(
            $("#dvTable")[0], {allowTaint: true, logging: true}     
            ).then(function (canvas) {
            var base64 = canvas.toDataURL();
            $("[id*=hfImageData]").val(base64);
            __doPostBack(btnExport.name, "");
        });



        return false;
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
<div id="dvTable" class="w3-container" style = "width:1800px;height:900px; background-color:black;padding:5px">
            <img src="ele/CarFrontViewBase.png" style ="max-height:500px;max-width:300px" />
            <img src="ele/CBV-C720.png" style ="max-height:500px;max-width:300px" />

            <asp:Image ID="Image1" runat="server" ImageUrl="~/ele/H.png" style ="z-index:1;left:5px;top:57px;position:absolute; max-height:500px;max-width:300px"/>
            <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/ele/CarFrontViewBase.png" style ="z-index:1;left:904px;top:367px;position:absolute; max-height:500px;max-width:300px"/>--%>
            <%--<asp:Image ID="Image2" runat="server" ImageUrl="~/ele/CBV-C720.png" style ="z-index:1;left:1004px;top:367px;position:absolute; max-height:500px;max-width:300px" />--%>
</div>
<br />
<asp:HiddenField ID="hfImageData" runat="server" />
<asp:Button ID="btnExport" Text="Export to Image" runat="server" UseSubmitBehavior="false"
    OnClick="btnExport_Click" OnClientClick="return ConvertToImage(this)" />
    </form>
</body>
</html>
