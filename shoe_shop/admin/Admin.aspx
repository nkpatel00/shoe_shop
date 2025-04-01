<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="shoe_shop.Admin" %>
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
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #343a40;
            padding: 20px;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Admin Panel</h3>
        <a href="#">Dashboard</a>
        <a href="Category.aspx">Categories</a>
        <a href="AddProduct.aspx">Products</a>
        <a href="../Profile.aspx">Manage Users</a>
        <a href="Addnewadmin.aspx">Manage Admins</a>
        <a style="color:red" href="AdminLogin.aspx">Sign Out</a>
    </div>
    <div class="content">
        <h2>Welcome to the Admin Panel</h2>
        <p>Select an option from the sidebar.</p>
    </div>







</body>
</html>
