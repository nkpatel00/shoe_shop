<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="snow.aspx.cs" Inherits="shoe_shop.snow" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Snow Category - Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px 0;
        }

        .product-container {
            max-width: 1200px;
            margin: auto;
        }

        .product-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

            .product-card:hover {
                transform: scale(1.05);
            }

        .product-img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #007bff;
        }

        .product-details {
            font-size: 16px;
            font-weight: 500;
        }

        .edit-btn {
            background: #007bff;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }

            .edit-btn:hover {
                background: #0056b3;
                color: white;
            }

        .pagination-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container product-container">
        <h2 class="text-center mb-4">Snow Category - Product List</h2>
        <form runat="server">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="row"
                    OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                    <ItemTemplate>
                        <div class="col">
                            <div class="product-card p-3">
                                <asp:Image ID="Image1" runat="server" CssClass="product-img" ImageUrl='<%# Eval("Image") %>' />
                                <h5 class="mt-2">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' CssClass="product-details"></asp:Label></h5>
                                <p class="text-muted">
                                    <strong>Category:</strong>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label><br>
                                    <strong>Price:</strong> $<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label><br>
                                    <strong>Stock:</strong>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Stock") %>'></asp:Label><br>
                                    <strong>Description:</strong>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>' CssClass="small"></asp:Label>
                                </p>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="EditProduct" CssClass="edit-btn">Edit Product</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="pagination-container">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="PrevPage_Click">Previous</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary mx-2" OnClick="NextPage_Click">Next</asp:LinkButton>
            </div>
        </form>
    </div>

</body>
</html>

