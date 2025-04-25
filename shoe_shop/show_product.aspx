<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_product.aspx.cs" Inherits="shoe_shop.show_product1" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Details</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Amber Shoes</title>

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

            <!-- Right Section: Search, Icons -->
            <div class="d-flex align-items-center">
                <a href="Cart.aspx"><i class="bi bi-bag text-dark m-2"></i></a>
                    <a href="Login.aspx" class="me-3 text-dark"><i class="bi bi-box-arrow-right"></i></a>

            </div>
        </div>
    </nav>

    <%--<!-- Search Modal -->
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

    <!-- **Form Start Here** -->
    <form runat="server">
        <div class="container mt-5">
            <div class="row">
                <!-- Product Image -->
                <div class="col-md-6">
                    <asp:Image ID="mainImage" runat="server" CssClass="img-fluid" />

                </div>

                <!-- Product Details -->
                <div class="col-md-6">
                    <h2 class="text-primary">
                        <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                    </h2>

                    <p class="mb-2">
                        <strong>Category: </strong>
                        <asp:Label ID="lblCategory" runat="server" CssClass="text-muted"></asp:Label>
                    </p>

                    <p class="mb-2">
                        <strong>Price: </strong>
                        <span class="fw-bold text-danger">
                            <asp:Label ID="lblSell_Price" runat="server"></asp:Label>
                        </span>
                        <del class="text-muted">
                            <asp:Label ID="lblOri_Price" runat="server" Text="Label ₹310"></asp:Label>

                        </del>
                        <span class="badge bg-success ms-2">
                            <asp:Label ID="lblDiscount" runat="server"></asp:Label>
                        </span>
                    </p>

                    <p>
                        <strong>Origin: </strong>
                        <asp:Label ID="lblOrigin" runat="server" CssClass="text-muted"></asp:Label>
                    </p>

                    <div class="mt-4">
                        <asp:Button ID="Button1" CssClass="btn btn-primary me-2" runat="server" Text="Add To Cart" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text="Buy Now" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>

            <!-- Product Description -->
            <div class="mt-5">
                <h3 class="text-secondary">Product Description</h3>
                <p class="text-dark">
                    <asp:Label ID="lblDesc" runat="server"></asp:Label>
                </p>
            </div>
        </div>
    </form>
    <!-- **Form End Here** -->

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
