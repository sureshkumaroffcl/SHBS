<%@ Page Title="" Language="C#" MasterPageFile="~/SHBS/SHBS_Admin/SHBS_Admin.Master" AutoEventWireup="true" CodeBehind="AddSeminarHallAd.aspx.cs" Inherits="SeminarHallBookingSystem.SHBS.SHBS_Admin.AddSeminarHallAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-grid hor-icon mr-2"></i>Seminar Hall</a></li>
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
                       Add Seminar Hall</h4>
                </div>
                <div class="card-body text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-info" 
                        onclick="btnAdd_Click"  />
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

                  
                       <%-- <asp:Label ID="lblHallId" runat="server" Text="Hall Id :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtHallId" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>




                    <asp:Label ID="lblHallName" runat="server" Text="Hall Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtHallName" runat="server" class="form-control"></asp:TextBox>
                    </div>

                     <asp:Label ID="lblHallType" runat="server" Text="Hall Type :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                        <asp:DropDownList ID="ddlHallType" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Auditorium Style</asp:ListItem>
                            <asp:ListItem Value="2">Classroom Style</asp:ListItem>
                            <asp:ListItem Value="3">U-Shape Style</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    </div>


                     <div class="form-group row">

                  
                     <%--   <asp:Label ID="lblHallType" runat="server" Text="Hall Type :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtHallType" runat="server" class="form-control"></asp:TextBox>--%>

                       
                  
                   <asp:Label ID="lblBlockName" runat="server" Text="Block Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtBlockName" runat="server" class="form-control"></asp:TextBox>
                   
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

                   

                        <asp:Label ID="lblUploadImg" runat="server" Text="Hall Image :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                  
                        <asp:FileUpload ID="fuUploadImg" runat="server" class="form-control"/>

                     
                       
                        </div>
                        </div>
                      

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
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary"  OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary" OnClick="btnCancel_Click" />
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
                        Hall Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvHallDetails" runat="server" 
                            AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="404px" onselectedindexchanged="gvHallDetails_SelectedIndexChanged" >
                           
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
