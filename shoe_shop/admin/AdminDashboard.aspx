<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="shoe_shop.admin.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background: #343a40;
            color: white;
            padding: 20px;
        }

        .dashboard-container {
            max-width: 900px;
            margin: auto;
            text-align: center;
        }

        .card {
            background: #495057;
            border: none;
            color: white;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        .btn-primary, .btn-secondary {
            border: none;
        }

        .btn-primary:hover {
            background: #0056b3;
        }

        .btn-secondary:hover {
            background: #6c757d;
        }
    </style>
</head>
<body>

    <form runat="server">
        <div class="dashboard-container">
            <h2 class="mb-4">Admin Dashboard</h2>

            <!-- Stats Section -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card p-3">
                        <h4>Total Admins</h4>
                        <h2><asp:Label ID="lblTotalAdmins" runat="server" Text="0"></asp:Label></h2>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h4>Total Users</h4>
                        <h2><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></h2>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h4>Total Categories</h4>
                        <h2><asp:Label ID="lblTotalCategories" runat="server" Text="0"></asp:Label></h2>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h4>Total Products</h4>
                        <h2><asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label></h2>
                    </div>
                </div>
            </div>

            <!-- Manage Sections -->
            <div class="row">
                <div class="col-md-3">
                    <asp:Button ID="btnManageAdmins" runat="server" Text="Manage Admins" CssClass="btn btn-primary w-100 mb-2" OnClick="btnManageAdmins_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnManageUsers" runat="server" Text="Manage Users" CssClass="btn btn-primary w-100 mb-2" OnClick="btnManageUsers_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnManageCategories" runat="server" Text="Manage Categories" CssClass="btn btn-primary w-100 mb-2" OnClick="btnManageCategories_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnManageProducts" runat="server" Text="Manage Products" CssClass="btn btn-primary w-100 mb-2" OnClick="btnManageProducts_Click" />
                </div>
            </div>

            <!-- Go Back to Admin Button -->
            <div class="row mt-3">
                <div class="col-md-12">
                    <asp:Button ID="btnGoBackToAdmin" runat="server" Text="Go Back to Admin" CssClass="btn btn-secondary w-100" OnClick="btnGoBackToAdmin_Click" />
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

