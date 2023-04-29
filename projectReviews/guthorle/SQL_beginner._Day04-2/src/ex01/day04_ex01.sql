select name
from v_persons_female f
union select name from v_persons_male
order by 1;