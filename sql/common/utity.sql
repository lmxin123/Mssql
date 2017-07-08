--lastIndexOf
REVERSE(SUBSTRING(REVERSE([filed]),0,CHARINDEX([char],REVERSE([filed])))) 

--删除字符中的中文
create function fun_del_chinese
(@col varchar(1000))
returns varchar(1000)
AS
begin
    declare @returnchar varchar(1000),@len int
    select @returnchar='',@len=1
  
    while(@len<=len(@col))
    begin
        if(ASCII(substring(@col,@len,1))<122)
        set @returnchar=@returnchar+substring(@col,@len,1)
        set @len=@len+1
    end
return @returnchar
end
go