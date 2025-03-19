select user_id,name,mail
from Users
where mail REGEXP '^[A-Za-z][a-zA-Z0-9_.-]*@leetcode[.]com$';