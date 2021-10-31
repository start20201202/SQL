with total as
(Select
t.ClientID,
isnull(t.Payment_SUM,0) as Payment_SUM
from Client_Order t)

Select
distinct
r.ClientID,
SUM(r.Payment_SUM) over (partition by r.ClientID)
from total r

/*union*/
Select
 t.payment_id, t.unit_price
 from  Payments t 
union all --all не приводить значення до унікальних (повтори зберігаються)
Select
 r.member_id, r.member_id
 from FamilyMembers r  
