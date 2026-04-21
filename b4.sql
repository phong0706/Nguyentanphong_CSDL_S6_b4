drop table if exists orders;

create table orders (
    order_id int primary key auto_increment,
    customer_name varchar(255),
    failure_reason varchar(100),
    created_at datetime
);

insert into orders (customer_name, failure_reason, created_at) values
('nguyen van a', 'khach_huy', '2026-04-20 10:00:00'),
('tran thi b', 'quan dong cua', '2026-04-20 10:30:00'),
('le van c', 'success', '2026-04-20 11:00:00'),
('pham van d', 'khong co tai xe', '2026-04-20 11:15:00'),
('hoang thi e', 'bom hang', '2026-04-20 12:00:00'),
('ngo van f', 'success', '2026-04-20 12:30:00');

select order_id, customer_name, failure_reason
from orders
where failure_reason in ('khach_huy', 'quan dong cua', 'khong co tai xe', 'bom hang');