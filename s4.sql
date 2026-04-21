SELECT 
    hotel_id
FROM 
    Bookings
WHERE 
    status = 'COMPLETED'
GROUP BY 
    hotel_id
HAVING 
    COUNT(order_id) >= 50 
    AND AVG(total_price) > 3000000;
    
-- Tại sao đây là giải pháp tốt nhất?
-- WHERE status = 'COMPLETED': Loại bỏ hàng triệu dòng dữ liệu thừa ngay lập tức. Chỉ những dòng có giá trị thực mới đi tiếp vào vòng sau.
-- GROUP BY hotel_id: Gom nhóm các đơn hàng theo từng khách sạn một cách gọn gàng.
-- HAVING: Chỉ thực hiện kiểm tra các điều kiện về "số lượng" và "trung bình" trên tập dữ liệu đã được thu hẹp.