-- 1- Qual o número de hubs por cidade? 
 SELECT count(hub_name) Hubs, hub_city City FROM hubs 
 GROUP BY City; 
 -- 2- Qual o número de pedidos (orders) por status? 
 SELECT count(order_id) Amount, order_status 'Status' FROM orders 
 GROUP BY order_status; 
  
 -- 3- Qual o número de lojas (stores) por cidade dos hubs? 
  
 SELECT * FROM stores 
 LIMIT 10; 
  
 SELECT count(store_id) Amount, h.hub_city City FROM stores s 
 INNER JOIN hubs h on h.hub_id = s.store_id 
 GROUP BY h.hub_city; 
  
  
 -- 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado? 
 SELECT MAX(payment_amount) maior, MIN(payment_amount) menor FROM payments

 -- 5- Qual tipo de driver (driver_type) fez o maior número de entregas? 
 SELECT driver_type "type", COUNT(delivery_id) deliveries FROM drivers d 
 INNER JOIN deliveries dl on d.driver_id = dl.driver_id 
 GROUP BY driver_type 
 ORDER BY deliveries;
  
 -- 6- Qual a distância média das entregas por tipo de driver (driver_modal)? 

 SELECT * FROM DRIVERS; 
 SELECT * FROM DELIVERIES; 
  
 SELECT AVG(delivery_distance_meters) Distance, driver_modal `type` FROM drivers dr 
 INNER JOIN deliveries dl on dl.driver_id = dr.driver_id 
 GROUP BY `type`; 
  
 -- 7- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente? 
 SELECT * FROM orders; 
 SELECT * FROM stores; 
  
 SELECT store_name Store, AVG(order_amount) amount FROM stores s 
 INNER JOIN orders o on s.store_id = o.store_id 
 GROUP BY s.store_id 
 ORDER BY amount desc; 
  
 -- 8- Existem pedidos que não estão associados a lojas? Se caso positivo, quantos? 
 SELECT * FROM orders 
 WHERE store_id = null or store_id = 0; 
  
 -- 9- Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'? 
 SELECT * FROM channels; 
 SELECT * FROM orders; 
  
 SELECT SUM(order_amount) amount, channel_name `Name` FROM orders o 
 INNER JOIN channels c on c.channel_id = o.channel_id 
 WHERE o.channel_id = 5; 
  
 -- 10- Quantos pagamentos foram cancelados (chargeback)? 
 SELECT count(order_id) amount FROM orders 
 WHERE order_status like "Canceled"; 
  
 -- 11 - Qual foi o valor médio dos pagamentos cancelados (chargeback)? 

 SELECT AVG(order_amount) average FROM orders 
 WHERE order_status like "Canceled"; 
  
 -- 12- Qual a média do valor de pagamento por método de pagamento (payment_method) em ordem decrescente? 
 SELECT * FROM payments; 
 SELECT * FROM orders; 
  
 SELECT payment_method method, AVG(order_amount) average FROM payments p 
 INNER JOIN orders o on o.payment_order_id = p.payment_id 
 GROUP BY method 
 ORDER BY average desc; 
  
 -- 13- Quais métodos de pagamento tiveram valor médio superior a 100? 


 SELECT payment_method method, AVG(order_amount) average FROM payments p 
 INNER JOIN orders o on o.payment_order_id = p.payment_id 
 GROUP BY method 
 HAVING average > 100; 
  
  
 /* 14- Qual a média de valor de pedido (order_amount) por 
  estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?*/ 


 SELECT * FROM hubs h; 
 SELECT * FROM orders; 
 SELECT * FROM stores; 
 SELECT * FROM channels; 
  
  -- Não consegui achar a solução 
  
 /* 15- Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo 
 de canal (channel_type) teve média de valor de pedido (order_amount) maior que 
 450?*/ 

 SELECT AVG(order_amount) average, hub_state estado_hub, store_segment segmento, channel_type `tipo_canal` FROM orders o 
  
 INNER JOIN stores s on s.store_id = o.store_id 
  
 INNER JOIN hubs h on  h.hub_id = s.hub_id 
  
 INNER JOIN channels c on c.channel_id = o.channel_id 
  
 HAVING average > 450;
