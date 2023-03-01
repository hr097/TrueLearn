<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Elearn.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main>
    <div class="slider-menu">
        <div class="swiper" id="Swiper1">
            <div class="swiper-wrapper">
                <div class="swiper-slide slide1 slideranimation">
                    <div class="container">
                        <div class="row">
                            <!-- <div class="col-md-7 col-sm-12 col-12 "></div> -->
                            <div class="col-md-5 col-sm-12 col-12 ">
                                <div class="slider-content">
                                    <h3>TRENDING</h3>
                                    <h1>COURSES </h1>
                                    <p>Purchase most demanding courses and hike your knowledge with Trulearn</p>
                                    <div class="slider-btn">
                                        <a href="/shop.html">
                                            SHOP MORE 
                                            <i style="font-size: 14px; margin-left: 8px;" class="sli sli-basket-loaded"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                
            </div>
        </div>
    </div>
    </main>
     <div class="container facility_section">
      <div class="row">
        <div class="col-lg-3 col-md-12 col-sm-12">
          <div class="wrapper">
            <div class="icon">
              <i class="fa-solid fa-truck"></i>
            </div>
            <div class="wrappbody">
                <p>FAST ACCESS</p>
                <p>On all Online Courses</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="wrapper">
            <div class="icon">
            <i class="fa-solid fa-rotate-left"></i>
            </div>
            <div class="wrappbody">
                <p>FREE WITHDROW</p>
                <p>on 1st withdraw in 30 days</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="wrapper">
            <div class="icon">
            <i class="fa-solid fa-gift"></i>
            </div>
            <div class="wrappbody">
                <p>MEMBER DISCOUNT</p>
                <p>Register and save your money</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="wrapper">
            <div class="icon">
            <i class="fa-solid fa-headset"></i>
            </div>
            <div class="wrappbody">
                <p>PREMIUM SUPPORT</p>
                <p>Support 24 hours per day</p>
            </div>  
          </div>
        </div>
      </div>
    </div>
    <form runat="server">
      <div class="container product_section">
       <div class="title">
        <h3> NEW COURSES </h3>
           <p>&nbsp</p>
       </div>
          <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="grid" ForeColor="Black" GridLines="Horizontal" ShowHeaderWhenEmpty="True" OnRowUpdating="GridView1_RowUpdating">
              <Columns>
                  <asp:ButtonField ButtonType="Image" CommandName="update" HeaderText="Enroll" ImageUrl="~/Assets/editing.png" />
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
    </form>
</asp:Content>
