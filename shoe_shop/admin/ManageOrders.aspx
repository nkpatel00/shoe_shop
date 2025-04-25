<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="shoe_shop.admin.ManageOrders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #343a40;
            color: white;
            padding: 30px;
        }

        .container-custom {
            background-color: #495057;
            padding: 25px;
            border-radius: 15px;
        }

        .table th, .table td {
            color: white;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container container-custom">
            <h2 class="text-center mb-4">Manage Orders</h2>

            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False"
                CssClass="table table-dark table-striped" OnRowCommand="GridViewOrders_RowCommand">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                    <asp:BoundField DataField="UserName" HeaderText="User" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product" />
                    <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Date" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnMarkShipped" runat="server" CommandName="Ship" CommandArgument='<%# Eval("OrderId") %>'>Mark Shipped</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <a class="btn btn-secondary mt-3 w-100" href="Admin.aspx">Go Back To Admin Page</a>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
