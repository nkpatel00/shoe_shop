<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="shoe_shop.admin.ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            width: 350px;
            text-align: center;
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

        .btn-secondary {
            background: #6c757d;
            border: none;
            margin-top: 10px;
        }

        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <section class="feeter">
        <section class="section-padding" id="register">
            <div class="form-container">
                <h2 class="text-center mb-lg-3 mb-2">Register With Us!!</h2>

                <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Full name" required runat="server"></asp:TextBox>
                <asp:TextBox ID="txtEmail" type="email" class="form-control" placeholder="Email address" required runat="server"></asp:TextBox>
                <asp:TextBox ID="txtMobile" type="telephone" class="form-control" placeholder="Phone: 123-456-7890" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtDate" type="date" class="form-control" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtAdddress" CssClass="form-control" placeholder="Enter Address" runat="server"></asp:TextBox>
                <asp:RadioButtonList ID="rbGender" CssClass="form-control" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:DropDownList ID="ddCity" class="form-control" runat="server">
                    <asp:ListItem>--Select City--</asp:ListItem>
                    <asp:ListItem>City 1</asp:ListItem>
                    <asp:ListItem>City 2</asp:ListItem>
                    <asp:ListItem>City 3</asp:ListItem>
                </asp:DropDownList>
                <asp:FileUpload ID="UploadImage" class="form-control" runat="server" />
                <asp:TextBox ID="password" CssClass="form-control" placeholder="Enter Password" required runat="server"></asp:TextBox>
                <asp:TextBox ID="repassword" CssClass="form-control" placeholder="Re-Enter Password" required runat="server"></asp:TextBox>

                <asp:Button ID="btnRegister" class="btn btn-primary w-100" runat="server" Text="Submit" OnClick="btnRegister_Click" />
                <br />
                <a class="btn btn-secondary w-100" href="Admin.aspx">Go Back To Admin Page</a>
            </div>
        </section>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
