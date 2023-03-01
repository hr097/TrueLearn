<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Singup.aspx.cs" Inherits="Elearn.Singup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SingUp | TrueLearn</title>
    <link rel="stylesheet" href="CSS/Login_Singup.css"/>
</head>
<body>
    <div class="wrapper">
        <div class="_container">
            <div class="_row">
                <div class="logo_title">
                    <img src="Assets/Logo.png" alt="logo" />
                </div>
                <div class="form_data">
                    <div class="form_data_title"><h1>SINGUP HERE!</h1></div>
                    <div id="msgBox1">
                        <div class="alert alert-dismissible  show" role="alert">
                        </div>
                    </div>
                    <form  id="singup_form" runat="server">
                        <label for="email">Email</label>
                        <asp:TextBox name="email" id="email" placeholder="Email" runat="server" CssClass="input" ></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter email address" Font-Bold="False" Font-Size="Smaller" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter valid email address" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        
                        <label for="password">Password</label>
                        <asp:TextBox name="password" id="password" placeholder="Password" runat="server" CssClass="input" ></asp:TextBox>
                      
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Enter password" Font-Bold="False" Font-Size="Smaller" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="password" ErrorMessage="Enter valid password" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="True" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br />
                      
                        <label for="repassword">Re-enter Password</label>
                        <asp:TextBox name="repassword" id="repassword" placeholder="Re-enter Password" runat="server" CssClass="input" ></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="repassword" ErrorMessage="Enter re-enter password" Font-Bold="False" Font-Size="Smaller" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="repassword" ErrorMessage="Password doesn't match with previos one" Font-Size="Smaller" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                        <br />
                        
                        <label for="qualifcation">Qualification</label>
                        <asp:TextBox name="qualifcation" id="qualifcation" placeholder="Qualifcation" runat="server" CssClass="input" ></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="qualifcation" ErrorMessage="Enter qualification" Font-Bold="False" Font-Size="Smaller" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />

                        <asp:Button ID="submit_login" runat="server" Text="SINGUP" OnClick="submit_login_Click" />
                        
                        <a href="Login.aspx">Already have an account?</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>
