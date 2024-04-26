<%@ Page Title="" Language="C#" MasterPageFile="~/SHBS/SHBS_User/SHBS_User.Master" AutoEventWireup="true" CodeBehind="BookedSeminarHallUs.aspx.cs" Inherits="SeminarHallBookingSystem.SHBS.SHBS_User.BookedSeminarHallUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-layers hor-icon mr-2"></i> Booked Hall</a></li>
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
                        Booked Hall Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvBookedHallDetails" runat="server" 
                            AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="404px" >
                        
                           
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



                                <asp:BoundField DataField="BookingId" HeaderText="Booking Id" 
                                    SortExpression="Booking Id" >
                                    <HeaderStyle CssClass="bg-primary" />
                                     </asp:BoundField>



                                <asp:BoundField DataField="HallId" HeaderText="Hall Id" 
                                    SortExpression="Hall Id" >
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 
                               

                                
                                <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" 
                                    SortExpression="Department Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                              
                               <asp:BoundField DataField="StaffIncharge" HeaderText="Staff Incharge" 
                                    SortExpression="Staff Incharge">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                               <asp:BoundField DataField="EventName" HeaderText="Event Name" 
                                    SortExpression="Event Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 <asp:BoundField DataField="DateFromTime" HeaderText="Date From Time" 
                                    SortExpression="Date From Time" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" >
                                     <HeaderStyle CssClass="bg-primary" />
                                     </asp:BoundField>

                                <asp:BoundField DataField="DateEndTime" HeaderText="Date End Time" 
                                    SortExpression="Date End Time" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" >
                                    <HeaderStyle CssClass="bg-primary" />
                                     </asp:BoundField>



                                <asp:BoundField DataField="Session" HeaderText="Session" 
                                    SortExpression="Session" >
                                    <HeaderStyle CssClass="bg-primary" />
                                     </asp:BoundField>

                                 <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" >
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                               

                                  <asp:BoundField DataField="DateCreated" HeaderText="Date Created" 
                                    SortExpression="Date Created" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" >
                                    <HeaderStyle CssClass="bg-primary"  />
                                </asp:BoundField>

                                <asp:BoundField DataField="DateChanged" HeaderText="Date Changed" 
                                    SortExpression="Date Changed" DataFormatString="{0:dd-MM-yyyy hh:mm tt}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>



                                 <asp:BoundField DataField="BookingStatus" HeaderText="Booking Status" 
                                    SortExpression="Booking Status" >
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>



                                 <asp:TemplateField HeaderText="Event Image" HeaderStyle-CssClass="bg-primary">
                        <ItemTemplate>
                            <asp:Image ID="ImgHall" runat="server" ImageUrl= '<%# (string) FormatImageUrl( (string) Eval("EventImage"))  %>'
                          
                                Height="80px" Width="100px" />
                        </ItemTemplate>


<HeaderStyle CssClass="bg-primary"></HeaderStyle>


                        </asp:TemplateField>
                              <%--  <asp:ImageField DataImageUrlField="HallImage" HeaderText="Hall Image" 
                                    SortExpression="Hall Image">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:ImageField>--%>

                            <%--    <asp:TemplateField ShowHeader="False">
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
