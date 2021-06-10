<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="SimpleSurvey.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <table cellpadding="2" class="style1">
      <tr>
                <td style="width: 25%; text-align: left;">
                <asp:Button ID="btbSwitch1" Text="Jump To Manage Questions" runat="server" CausesValidation="False"  OnClick="btbSwitch1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
             <tr>
             <td style="width: 25%; text-align: left;">
                  <asp:Button ID="btbSwitch2" Text="Jump To Manage Surveys" runat="server" CausesValidation="False"  OnClick="btbSwitch2_Click" />
                    &nbsp;</td>
                <td>
                    &nbsp;</td>        
            </tr>
</table>
        <h2>User registration</h2>
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
                    &nbsp;</td>
 <tr>
      
                <td style="width: 25%; text-align: left;">    
               
                <asp:Label ID="lname" runat="server" Text="Name:" Width="79px"></asp:Label>
                <asp:TextBox ID="tbxname" runat="server"></asp:TextBox>
                </td>

                <td>
                <asp:Label ID="lbpw" runat="server" Text="Password:" Width="79px"></asp:Label>
                <asp:TextBox ID="tbxpw" runat="server"></asp:TextBox>
                <asp:Button ID="btSubmit" Text="OK" runat="server" CausesValidation="False"  OnClick="btSubmit_Click" />
                </td>
                <td>
                    &nbsp;</td>
                
</tr>
        </div>
    </form>
</body>
</html>
