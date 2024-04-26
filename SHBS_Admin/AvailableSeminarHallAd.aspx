<%@ Page Title="" Language="C#" MasterPageFile="~/SHBS/SHBS_Admin/SHBS_Admin.Master" AutoEventWireup="true" CodeBehind="AvailableSeminarHallAd.aspx.cs" Inherits="SeminarHallBookingSystem.SHBS.SHBS_Admin.AvailableSeminarHallAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-box hor-icon mr-2"></i>Available Seminar Hall</a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        <!--page-header closed-->
    </div>


    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>
                        Hall Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvHallDetails" runat="server" 
                            AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="404px"  >
                           
                            <Columns>


                             <asp:TemplateField>
                                    <HeaderTemplate >
                                        S.No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="bg-primary"   />
                                </asp:TemplateField>



                                <asp:BoundField DataField="HallId" HeaderText="Hall Id" 
                                    SortExpression="Hall Id" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 
                               

                                
                                <asp:BoundField DataField="HallName" HeaderText="Hall Name" 
                                    SortExpression="Hall Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                              
                               <asp:BoundField DataField="HallType" HeaderText="Hall Type" 
                                    SortExpression="Hall Type">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                               <asp:BoundField DataField="BlockName" HeaderText="Block Name" 
                                    SortExpression="Block Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" >
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                               

                                  <asp:BoundField DataField="DateCreated" HeaderText="Date Created" 
                                    SortExpression="Date Created" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" >
                                    <HeaderStyle CssClass="bg-primary"  HorizontalAlign="NotSet" />
                                </asp:BoundField>

                                <asp:BoundField DataField="DateChanged" HeaderText="Date Changed" 
                                    SortExpression="Date Changed" DataFormatString="{0:dd-MM-yyyy hh:mm tt}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>



                                 <asp:TemplateField HeaderText="Hall Image" HeaderStyle-CssClass="bg-primary">
                        <ItemTemplate>
                            <asp:Image ID="ImgHall" runat="server" ImageUrl= '<%# (string) FormatImageUrl( (string) Eval("HallImage"))  %>'
                          
                                Height="80px" Width="100px" />
                        </ItemTemplate>


<HeaderStyle CssClass="bg-primary"></HeaderStyle>


                        </asp:TemplateField>
                              <%--  <asp:ImageField DataImageUrlField="HallImage" HeaderText="Hall Image" 
                                    SortExpression="Hall Image">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:ImageField>--%>

                             <%--   <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-action btn-primary"
                                            CausesValidation="False" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
