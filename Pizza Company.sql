CREATE TABLE Customer_order (
  Customer_name varchar(20),
  order_id  varchar(10),
  status varchar(50)
);
INSERT INTO Customer_order values('jhon','J1','DELIVERD');
INSERT INTO Customer_order values('jhon','J2','DELIVERD');
INSERT INTO Customer_order values('David','D1','DELIVERD');
INSERT INTO Customer_order values('David','D3','CREATED');
INSERT INTO Customer_order values('Smith','S1','SUBMITTED');
INSERT INTO Customer_order values('Krish','K1','CREATED');
select 
Customer_name,
CASE 
   when sum(CASE when status = 'DELIVERED' then 1 else 0 END) = COUNT(*) then 'COMPLETED'
   when sum(CASE when status = 'DELIVERED' then 1 else 0 END) > 0  AND SUM(CASE when status IN ('CREATED','SUBMITTED') then 1 else 0 END) > then 'IN PROGRESS'
   when sum(CASE when status = 'SUBMITTED' then 1 else 0 END) > 0 AND SUM(CASE when status <> 'DELIVERED' then 1 else 0 end) = COUNT(*) then 'AWAITING PROGRESS'
   ELSE 'AWAITING SUBMISSION'
   END as final_status
FROM Customer_order
GROUP BY Customer_name;


