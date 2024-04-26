<%@ Page Title="" Language="C#" MasterPageFile="~/SHBS/SHBS_User/SHBS_User.Master" AutoEventWireup="true" CodeBehind="BookingSeminarHallUs.aspx.cs" Inherits="SeminarHallBookingSystem.SHBS.SHBS_User.BookingSeminarHallUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-box hor-icon mr-2"></i> Booking Seminar Hall</a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        <!--page-header closed-->
    </div>

  <!-- row open -->
    <div class="row">
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card">
                <div class="card-header">
                    <h4>
                       Book Seminar Hall</h4>
                </div>
                <div class="card-body text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Book Now" class="btn btn-info" onclick="btnAdd_Click" 
                       />
                </div>
            </div>
        </div>
    </div>
    <!-- row closed -->
     <!-- Message Modal -->
     <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="example-Modal3">
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" >
                    <div class="form-group row">

                  <%--
                        <asp:Label ID="lblBookinglId" runat="server" Text="Booking Id :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtBookingId" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>

                    <asp:Label ID="lblHallId" runat="server" Text="Hall Name :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                        <asp:DropDownList ID="ddlHallId" runat="server" class="form-control" DataSourceID="sqldsHallDetails" 
                        DataTextField="HallName" DataValueField="HallId">
                               
                
                        </asp:DropDownList>

                         
                             <asp:SqlDataSource ID="sqldsHallDetails" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:SeminarHallBookingSystemConnectionString %>" 
                                 SelectCommand="SELECT [HallId], [HallName] FROM [tblHallDetails]">
                             </asp:SqlDataSource>

                           
                           
                    </div>

                      <asp:Label ID="lblDeptName" runat="server" Text="Department Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDeptName" runat="server" class="form-control"></asp:TextBox>
                    </div>





                    </div>

                   <%-- <asp:Label ID="lblHallId" runat="server" Text="Hall Id :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtHallId" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    </div>--%>


                     <div class="form-group row">

                  
                      
                  
                   <asp:Label ID="lblStaffIncharge" runat="server" Text="Staff Incharge :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtStaffIncharge" runat="server" class="form-control"></asp:TextBox>
                   
                   </div>


                       <asp:Label ID="lblEventName" runat="server" Text="Event Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtEventName" runat="server" class="form-control"></asp:TextBox>
                    </div>

                   
                   </div>
                       
                       <div class="form-group row">

                  
                    
                  
                   <asp:Label ID="lblDateFromTime" runat="server" Text="Date & From Time :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDateFromTime" runat="server" class="form-control" name ="datetime" TextMode="DateTimeLocal"></asp:TextBox>
                   
                   </div>
                   <asp:Label ID="lblDateEndTime" runat="server" Text="Date & End Time :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDateEndTime" runat="server" class="form-control" name ="datetime" TextMode="DateTimeLocal"></asp:TextBox>
                    </div>
                   
                   </div>


                     <div class="form-group row">

                  
                        
                  
                <asp:Label ID="lblSession" runat="server" Text="Session :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                        <asp:DropDownList ID="ddlSession" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Full Day</asp:ListItem>
                            <asp:ListItem Value="2">FN</asp:ListItem>
                             <asp:ListItem Value="3">AN</asp:ListItem>
                        </asp:DropDownList>
                   
                   </div>

                   

                     <asp:Label ID="lblDescription" runat="server" Text="Description :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    
                   
                   </div>


                    <div class="form-group row">



                        <asp:Label ID="lblDateCreated" runat="server" Text="Date Created :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDateCreated" runat="server" class="form-control" name ="datetime" TextMode="DateTimeLocal"></asp:TextBox>
                        </div>
                              <asp:Label ID="lblDateChanged" runat="server" Text="Date Changed :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDateChanged" runat="server" class="form-control" name="datetime"  TextMode="DateTimeLocal"></asp:TextBox>
                        </div>

                
                       </div>
                  
                    
                    <div class="form-group row">

           
                         <asp:Label ID="lblBookingStatus" runat="server" Text="Status:" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlBookingStatus" runat="server" class="form-control">
                                <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                                <asp:ListItem Value="1">AC</asp:ListItem>
                                <asp:ListItem Value="2">DC</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <asp:Label ID="lblEventImg" runat="server" Text="Event Image :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                  
                        <asp:FileUpload ID="fuEventImg" runat="server" class="form-control"/>

                        </div>


                        </div>
                        <%--class="progress-bar progress-bar-striped progress-bar-animated w-10"--%>

                   <%--  <asp:Label ID="lblStatus" runat="server" Text="Status:" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">AC</asp:ListItem>
                            <asp:ListItem Value="2">DC</asp:ListItem>
                        </asp:DropDownList>
                    </div>







                    </div>--%>



                    </form>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary" OnClick="btnCancel_Click"/>
                </div>
            </div>
        </div>
    </div>
    <!-- Message Modal closed -->


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
                            CellSpacing="3" Width="404px" 
                            onselectedindexchanged="gvBookedHallDetails_SelectedIndexChanged" >
                           
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

                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-action btn-primary"
                                            CausesValidation="False" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
