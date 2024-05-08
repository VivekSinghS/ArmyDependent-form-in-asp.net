<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ArmyCops.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
</head>
<body>
  <center>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td >Army Enrollment Number</td>
                    <td> <asp:TextBox ID="txtarmyEnroll" runat="server" ></asp:TextBox></td>
                </tr>
                      <tr>
                          <td>Name</td>
                          <td> <asp:TextBox ID="txtName" runat="server"></asp:TextBox> </td>
                       </tr>
                 <tr>
                    <td>Rank</td>
                   <td> <asp:TextBox ID="txtRank" runat="server"></asp:TextBox> </td>
                    </tr>  
                          <tr>
                                 <td>SmartCard No</td>
                                 <td> <asp:TextBox ID="txtSmartcard" runat="server"></asp:TextBox> </td>
                                </tr>
                             <tr>
                                  <td>MobNo</td>
                                  <td> <asp:TextBox ID="txtMobno" runat="server"></asp:TextBox> </td>
                                       </tr>
                                 <tr>
                                    <td>Address</td>
                                    <td> <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox> </td>
                                        </tr>

                             <tr>
                                 <td></td>
                                 <td> <asp:Button ID="btnSubmit" runat="server" Text="Submit" onClick="btnSubmit_Click" ></asp:Button></td>
                             </tr>
                          <tr>
                              <td></td>
                              <td> <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" OnRowCommand="grdView_RowCommand">

                                  <Columns>

                                      <asp:TemplateField HeaderText ="ArmyEnrollmentNo">
                                          
                                          <ItemTemplate>
                                              <%#Eval("ArmyInrollmentNo")%>
                                          </ItemTemplate>

                                      </asp:TemplateField>

                                      <asp:TemplateField HeaderText ="Name">
                                          <ItemTemplate>
                                      
                                              <%#Eval("Name") %>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText ="Rank">
                                        <ItemTemplate>

                                             <%#Eval("Rank") %>
                                             </ItemTemplate>
                                             </asp:TemplateField>

                                      <asp:TemplateField HeaderText="SmartCardNo">
                                          <ItemTemplate>
                                              <%#Eval("SmartCardNo") %>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  
                                      <asp:TemplateField HeaderText="MobNo">
                                          <ItemTemplate>
                                              <%#Eval("MobNo")%>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  
                                      <asp:TemplateField HeaderText="Address">
                                          <ItemTemplate>
                                              <%#Eval("Address")%>
                                          </ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="A" CommandArgument= '<%#Eval("ArmyNo")%>'></asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>

                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="B" CommandArgument='<%#Eval("ArmyNo") %>'></asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>

                                  </Columns>

                                   </asp:GridView> </td>
                          </tr>
                        

            </table>
        </div>
    </form>
      </center>
</body>
</html>
