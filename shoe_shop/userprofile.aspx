<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="shoe_shop.userProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="profile-container">
            <asp:Image ID="imgProfile" runat="server" CssClass="profile-img" />
            <h2><asp:Label ID="lblname" runat="server" Text="Name"></asp:Label></h2>
            <p>Email: <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label></p>
            <p>Mobile: <asp:Label ID="lblmobile" runat="server" Text="Mobile"></asp:Label></p>
            <p>Address: <asp:Label ID="lbladd" runat="server" Text="Address"></asp:Label></p>
            <p>Gender: <asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label></p>
            <p>City: <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label></p>
        </div>
    </form>
</body>
</html>
