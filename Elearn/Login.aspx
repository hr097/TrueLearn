<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Elearn.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | TrueLearn</title>
    <link rel="stylesheet" href="CSS/Login_Singup.css"/>
</head>
<body>

        <div class="wrapper">
        <div class="_container">
            <div class="_row">
                <div class="logo_title">
                    <img src="Assets/Logo.png" alt=""/>
                </div>
                <div class="form_data">
                    <div class="form_data_title"><h1>LOGIN HERE!</h1></div>
                    <div id="msgBox">
                        <div class="alert alert-dismissible show" role="alert">
                        </div>
                    </div>
                    <form  id="login_form"  runat="server">
                        <label for="Email">Email</label>
                       
                        <asp:TextBox name="email" id="email" placeholder="Email" runat="server" CssClass="input" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Enter email address" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <label for="Password">Password</label>
                        
                        <asp:TextBox name="password" id="password" placeholder="Password" runat="server" CssClass="input" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="Enter password" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" Font-Underline="True" ForeColor="#FF3300"></asp:Label>
                      
                        <asp:Button ID="submit_login" runat="server" Text="Login" OnClick="submit_login_Click" />
                        
                        <a href="Singup.aspx">Don't have an account?</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>
