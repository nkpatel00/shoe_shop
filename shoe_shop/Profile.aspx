<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="shoe_shop.Profile" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .profile-card {
            max-width: 650px;
            margin: 50px auto;
            background-color: #1e1e2f;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.6);
        }
        .profile-image {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
        }
        .info-label {
            font-weight: bold;
            color: #f0ad4e;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="profile-card text-center">
            <asp:Image ID="imgProfile" runat="server" CssClass="profile-image mb-3" />

            <h3><asp:Label ID="lblName" runat="server" /></h3>
            <p class="text-muted"><asp:Label ID="lblEmail" runat="server" /></p>

            <div class="text-start mt-4">
                <p><span class="info-label">Mobile:</span> <asp:Label ID="lblMobile1" runat="server" /></p>
                <p><span class="info-label">Gender:</span> <asp:Label ID="lblGender1" runat="server" /></p>
                <p><span class="info-label">City:</span> <asp:Label ID="lblCity1" runat="server" /></p>
                <p><span class="info-label">Address:</span> <asp:Label ID="lblAddress1" runat="server" /></p>
                <p><span class="info-label">Join Date:</span> <asp:Label ID="lblDate1" runat="server" /></p>
            </div>

            <asp:Button ID="edtprofile" runat="server" Text="Edit Profile" CssClass="btn btn-warning mt-3" OnClick="btnEdit_Click" />
        </div>
    </form>
</body>
</html>

