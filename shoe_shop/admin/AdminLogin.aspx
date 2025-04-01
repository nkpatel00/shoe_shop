<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="shoe_shop.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            background: #343a40;
            color: white;
        }
        .login-container {
            background: #495057;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
        }
        .login-container h3 {
            margin-bottom: 20px;
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
    </style>
</head>
<body>
    <div class="login-container">
        <h3>Admin Login</h3>
        <form runat="server">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <%--<asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Login" />--%>
            <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-primary w-100" Text="Login" OnClick="btnlogin_Click" />

        </form>

    </div>
</body>
</html>

