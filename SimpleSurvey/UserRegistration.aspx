<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="SimpleSurvey.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .auto-style1 {
            width: 427px;
        }
        .auto-style2 {
            width: 467px;
        }
        .auto-style3 {
            width: 574px;
        }
    </style>
    
    </head>
<body>
     
      <div>
        <asp:Image ID="Image1" runat="server" Height="59px" Width="66px" st ImageUrl="~/img/DSB_logo.png" />
        &nbsp;
        <asp:Image ID="Image2" runat="server" Height="62px" Width="62px" ImageUrl="~/img/metro_logo.png" CssClass="auto-style1" />
        &nbsp;
        <asp:Image ID="Image3" runat="server" Height="57px" Width="62px" ImageUrl="~/img/movia_logo.png" />
    </div>

    

    <form id="form1" runat="server" style="background-color: #FFFFFF" class="auto-style3"  >
         <table cellpadding="2" class="auto-style2" draggable="true" >
      <tr>
                <td style="text-align: left;" class="auto-style3">
                <asp:Button ID="btbSwitch1" Text="Jump To Manage Questions" runat="server" CausesValidation="False"  OnClick="btbSwitch1_Click" />
                </td>
                <td class="auto-style4">
                    </td>
                <td class="auto-style4">
                    </td>
            </tr>
             <tr>
             <td style="width: 25%; text-align: left;">
                  <asp:Button ID="btbSwitch2" Text="Jump To Manage Surveys" runat="server" CausesValidation="False"  OnClick="btbSwitch2_Click" />
                    &nbsp;</td>
                <td>
                    &nbsp;</td>        
            </tr>
</table>
        <h2 style="position: inherit">User registration</h2>
        <div>
            <tr>
                <td style="width: 25%; text-align: left;">
                 <p>Please choose your user type:</p>
    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Admin</asp:ListItem>
        <asp:ListItem>User</asp:ListItem>
    </asp:DropDownList>
                     </td>
                <td>
                    &nbsp;</td>
     <td>
                    &nbsp;</td>
</tr>
        </div>
        <div>

            <tr>
      
                <td style="width: 25%; text-align: left;">   
<p>Please enter your name and password:</p>
                    </tr>
             <td>
               
                <asp:Label ID="lname" runat="server" Text="Name:" Width="79px"></asp:Label>
                <asp:TextBox ID="tbxname" runat="server"></asp:TextBox>
                    &nbsp;</td>
 <tr>
      
                <td style="width: 25%; text-align: left;">    
               
                </td>

                <td>
                </td>
                <td>
                    &nbsp;</td>
                
</tr>
        </div>
        
         <p>
                <asp:Label ID="lbpw" runat="server" Text="Password:" Width="79px"></asp:Label>
                <asp:TextBox ID="tbxpw" runat="server"></asp:TextBox>
                </p>
         <p>
                <asp:Button ID="btSubmit" Text="OK" runat="server" CausesValidation="False"  OnClick="btSubmit_Click" />
                </p>
        
    </form>
         
    </body>
</html>
