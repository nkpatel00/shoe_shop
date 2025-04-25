<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baby.aspx.cs" Inherits="shoe_shop.Baby" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Snow Category - Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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

        .auto-style1 {
            --bs-gutter-x: 1.5rem;
            --bs-gutter-y: 0;
            display: flex;
            flex-wrap: wrap;
            margin-left: calc(-.5 * var(--bs-gutter-x));
            margin-right: calc(-.5 * var(--bs-gutter-x));
            margin-top: calc(-1 * var(--bs-gutter-y));
        }
    </style>
</head>


<body>

    <!-- Sticky Navbar -->
    <nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top shadow">
        <div class="container-fluid px-4">
            <!-- Toggle button for mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Logo -->
            <a class="navbar-brand" href="Home.aspx">
                <img src="images/Logo1.png" alt="Amber Shoes Logo" width="150">
            </a>&nbsp;<!-- Navbar Links --><div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-dark" href="Baby.aspx">Baby</a></li>
                    <li class="nav-item"><a class="nav-link text-danger fw-bold" href="snow.aspx">Snow</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="Rain.aspx">Rain</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="Weekend.aspx">Weekend</a></li>
                </ul>
            </div>

            <div class="d-flex align-items-center">
                <a href="Cart.aspx"><i class="bi bi-bag text-dark m-2"></i></a>
                    <a href="Login.aspx" class="me-3 text-dark"><i class="bi bi-box-arrow-right"></i></a>

            </div>
            <!-- Right Section: Search, Icons -->
            <div class="d-flex align-items-center">
            </div>
        </div>
    </nav>



    <div class="container product-container">
        <h2 class="text-center mb-4">Baby - Product List</h2>
        <p class="text-center mb-4">&nbsp;</p>
        <form runat="server">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="auto-style1"
                    OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="1953px">
                    <ItemTemplate>
                        <div class="col">
                            <div class="product-card p-3">
                                <asp:Image ID="Image1" runat="server" CssClass="product-img" ImageUrl='<%# Eval("Image") %>' />
                                <h5 class="mt-2">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' CssClass="product-details"></asp:Label>
                                </h5>
                                <p class="text-muted">
                                    <strong>Price:</strong> $<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label><br>
                                    <strong>Stock:</strong>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Stock") %>'></asp:Label><br>
                                    <strong>Description:</strong>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>' CssClass="small"></asp:Label>
                                </p>

                                <!-- View Details Button -->
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="LinkButton1_Click" CssClass="btn btn-primary">
                                    View Details
                                </asp:LinkButton>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="pagination-container">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="PrevPage_Click">Previous</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary mx-2" OnClick="NextPage_Click">Next</asp:LinkButton>
            </div>
            <a href="Home.aspx">
                <h5>Go Back</h5>
            </a>

        </form>
    </div>
    <!-- footer-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3 mb-4">
                    <img src="images/Logo1.png" height="50px" width="100px" alt="Amber logo" class="mb-3">
                    <p>
                        Socially and environmentally progressive outdoor footwear
                    </p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-tiktok"></i></a><a href="#"><i class="fab fa-pinterest"></i></a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <h5>Our Shop</h5>
                    <ul class="list-unstyled">
                        <li><a href="Baby.aspx">Baby Products</a></li>
                        <li><a href="#">The Weekend Boot™</a></li>
                        <li><a href="Rain.aspx">The Anyday Rain Boot™</a></li>
                        <li><a href="snow.aspx">The Modern Winter Boot™</a></li>
                        <li><a href="snow.aspx">The Winter Weekend Boot Z™</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4">
                    <h5>Help</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Size guide</a></li>
                        <li><a href="#">Shipping Policy</a></li>
                        <li><a href="#">Refund Policy</a></li>
                        <li><a href="#">Wear and Care FAQ</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>About us</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Values</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <p style="align-content: center">All Right Reserved @Amber</p>
    </footer>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
