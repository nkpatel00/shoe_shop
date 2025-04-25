<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="shoe_shop.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
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

                    <!-- Search Icon (Opens Modal) -->
                    <asp:Label ID="lblName" runat="server" Text="Name here" CssClass="me-3 text-dark"></asp:Label>
                    <a href="#" class="me-3 text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="bi bi-search"></i></a>
                    <a href="Login.aspx" class="me-3 text-dark"><i class="bi bi-box-arrow-right"></i></a>
                    <a href="Profile.aspx"><i class="bi bi-person text-dark"></i></a>
                    <a href="Cart.aspx"><i class="bi bi-bag text-dark"></i></a>
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
        </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Banner Section with Overlay Text -->
    <div class="banner-container">
        <img src="images/banner1.jpg" alt="Amber Shoes Banner" class="banner-image">
        <div class="banner-text">
            <h2 class="fw-bold display-1">Welcome to Amber Shoes</h2>
            <p class="fs-3">
                Step into Comfort & Style
            </p>
            <a href="#" class="btn btn-light btn-lg rounded-3">Shop Now</a>
        </div>
    </div>
    <br>
    <br>
    <br>


    <!-- Featured Products Section -->
    <div class="container my-5">
        <h2 class="text-center  mb-4" style="color: rgb(0, 50, 42); font-size: 40px;">#BeOutside in our award
            winning
                        <br>
            sustainable outdoor
            footwear.</h2>
        <br>
        <br>
        <div class="row g-4">
            <!-- Product 1 -->
            <div class="col-md-3">
                <div class="card shadow-sm">
                    <a href="Rain.aspx">
                        <img src="images/product1.jpg" class="card-img-top" alt="Product 1"></a>
                    <div class="card-body text-center">
                        <h5 class="card-title">Premium Rain Boots</h5>
                        <a href="Rain.aspx" class="btn btn-dark">Shop Now</a>
                    </div>
                </div>
            </div>
            <!-- Product 2 -->
            <div class="col-md-3">
                <div class="card shadow-sm">
                    <a href="snow.aspx">
                        <img src="images/product2.jpg" class="card-img-top" alt="Product 2"></a>
                    <div class="card-body text-center">
                        <h5 class="card-title">Winter Snow Shoes</h5>
                        <a href="snow.aspx" class="btn btn-dark">Shop Now</a>
                    </div>
                </div>
            </div>
            <!-- Product 3 -->
            <div class="col-md-3">
                <div class="card shadow-sm">
                    <a href="Weekend.aspx">
                        <img src="images/product3.jpg" class="card-img-top" alt="Product 3"></a>
                    <div class="card-body text-center">
                        <h5 class="card-title">Casual Weekend Shoes</h5>
                        <a href="Weekend.aspx" class="btn btn-dark">Shop Now</a>
                    </div>
                </div>
            </div>
            <!-- Product 4 -->
            <div class="col-md-3">
                <div class="card shadow-sm">
                    <a href="Baby.aspx">
                        <img src="images/product4.jpg" class="card-img-top" alt="Product 4"></a>
                    <div class="card-body text-center">
                        <h5 class="card-title">Baby Shoes</h5>
                        <a href="Baby.aspx" class="btn btn-dark">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <%--    <div class="none">
        <div class="container">
            <h1 class="title">Get Them Before They're Gone!</h1>
            <p class="subtitle">
                Sizes are running out, get your pair before they are gone.</p>
            <div class="grid">
                            <!-- Product 1 -->
                            <div class="product">
                                <img src="images/allegraweekend.jpg" alt="The Allegra Weekend Boot"> <span class="sale-badge">Sale</span>
                                <h2 class="product-title">✨ The Allegra Weekend Boot</h2>
                                <p class="product-price-old">
                                    Rs. 21,200.00</p>
                                <p class="product-price">
                                    Rs. 16,100.00</p>
                                <a href="#" class="button">Choose options</a>
                </div>
                            <!-- Product 2 -->
                            <div class="product">
                                <img src="images/weekendbootbeige.jpg" alt="The Weekend Boot Beige"> <span class="sale-badge">Sale</span>
                                <h2 class="product-title">✨ The Weekend Boot in Beige</h2>
                                <p class="product-price-old">
                                    Rs. 21,200.00</p>
                                <p class="product-price">
                                    Rs. 16,100.00</p>
                                <a href="#" class="button">Choose options</a>
                </div>
                            <!-- Product 3 -->
                            <div class="product">
                                <img src="images/weekendbootincuero.jpg" alt="The Weekend Boot in Cuero"> <span class="sale-badge">Sale</span>
                                <h2 class="product-title">✨ The Weekend Boot in Cuero</h2>
                                <p class="product-price-old">
                                    Rs. 21,200.00</p>
                                <p class="product-price">
                                    Rs. 12,900.00</p>
                                <a href="#" class="button">Choose options</a>
                </div>
                            <!-- Product 4 -->
                            <div class="product">
                                <img src="images/weekendbootinsage.jpg" alt="The Weekend Boot in Sage"> <span class="sale-badge">Sale</span>
                                <h2 class="product-title">✨ The Weekend Boot in Sage</h2>
                                <p class="product-price-old">
                                    Rs. 21,200.00</p>
                                <p class="product-price">
                                    Rs. 16,100.00</p>
                                <a href="#" class="button">Choose options</a>
                </div>
            </div>
            <a href="winter_sale.html" class="">
            <div class="view-all">
                <button class=" bg-dark text-white hover hover">
                    View all
                </button>
            </div>
            </a>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>--%>
    <%--<div class="container-fluid d-flex flex-column flex-md-row align-items-center justify-content-center min-vh-100">
        <div class="col-12 col-md-6 p-0">
            <img src="images/atmosfearfoot.jpg" alt="A lush green moss-covered rock in a natural setting"
                            class="img-fluid">
        </div>
        <div class="col-12 col-md-6 content">
            <h1>Amber footwear is thoughtfully designed from natural and recycled materials</h1>
            <p>
                Each pair diverts 1-2 kg of waste from our waterways and landfill, reduces 20kg of CO2 from the
                atmosphere, and conserves 10L of water when compared to your traditional leather boot.
            </p>
            <button>
                Learn more
            </button>
        </div>
    </div>--%>
    <%--<section class="teamsuport">
        <div class="content">
            <h1 class="mb-2" style="font-size: 1.875rem; font-weight: 600; color: #2d3748;">Try Them Out!</h1>
            <p class="mb-4" style="color: #718096;">
                Just contact our team for support!</p>
            <div class="section">
                <div class="section-title" data-bs-toggle="collapse" data-bs-target="#collapseSize"
                                aria-expanded="false" aria-controls="collapseSize">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-ruler me-2"></i>
                        <h2>Find your size</h2>
                    </div>
                    <i class="fas fa-chevron-up"></i>
                </div>
                <div id="collapseSize" class="collapse">
                    <p>
                        Check out our <a href="#">size guide</a> to find your perfect match!</p>
                </div>
            </div>
            <div class="section">
                <div class="section-title" data-bs-toggle="collapse" data-bs-target="#collapseShipping"
                                aria-expanded="false" aria-controls="collapseShipping">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-shipping-fast me-2"></i>
                        <h2>Free shipping in India</h2>
                    </div>
                    <i class="fas fa-chevron-up"></i>
                </div>
                <div id="collapseShipping" class="collapse">
                    <p>
                        Free shipping for orders over $100 in India including duties and customs.</p>
                    <p>
                        Check out our <a href="#">Shipping Policy</a> for more details.</p>
                </div>
            </div>
            <div class="section">
                <div class="section-title" data-bs-toggle="collapse" data-bs-target="#collapseReturns"
                                aria-expanded="false" aria-controls="collapseReturns">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-undo me-2"></i>
                        <h2>Easy returns</h2>
                    </div>
                    <i class="fas fa-chevron-up"></i>
                </div>
                <div id="collapseReturns" class="collapse">
                    <p>
                        Easy returns in India within 30 days Just <a href="#">contact our team for support!</a>
                    </p>
                    <p>
                        Read our <a href="#">return policy</a>.</p>
                </div>
            </div>
            <div class="section">
                <div class="section-title" data-bs-toggle="collapse" data-bs-target="#collapsePay" aria-expanded="false"
                                aria-controls="collapsePay">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-tags me-2"></i>
                        <h2>Pay in 4</h2>
                    </div>
                    <i class="fas fa-chevron-up"></i>
                </div>
                <div id="collapsePay" class="collapse">
                    <p>
                        Buy now, pay later! Pay in 4 easy instalments. Option at checkout.</p>
                </div>
            </div>
            <button class="btn-shop">
                Shop All
            </button>
        </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </section>--%>
    <%-- <section class="joinus">
        <div class="title">
            <h1>Join Us on Instagram</h1>
            <h2>@Amber_Outdoors</h2>
        </div>
        <div class="container">
            <div class="row gallery">
                <div class="col-12 col-sm-6 col-lg-3 mb-4">
                    <img src="https://storage.googleapis.com/a1aa/image/wTvZmMHsCJa0ng-ZW9KbJKKSKXQ354Av0PYBbBnQSlM.jpg"
                                    alt="Person hiking on a mountain with a red jacket and backpack">
                </div>
                <div class="col-12 col-sm-6 col-lg-3 mb-4">
                    <img src="https://storage.googleapis.com/a1aa/image/qKBlfmfCg0nRZHB91A1Gt-l2npw3ZKgr5kZVwJmxsHg.jpg"
                                    alt="Person posing in a studio wearing a beige coat, white shirt, and blue jeans">
                </div>
                <div class="col-12 col-sm-6 col-lg-3 mb-4">
                    <img src="https://storage.googleapis.com/a1aa/image/lSJ1deuqv8-y6cQynlv6lp9Q8-Ts9UV5II8AFYQ7XYU.jpg"
                                    alt="Person standing in a field wearing a hoodie and shorts">
                </div>
                <div class="col-12 col-sm-6 col-lg-3 mb-4">
                    <img src="https://storage.googleapis.com/a1aa/image/xZDqcGjiOn9Zk_jzjDHlaBM8JuWqmqhv5CBH0-gLZKg.jpg"
                                    alt="Person taking a mirror selfie wearing a black blazer, striped shirt, and jeans">
                </div>
            </div>
        </div>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
                </section>--%>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <section class="feeter" id="register">
        <div class="text-center py-5">
            <h1 class="display-4">Let's stay in touch!</h1>
            <p class="lead">
                Subscribe to our newsletter. Get $10 off your first purchase, exclusive offers and outdoor
                tips,
                trips and education.
            </p>
            <div class="d-flex justify-content-center mt-4">
                <input type="email" class="form-control w-50" placeholder="Your e-mail">
                <button class="btn btn-dark ms-2">
                    Sign Up
                </button>
            </div>
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
</asp:Content>

