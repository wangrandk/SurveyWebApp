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
--SET FOREIGN_KEY_CHECKS = OFF; -- to disable them
--delete from Surveys where id <> 11
--SET FOREIGN_KEY_CHECKS = ON;


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

alter PROCEDURE sp_insertUser @name nvarchar(50), @password nvarchar(10), @role varchar(200)
as
if  not exists (select *from Users where username = @name   )  and @name is not null and @password is not null and @role is not null
begin
declare @roleid int;
select @roleid= ID from Roles where Name = @role
insert into Users values('','',@name, @roleid,@password)
end
--go;

create PROCEDURE sp_insertRole @role varchar(200)
as
if not exists (select 1 from Roles where name = @role)
begin 
insert into Roles (Name) values (@role) 
end