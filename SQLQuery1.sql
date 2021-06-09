select * from SurveyQuestions
select * from Questions
select * from Survey_Response
select * from Surveys
select * from Users
select * from Roles
--insert into Users values('Ran', 'Wang', 'RW', '1234','Admin');
--delete from Questions where ID=2
--update Questions
--set questiontype = 'SingleLine TextBox' where id =4
--truncate table Questions
select 
sr.SurveyID
,s.title
,q.text
,sr.response 
,IsSatisfied = case when sr.response = 'yes' then 1 else 0 end
,SatisfactionScore = case when isnumeric(sr.response) =1 then sr.response else null end
,s.CreatedOn
,u.UserName
from Survey_Response sr 
join Surveys s on s.id = sr.surveyid
join Questions q on q.id = sr.questionid
JOIN Users u ON s.CreatedBy = u.id
where sr.response = 'yes'
   or isnumeric(sr.response) =1 

with a as(
select 
sr.SurveyID
--,s.title
--,q.text
--,sr.response 
,s.CreatedOn
--,u.UserName
,IsSatisfied = case when sr.response = 'yes' then 1 else 0 end
,SatisfactionScore = case when isnumeric(sr.response) =1 then sr.response else 0 end
from Survey_Response sr 
join Surveys s on s.id = sr.surveyid
join Questions q on q.id = sr.questionid
JOIN Users u ON s.CreatedBy = u.id
)
select 
SurveyID
--,title
,CreatedOn
--,UserName
,IsSatisfied = sum(IsSatisfied)
,SatisfactionScoreTotal = sum(SatisfactionScore)
,SatisfactionScoreAvg = cast( sum(SatisfactionScore) *1.0 / count(distinct SurveyID) as decimal(18,2) )
from a
group by 
SurveyID
--,title
,CreatedOn
--,UserName