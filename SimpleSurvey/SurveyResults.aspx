<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyResults.aspx.cs" Inherits="SimpleSurvey.SurveyResults" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <tr>
                <td style="width: 25%; text-align: left;">
                <asp:Button ID="btbSwitch" Text="Jump To Survey Form" runat="server" CausesValidation="False"  OnClick="btbSwitch_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        <div>
            <p> &nbsp;</p>
            <p> SurveyResults: </p>

        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="SurveyID" HeaderText="SurveyID" SortExpression="SurveyID" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" />
                <asp:BoundField DataField="response" HeaderText="response" SortExpression="response" />
                <asp:BoundField DataField="IsSatisfied" HeaderText="IsSatisfied" SortExpression="IsSatisfied" ReadOnly="True" />
                <asp:BoundField DataField="SatisfactionScore" HeaderText="SatisfactionScore" SortExpression="SatisfactionScore" ReadOnly="True" />
                <asp:BoundField DataField="RespondOn" HeaderText="RespondOn" SortExpression="RespondOn" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SurveyAppConnectionString %>" SelectCommand="select 
sr.SurveyID
,s.title
,q.text
,sr.response 
,IsSatisfied = case when sr.response = 'yes' then 1 else 0 end
,SatisfactionScore = case when isnumeric(sr.response) =1 then sr.response else null end
--,s.CreatedOn
,sr.[RespondOn]
,u.UserName
from Survey_Response sr 
join Surveys s on s.id = sr.surveyid
join Questions q on q.id = sr.questionid
JOIN Users u ON s.CreatedBy = u.id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SurveyAppConnectionString %>" SelectCommand="with a as(
select 
sr.SurveyID
--,s.title
,q.text
,sr.response 
,sr.[RespondOn]
--,s.createdon
--,u.UserName
,IsSatisfied = case when sr.response = 'yes' then 1 else 0 end
,SatisfactionScore = case when (ISNUMERIC(sr.response) =1 ) then sr.response else 0 end
from Survey_Response sr 
join Surveys s on s.id = sr.surveyid
join Questions q on q.id = sr.questionid
JOIN Users u ON s.CreatedBy = u.id

)
select 
SurveyID
--,title
,CAST([RespondOn]  AS DATE) AS [Date]
--,UserName
,IsSatisfied = sum(IsSatisfied)
,SatisfactionScoreTotal = sum(SatisfactionScore)
,SatisfactionScoreAvg = cast( sum(SatisfactionScore) *1.0 / count(DISTINCT [RespondOn] ) as decimal(18,2) )
from a
group by 
SurveyID
,CAST([RespondOn]  AS DATE)"></asp:SqlDataSource>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Palette="None" PaletteCustomColors="Red; Blue" Width="1195px">
            <series>
                <asp:Series ChartArea="ChartArea1" ChartType="Bubble" IsValueShownAsLabel="True" Legend="AverageSatisfactionScore" Name="SatisfactionScoreAvg" XValueMember="Date" YValueMembers="SatisfactionScoreAvg" YValuesPerPoint="2">
                </asp:Series>
                <asp:Series ChartType="Bubble" IsValueShownAsLabel="True" Legend="IsSatisfied" Name="IsSatisfied" XValueMember="Date" YValueMembers="IsSatisfied" YValuesPerPoint="2">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
            <Legends>
                <asp:Legend Name="IsSatisfied">
                </asp:Legend>
                <asp:Legend Name="AverageSatisfactionScore">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Font="Arial Rounded MT Bold, 20.25pt" Name="Satisfaction chart">
                </asp:Title>
            </Titles>
        </asp:Chart>
    </form>
            
</body>
</html>
