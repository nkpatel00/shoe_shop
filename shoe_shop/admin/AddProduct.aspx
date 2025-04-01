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
    </style>
</head>
<body>
    <form runat="server">

        <!-- Product Form (Add New Product) -->
        <div class="form-container">
            <h3>Add New Product</h3>

            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Product Name"></asp:TextBox>

            <!-- 🛒 Dropdown to Select Category -->
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                <asp:ListItem>SelectCategory</asp:ListItem>
            </asp:DropDownList>


            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description"></asp:TextBox>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" placeholder="Stock"></asp:TextBox>
            <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control" />

            <asp:Button ID="btnAddProduct" runat="server" CssClass="btn btn-primary w-100" Text="Add Product" OnClick="btnAddProduct_Click" />
            <a href="Admin.aspx" class="btn btn-secondary w-100">Back to Admin Panel</a>
        </div>


        <!-- Product List Table -->
        <div class="grid-container">
            <h3 class="text-center">Product List</h3>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-dark table-striped"
                OnRowCommand="GridView1_RowCommand" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category ID">
                        <ItemTemplate>
                            <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
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
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' Width="50" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="edit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
