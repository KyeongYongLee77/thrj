select * from movies

select movie_actor from movies

set @rownum:=0;
commit;

select @rownum:=@rownum+1 as no, m.*
from movies m
limit 14,14;