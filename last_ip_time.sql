select  distinct  t2.`send_Num`,t2.`ip_add`,t2.`send_time`
from gaofushuai t2
join 
(
select t1.send1,count(*) as countt 
from 
(

SELECT id,
    (
     case send_Num
     	when '2700961555' then receive_num
     	else send_Num
     end
     ) as send1
FROM `gaofushuai`

) as t1
group by t1.send1
having countt>=2901
ORDER BY countt  DESC
) t3 on  t2.`send_Num` = t3.send1
join 
( 
    select `send_Num`,MAX(`send_time`) as time
    from gaofushuai
    group by  `send_Num`
 )t4 on t2.`send_Num` = t4.`send_Num` and t2.`send_time`=t4.time

/*
循环查询查询最后时间IP
*/

