# DECISION LOG — ĐỒ ÁN 17 (HOTEL BOOKING)

| STT | Tên quyết định | Cách xử lý | Lý do kỹ thuật / Nghiệp vụ | Ảnh hưởng con số |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Lượt đặt 0 người | Xóa dòng | Lỗi nhập liệu, khách sạn không thể có đơn 0 khách. | Xóa 180 dòng |
| 2 | Biến ADR bất thường | Xóa `adr < 0` & `adr >= 5000` | ADR < 0 là lỗi hệ thống; ADR = 5400 làm méo phân phối. | Xóa 2 dòng |
| 3 | Ô trống `agent`/`company` | Điền `0` | Không qua đại lý/công ty đại diện. | Giữ nguyên 100% dòng |
| 4 | Rò rỉ nhãn | Loại bỏ `reservation_status` & `reservation_status_date` | Dữ liệu chỉ xuất hiện sau khi giao dịch hoàn tất. | Giảm từ 32 xuống 30 cột |
| 5 | Dòng trùng lặp (Duplicates) | Chủ động giữ lại trong dữ liệu chính, có kiểm chứng mô hình | Khách đoàn/đại lý đặt nhiều phòng cùng lúc. Thực nghiệm so sánh: Khi GIỮ đạt ROC-AUC 0.9591, khi XÓA đạt 0.9053 (chênh lệch 5.38%). | Giữ 32,238 dòng trùng để phản ánh đúng thực tế vận hành | 
| 6 | Đạo đức AI (Biến country) | Đề xuất triển khai phiên bản loại bỏ biến quốc gia | Tránh phân biệt đối xử khi yêu cầu tiền cọc. Đánh giá: Bỏ biến chỉ làm giảm 2.07% ROC-AUC (0.9591 -> 0.9384), đổi lại bảo vệ uy tín thương hiệu. | Giảm 2.07% ROC-AUC để bảo đảm công bằng |