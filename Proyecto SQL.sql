-- PROYECTO 4: SQL 

-- 1. 
SELECT flight_id, flight_no, status FROM flights WHERE status = 'On Time';

-- 2. 
SELECT * FROM bookings WHERE total_amount > 1000000;

-- 3. 
SELECT * FROM aircrafts_data;

-- 4. 
SELECT DISTINCT f.flight_id, f.flight_no FROM flights f 
JOIN aircrafts_data a ON f.aircraft_code = a.aircraft_code 
WHERE a.aircraft_code = '733';

-- 5. 
SELECT t.* FROM tickets t WHERE passenger_name LIKE '%IRINA%';

-- 6. 
SELECT city, COUNT(*) AS num_airports FROM airports 
GROUP BY city HAVING COUNT(*) > 1;

-- 7. 
SELECT a.model->>'en' AS aircraft_model, COUNT(f.flight_id) AS num_flights 
FROM aircrafts_data a LEFT JOIN flights f ON a.aircraft_code = f.aircraft_code 
GROUP BY a.model, a.aircraft_code ORDER BY num_flights DESC;

-- 8. 
SELECT b.book_ref, COUNT(t.ticket_no) AS num_tickets, b.total_amount 
FROM bookings b JOIN tickets t ON b.book_ref = t.book_ref 
GROUP BY b.book_ref, b.total_amount HAVING COUNT(t.ticket_no) > 1 
ORDER BY num_tickets DESC;

-- 9. 
SELECT flight_id, flight_no, scheduled_departure, actual_departure, 
(actual_departure - scheduled_departure) AS delay_time 
FROM flights WHERE actual_departure IS NOT NULL 
AND (actual_departure - scheduled_departure) > INTERVAL '1 hour' 
ORDER BY delay_time DESC;