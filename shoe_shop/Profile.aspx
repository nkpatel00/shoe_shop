<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="shoe_shop.Profile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px 0;
        }
        .profile-container {
            max-width: 1200px;
            margin: auto;
        }
        .profile-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .profile-card:hover {
            transform: scale(1.05);
        }
        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #007bff;
        }
        .profile-details {
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

    <div class="container profile-container">
        <h2 class="text-center mb-4">User Profiles</h2>
        <form runat="server">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="row" OnSelectedIndexChanged="DataList1_SelectedIndexChanged1">
                    <ItemTemplate>
                        <div class="col">
                            <div class="profile-card p-3">
                                <asp:Image ID="Image2" runat="server" CssClass="profile-img" ImageUrl='<%# Eval("Image") %>' />
                                <h5 class="mt-2"><asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' CssClass="profile-details"></asp:Label></h5>
                                <p class="text-muted">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Email") %>'></asp:Label><br>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label><br>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Address") %>'></asp:Label><br>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Gender") %>'></asp:Label> |
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                                </p>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CssClass="edit-btn">Edit Profile</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="pagination-container">
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-primary mx-2" OnClick="LinkButton3_Click">Previous</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary mx-2" OnClick="LinkButton4_Click">Next</asp:LinkButton>
            </div>
        </form>
    </div>

</body>
</html>
