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
                    <asp:ListItem>Rajok</asp:ListItem>
                    <asp:ListItem>Jamnagar</asp:ListItem>
                    <asp:ListItem>Dwarka</asp:ListItem>
                    <asp:ListItem>Amreli</asp:ListItem>
                    <asp:ListItem>Bhanvanagar</asp:ListItem>
                    <asp:ListItem>Surat</asp:ListItem>
                    <asp:ListItem>Junagadh</asp:ListItem>
                    <asp:ListItem>Surendranagar</asp:ListItem>
                    <asp:ListItem>Morbi</asp:ListItem>
                    <asp:ListItem>Dang</asp:ListItem>
                    <asp:ListItem>Botad</asp:ListItem>
                    <asp:ListItem>Amadavad</asp:ListItem>
                    <asp:ListItem>Valsad</asp:ListItem>
                    <asp:ListItem>Navasari</asp:ListItem>
                    <asp:ListItem>Kutch</asp:ListItem>
                    <asp:ListItem>Vapi</asp:ListItem>
                    <asp:ListItem>Mahesana</asp:ListItem>
                    <asp:ListItem>Porbandar</asp:ListItem>
                    <asp:ListItem>Godhara</asp:ListItem>
                    <asp:ListItem>Chhota Udaipur</asp:ListItem>
                    <asp:ListItem>Gir Somnath</asp:ListItem>
                </asp:DropDownList>
                <asp:FileUpload ID="UploadImage" class="form-control" runat="server" />
                <asp:TextBox ID="password" CssClass="form-control" placeholder="Enter Password" required runat="server"></asp:TextBox>
                <asp:TextBox ID="repassword" CssClass="form-control" placeholder="Re-Enter Password" required runat="server"></asp:TextBox>

                <asp:Button ID="btnRegister" class="btn btn-primary w-100" runat="server" Text="Submit" OnClick="btnRegister_Click" />
                <br />
                <a class="btn btn-secondary w-100" href="Admin.aspx">Go Back To Admin Page</a>
            </div>
        </section>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mobile">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%# ResolveUrl(Eval("Image").ToString()) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RePassword">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("RePassword") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
