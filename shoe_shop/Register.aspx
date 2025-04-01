<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="shoe_shop.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <section class="feeter">
        <section class="section-padding" id="register">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12 mx-auto">
                    <div class="booking-form">
                        <h2 class="text-center mb-lg-3 mb-2">Register With Us!!</h2>

                            <div class="row">
                                <div class="form-control col-lg-6 col-6">
                                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Full name" required runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-control col-lg-6 col-6">
                                    <asp:TextBox ID="txtEmail" type="email" name="email" class="form-control" placeholder="Email address" required runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-control col-lg-6 col-6">
                                    <asp:TextBox ID="txtMobile" type="telephone" name="phone" class="form-control" placeholder="Phone: 123-456-7890" runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-control col-lg-6 col-6">
                                    <asp:TextBox ID="txtDate" type="date" name="date" value="" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <br />

                                
                                <div class="form-control col-lg-6">
                                    <div class="d-flex gap-3">
                                        <asp:TextBox ID="txtAdddress" CssClass="form-control w-50" placeholder="Enter Address" runat="server"></asp:TextBox>

                                        <asp:RadioButtonList ID="rbGender" CssClass="form-control w-50" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>


                                <div class="form-control col-lg-6">
                                    <div class="d-flex gap-3">
                                        <asp:DropDownList ID="ddCity" class="form-control w-50" runat="server">
                                            <asp:ListItem>--Select City--</asp:ListItem>
                                            <asp:ListItem>City 1</asp:ListItem>
                                            <asp:ListItem>City 2</asp:ListItem>
                                            <asp:ListItem>City 3</asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:FileUpload ID="UploadImage" class="form-control w-50" runat="server" />
                                    </div>
                                </div>
                                <div class="form-control col-lg-6 col-6">
                                    <asp:TextBox ID="password" CssClass="form-control" placeholder="Enter Password" required runat="server"></asp:TextBox>
                                </div>
                                <div class="form-control col-lg-6 col-6">
                                    <asp:TextBox ID="repassword" CssClass="form-control" placeholder="Re-Enter Password" required runat="server"></asp:TextBox>
                                </div>

                                <div class="btn  ms-2 col-lg-12 col-md-4 col-6 mx-auto">
                                  
                                    <asp:Button ID="btnRegister" class="form-control" runat="server" Text="Submit" OnClick="btnRegister_Click"  />
                                    <br />
                                    
                                </div>
                                <div class="btn  ms-2 col-lg-12 col-md-4 col-6 mx-auto">
                                   
                                    Already have Account ?? :<a class="text-danger" href="Login.aspx">Login</a>   
                                    <br />
                                    
                                    <div class="btn  ms-2 col-lg-12 col-md-4 col-6 mx-auto">
                                   
                                    Admin Login  :<a class="text-danger" href="admin\AdminLogin.aspx">Login</a>   
                                    <br />
                                </div>

                            </div>

                    </div>
                </div>
            </div>
        </div>
    

                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
                <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
            </asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1"><title>Amber Shoes</title>

                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                    <link rel="stylesheet" href="style.css">

                    <!-- Custom CSS for Overlay Text -->
                    <style>
                    </style>
                </head>
                <body>

                    <!-- Sticky Navbar -->
                    <%--<nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top shadow">
                        <div class="container-fluid px-4">
                            <!-- Toggle button for mobile -->
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <!-- Logo -->
                            <a class="navbar-brand" href="index.html">
                            <img src="images/Logo1.png" alt="Amber Shoes Logo" width="150"> </a>&nbsp;<!-- Navbar Links --><div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                                <ul class="navbar-nav">
                                    <li class="nav-item"><a class="nav-link text-dark" href="rain.html">Rain</a></li>
                                    <li class="nav-item"><a class="nav-link text-danger fw-bold" href="snow.html">Snow</a></li>
                                    <li class="nav-item"><a class="nav-link text-dark" href="weekend.html">The Weekend Boot</a></li>
                                    <li class="nav-item"><a class="nav-link text-dark" href="shop_all.html">Shop All</a></li>
                                    <li class="nav-item"><a class="nav-link text-dark" href="winter_sale.html">Winter Sale</a></li>
                                    <li class="nav-item"><a class="nav-link text-dark" href="#register">Registration</a></li>
                                </ul>
                            </div>

                            <!-- Right Section: Search, Icons -->
                            <div class="d-flex align-items-center">
                                <!-- Search Icon (Opens Modal) -->
                                <a href="#" class="me-3 text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="bi bi-search"></i></a>
                                <a href="Login.aspx" class="me-3 text-dark"><i class="bi bi-person"></i></a><a href="#"><i class="bi bi-bag text-dark"></i></a>
                            </div>
                        </div>
                    </nav>

                    <!-- Search Modal -->
                    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="searchModalLabel">Search Products</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search for shoes...">
                                            <button class="btn btn-dark" type="submit">
                                                Search
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>--%>
</asp:Content>


