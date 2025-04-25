<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="shoe_shop.admin.AddProduct" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #343a40;
            color: white;
            padding: 20px;
        }

        .form-container {
            background: #495057;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            text-align: center;
            margin-bottom: 20px;
        }

        .grid-container {
            background: #212529;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 900px;
            overflow-x: auto;
        }

        .form-control {
            margin-bottom: 10px;
        }

        .btn-primary {
            background: #007bff;
            border: none;
        }

            .btn-primary:hover {
                background: #0056b3;
            }

        .btn-secondary {
            background: #6c757d;
            border: none;
            margin-top: 10px;
        }

            .btn-secondary:hover {
                background: #5a6268;
            }
        .auto-style1 {
            background: #495057;
            padding: 20px;
            border-radius: 10px;
            width: 413px;
            text-align: center;
            margin-bottom: 20px;
            height: 349px;
        }
    </style>
</head>
<body>
    <form runat="server">

        <!-- Product Form (Add New Product) -->
        <div class="auto-style1">
            <h3>Add New Product</h3>

            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Product Name"></asp:TextBox>

            <!-- 🛒 Dropdown to Select Category -->
            <asp:DropDownList ID="ddlCategory" runat="server"  CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged1">
                <asp:ListItem Text="Select Category" Value="SelectCategory"></asp:ListItem>
            </asp:DropDownList>





            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description"></asp:TextBox>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" placeholder="Stock"></asp:TextBox>
            <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

            <asp:Button ID="btnAddProduct" runat="server" CssClass="btn btn-primary w-100" Text="Submit" OnClick="btnAddProduct_Click" />
            <a href="Admin.aspx" class="btn btn-secondary w-100">Back to Admin Panel</a>
        </div>



        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="914px" OnRowCommand="GridView1_RowCommand1">
    <Columns>
        <asp:TemplateField HeaderText="Id">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Category ID">
            <ItemTemplate>
                <asp:Label ID="lblCategoryId" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Stock">
            <ItemTemplate>
                <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' Height="50px" Width="50px" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Update">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Update</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt" OnClick="LinkButton1_Click">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>




    </form>
</body>
</html>
