# 供应商信息表，其中主键id就是供应商的supplier_id
select * from b2c_supplier_info
select * from b2c_check_supplier_config
select * from b2c_supplier_info a left join b2c_check_supplier_config b on a.id=b.supplier_id
select a.supplier_name,b.* from b2c_supplier_info a left join supplier_telephone b on a.id=b.supplier_id
# 供应商直签景点表 supplier_id<==> sight_id
select * from b2c_supplier_sight

# 产品信息表  记录产品的详细信息，包括产品id(product_id)和supplier_id
select * from b2c_product_summary a left join b2c_product_ticket_date b on a.id=b.product_id

# 产品日历报价(日历票)
select * from b2c_product_ticket_date  

# 详细的订单信息表
# id 主键(tts内部使用 oid/order_id)
# display_id (展示给外部系统的订单号)
# product_id
select * from b2c_order
select a.id,a.title from b2c_product_summary a left join b2c_order b on a.id=b.product 
# 金钱的流水，每一个订单流水状态
select sum(qunar_income) from b2c_money_trace

# 供应商订单表
# oid        tts订单号
# order_num  第三方的订单号
# display_id 给用户看到的订单号
select * from b2c_ticket_order where not supplier_id isnull or not supplier_system_identity isnull

# 连表，通过oid进行连接
select b2c_order.id, b2c_order.display_id,b2c_ticket_order.display_id from b2c_order right join b2c_ticket_order on b2c_order.id=b2c_ticket_order.oid

# 电子票表 (b2c_order_eticket)
select * from b2c_order_eticket tick left join b2c_order ord on tick.order_id=ord.id 

# 订单用户表 (b2c_order_user)
# 下订单的qunar用户， 会限制用户的购买数量
select * from b2c_order_user where order_id='200551408'

# 接口供应商信息表(b2c_dataagent_supplier)
select * from b2c_dataagent_supplier where supplier_exchange_identity='piaozailvtu'

select * from b2c_dataagent_log

############################################
############################################
select * from b2c_supplier_info where id='691'
select * from b2c_product_summary where supplier_id='691'
