Select
 t.payment_id, t.unit_price
 from  Payments t 
union all --all не приводить значення до унікальних (повтори зберігаються)
Select
 r.member_id, r.member_id
 from FamilyMembers r 
 
