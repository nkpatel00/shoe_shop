<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="shoe_shop.Address" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enter Address - Shoe Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .address-box {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            max-width: 900px;
            margin: 40px auto;
        }

        .address-box h2 {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 25px;
            color: #212529;
            text-align: center;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 8px;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 1rem;
            border: 1px solid #ced4da;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
            outline: none;
        }

        .btn-success {
            border-radius: 8px;
            font-size: 1rem;
            padding: 10px 24px;
            background-color: #28a745;
            border: none;
            color: white;
            font-weight: 600;
            transition: background-color 0.2s, transform 0.2s;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-1px);
        }

        .text-end {
            text-align: right;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            .address-box {
                width: 90%;
                padding: 20px;
            }

            .text-end {
                text-align: center;
            }

            .btn-success {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="address-container">
            <div class="address-box">
                <h2>Enter Delivery Details</h2>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="txtName" class="form-label">Full Name</label>
                        <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter full name" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label for="txtPhone" class="form-label">Phone Number</label>
                        <asp:TextBox ID="txtPhone" CssClass="form-control" Placeholder="Enter phone number" runat="server" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="Enter your email" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label for="txtNote" class="form-label">Note (Optional)</label>
                        <asp:TextBox ID="txtNote" CssClass="form-control" Placeholder="Enter any note" runat="server" />
                    </div>
                </div>

                <div class="mb-3">
                    <label for="txtAddress" class="form-label">Address</label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Enter your full address" runat="server" />
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="txtCity" class="form-label">City</label>
                        <asp:TextBox ID="txtCity" CssClass="form-control" Placeholder="Enter city" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label for="txtLandmark" class="form-label">Landmark (Optional)</label>
                        <asp:TextBox ID="txtLandmark" CssClass="form-control" Placeholder="Enter nearest landmark" runat="server" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="txtStates" class="form-label">State</label>
                        <asp:TextBox ID="txtStates" CssClass="form-control" Placeholder="Enter State" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label for="txtPincode" class="form-label">Pincode</label>
                        <asp:TextBox ID="txtPincode" CssClass="form-control" Placeholder="Enter pincode" runat="server" />
                    </div>
                </div>

                <div class="text-end">
                    <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount : " CssClass="d-block mb-2 fw-bold fs-4"></asp:Label>
                    <asp:Button ID="btnProceed" runat="server" Text="Continue to Payment" OnClick="btnProceed_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>