<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addnewadmin.aspx.cs" Inherits="shoe_shop.admin.Addnewadmin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Admin</title>
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
            margin-bottom: 20px; /* Space between form and table */
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
            width: 86%;
            height: 332px;
        }
    </style>
</head>
<body class="text-center">
    <form runat="server">

        <!-- Admin Form (Top Section) -->
        <div class="form-container text-center">
            <h3>Add New Admin</h3>

            <asp:TextBox ID="txtNewUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>

            <asp:Button ID="btnAddAdmin" runat="server" CssClass="btn btn-primary w-100" Text="Add Admin" OnClick="btnAddAdmin_Click" />
            <a href="Admin.aspx" class="btn btn-secondary w-100">Back to Admin Panel</a>
        </div>

        <!-- Admin List Table (Below Form) -->
        <div class="auto-style1">
            <h3 class="text-center">Admin List</h3>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="220px" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="799px">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserName">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PassWord">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ConfirmedPassword">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("rePassword") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Update</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>