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
from Survey_Response sr 
join Surveys s on s.id = sr.surveyid
join Questions q on q.id = sr.questionid
