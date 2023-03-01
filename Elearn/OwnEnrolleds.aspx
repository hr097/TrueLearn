<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="OwnEnrolleds.aspx.cs" Inherits="Elearn.OwnEnrolleds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            position: relative;
            width: 100%;
            min-height: 1px;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
      <div class="container product_section">
       <div class="title">
        <h3>YOUR ENROLLED COURSES</h3>
           <p>&nbsp;</p>
       </div>
         
       </div>
        		
			<div class="container table-wrapper">
				<div class="table-content">
					<div class="row">
						<div class="auto-style2">
                            <br />
                           <div class="title">
                            <h3>YOUR COURSES</h3>
                               <p>&nbsp;</p>
                           </div>
                            <br />
                           
                            <asp:GridView runat="server" ID="GridView1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="grid" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting" ShowHeaderWhenEmpty="True">
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
                            <br />
                            <br />
                            <br />
                            <div class="title">
                                <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="#9966FF" Text="Your Total Fees = "></asp:Label>
                                <asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="#9966FF" Text="9000"></asp:Label>
                           </div>
                                <br />
						</div>
					</div>
				</div>
			</div>
		
    </form>
</asp:Content>

