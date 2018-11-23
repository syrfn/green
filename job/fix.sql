with a as (select
  order_time,
  customer_no,
  order_type, 
  order_payment 
from  `source.daily_order`
where order_status = 'Completed')

, b as (select 
  distinct(date(order_time , 'Asia/Jakarta')) order_date, 
  customer_no, 
  order_payment,
  string_agg(order_type, ',') over(partition by date(order_time , 'Asia/Jakarta'), customer_no order by date(order_time , 'Asia/Jakarta')) as order_type,
  count(order_type) over(partition by date(order_time , 'Asia/Jakarta'), customer_no order by date(order_time , 'Asia/Jakarta'))no_order_type
from a
)

, c as (select 
  order_date, 
  no_order_type,
  order_type,
  order_payment,
  count(distinct customer_no) total_customer
from b 
group by 1,2,3,4
)

select 
  order_date, 
  no_order_type,
  array_agg(struct(order_type, total_customer)) as detail, 
  order_payment
from c 
where order_date = 'dstart'
group by 1,2,4
