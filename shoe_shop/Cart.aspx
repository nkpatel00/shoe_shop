<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="shoe_shop.Cart" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Amber Shoes</title>

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />

    <style>
        .cart-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
        }

        .gridview {
            width: 100%;
        }

        .gridview th {
            background-color: #f8f9fa;
            text-align: center;
        }

        .gridview td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-remove {
            color: red;
            text-decoration: none;
        }

        .btn-remove:hover {
            text-decoration: underline;
        }

        .total-section {
            text-align: right;
            margin-top: 20px;
        }

        .btn-proceed {
            float: right;
        }
    </style>
</head>
<body>
    <!-- Sticky Navbar -->
    <nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top shadow-sm">
        <div class="container-fluid px-4">
            <a class="navbar-brand" href="Home.aspx">
                <img src="images/Logo1.png" alt="Amber Shoes Logo" width="150" />
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-dark" href="Baby.aspx">Baby</a></li>
                    <li class="nav-item"><a class="nav-link text-danger fw-bold" href="snow.aspx">Snow</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="Rain.aspx">Rain</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="Weekend.aspx">Weekend</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        <div class="cart-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered gridview" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand1">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# Eval("Image") %>' Width="80px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-remove" CommandArgument='<%# Eval("CartId") %>' CommandName="cmd_rem">Remove</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="total-section">
                <strong>Total Amount:</strong>
                <asp:Label ID="lblTotalAmount" runat="server" CssClass="fw-bold ms-2" />
                <br /><br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Proceed to Checkout" CssClass="btn btn-danger btn-proceed" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>