-- giải pháp 1
SELECT order_id, status, reason, created_at
FROM Orders
WHERE reason = 'KHACH_HUY' 
   OR reason = 'QUAN_DONG_CUA' 
   OR reason = 'KHONG_CO_TAI_XE' 
   OR reason = 'BOM_HANG';
   
   -- giải pháp 2 toán tử in
SELECT order_id, status, reason, created_at
FROM Orders
WHERE reason IN ('KHACH_HUY', 'QUAN_DONG_CUA', 'KHONG_CO_TAI_XE', 'BOM_HANG');
   
-- . Xử lý bẫy dữ liệu & Chốt mã nguồn
-- Xử lý bẫy: Mảng rỗng ([])
-- Nếu hệ thống mạng chập chờn gửi về một mảng rỗng, câu lệnh SQL sẽ bị lỗi cú pháp: IN (). Để chặn lỗi này, bạn cần xử lý tại tầng Backend bằng kỹ thuật Guard Clause.
-- Logic xử lý tại Backend:
-- Nhận danh sách reasonList từ Client.
-- Kiểm tra: Nếu reasonList rỗng hoặc null:
-- Trả về ngay kết quả rỗng cho Client mà không cần gọi Database (tiết kiệm tài nguyên).
-- Nếu có dữ liệu: Mới bắt đầu lắp vào câu truy vấn SQL.
-- Chốt mã nguồn (Giải pháp tốt nhất)
-- Em chọn Giải pháp 2 vì tính tối ưu và dễ bảo trì.