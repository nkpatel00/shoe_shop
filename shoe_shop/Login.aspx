<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="shoe_shop.Login1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h3 class="text-center">Login</h3>
        <form runat="server">
            <div class="mb-3">
                <asp:TextBox ID="txtmailusr" CssClass="form-control" runat="server" placeholder="Email address" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="txtpassusr" CssClass="form-control"  placeholder="Password" required runat="server"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            </div>
            <asp:Button ID="Button1" CssClass="btn btn-primary w-100" runat="server" Text="Login" OnClick="btnlogin_Click"/>
        </form>
    
        <p class="text-center mt-3"><a href="Register.aspx">Register Now</a></p>
         
    </div>
</body>
</html>

