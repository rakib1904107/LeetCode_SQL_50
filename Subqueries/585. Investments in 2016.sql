select round(sum(t.tiv_2016),2) as tiv_2016 
from Insurance t
where t.tiv_2015 in (select tiv_2015 
                     from Insurance 
                     group by tiv_2015 
                     having count(*)>1) and (lat,lon) not in (select lat,lon 
                                                              from Insurance 
                                                              group by lat,lon 
                                                              having count(*)>1);