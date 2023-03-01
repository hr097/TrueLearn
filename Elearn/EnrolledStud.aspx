<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EnrolledStud.aspx.cs" Inherits="Elearn.EnrolledStud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="sidebar">
		<div class="bg_shadow"></div>
		<div class="sidebar__inner">
			<div class="close"> <i class="fas fa-times"></i> </div>
			<div class="profile_info">
				<div class="profile_img"> <img src="Assets/Logo.png" alt="img"> </div>
			</div>
			<ul class="siderbar_menu">
				<li>
					<a href="admin.aspx"> <b></b> <b></b>
						<div class="title"><i class="fa-solid fa-user"></i>User</div>
					</a>
				</li>
				<li>
					<a href="Category.aspx"  > <b></b> <b></b>
						<div class="title"><i class="fa-solid fa-filter"></i>Category</div>
					</a>
				</li>
				<li>
					<a href="Course.aspx"> <b></b> <b></b>
						<div class="title"><i class="fa-regular fa-fire"></i>Course</div>
					</a>
				</li>
				<li>
					<a href="EnrolledStud.aspx" class="active"> <b></b> <b></b>
						<div class="title"><i class="fa-solid fa-cart-shopping"></i>Enrollment</div>
					</a>
				</li>
				<li>
					<a href="Login.aspx"> <b></b> <b></b>
						<div class="title"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</div>
					</a>
				</li>
			</ul>
		</div>
	</div>
        <div class="main_container">
			<div class="top_navbar">
			<div class="hamburger">
				<div class="hamburger__inner"> <i class="fas fa-bars"></i> </div>
			</div>
			<div class="nav_title">
				<p>Hi <span>Admin</span>, Welcome</p>
			</div>
		</div>
            <section>
			<div class="container main_sec">
				<div class="row text-center">
					<div class="col-lg-3">
						<div class="counter "> <i class="fa-solid fa-user"></i>
							<h2 class="timer count-title count-number" id="User_count" data-to="15" data-speed="1500"></h2>
							<p class="count-text ">Users</p>
						</div>
					</div>
					<div class="col-lg-3 ">
						<div class="counter "> <i class="fa-solid fa-filter"></i>
							<h2 class="timer count-title count-number" id="Category_count" data-to="5" data-speed="1500"></h2>
							<p class="count-text ">Categories</p>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="counter"> <i class="fa-regular fa-fire"></i>
							<h2 class="timer count-title count-number" id="Product_count" data-to="16" data-speed="1500"></h2>
							<p class="count-text ">Courses</p>
						</div>
					</div>
					<div class="col-lg-3 ">
						<div class="counter active"> <i class="fa-solid fa-cart-shopping"></i>
							<h2 class="timer count-title count-number" id="Order_count" data-to="20" data-speed="1500"></h2>
							<p class="count-text ">Enrollments</p>
						</div>
					</div>
				</div>
			</div>
		<form runat="server">
			<div class="container table-wrapper">
				<div class="table-content">
					<div class="row">
						<div class="col-lg-12">
						    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="grid" ForeColor="Black" GridLines="Horizontal" ShowHeaderWhenEmpty="True" OnRowDeleting="GridView1_RowDeleting">
                                <Columns>
                                    <asp:ButtonField ButtonType="Image" CommandName="delete" HeaderText="UnEnroll" ImageUrl="~/Assets/bin.png" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
						</div>
					</div>
				</div>
			</div>
			</form>
		</section>
        </div>
   </div>
</asp:Content>
