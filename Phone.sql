create database Phone
go
use Phone
go
CREATE TABLE VaiTro (
    MaVaiTro INT PRIMARY KEY IDENTITY(1,1),
    TenVaiTro NVARCHAR(50) NOT NULL
);

INSERT INTO VaiTro (TenVaiTro)
VALUES 
    (N'Admin'),
    (N'User');

CREATE TABLE NguoiDung (
    MaNguoiDung INT PRIMARY KEY IDENTITY(1,1),
    TaiKhoan NVARCHAR(50) NOT NULL,
    MatKhau NVARCHAR(256) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    MaVaiTro INT,
    FOREIGN KEY (MaVaiTro) REFERENCES VaiTro(MaVaiTro)
);

INSERT INTO NguoiDung (TaiKhoan, MatKhau, Email, MaVaiTro)
VALUES 
    (N'Hana', N'7921237aeb8e5b438afc27c0f7b1f8e217bb72850e587092d36daf2ba82b8d44', N'songuku61@gmail.com', 4),
    (N'Admin', N'c1e6784a48a98392db9e41bb02394fda9dcfbe4db7b9d7b170979c195aa2bbaf', N'Admindepzai@gmail.com', 3);

CREATE TABLE NhaSanXuat (
    MaNhaSanXuat INT PRIMARY KEY IDENTITY(1,1),
    TenNhaSanXuat NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(20),
    Email NVARCHAR(100)
);

INSERT INTO NhaSanXuat (TenNhaSanXuat, DiaChi, SoDienThoai, Email)
VALUES 
    (N'Samsung Electronics', N'129 Samsung-ro, Yeongtong-gu, Suwon-si', N'082222550114', N'contact@samsung.com'),
    (N'Apple Inc', N'One Apple Park Way, Cupertino, California', N'014089961010', N'contactus@apple.com'),
    (N'OPPO Electronics Corp', N'18 Haibin Road, Wusha, Chang''an, Dongguan', N'0864001666888', N'service@oppo.com'),
    (N'ASUSTeK Computer', N'No. 15, Li-Te Road, Beitou District, Taipei', N'0886228943447', N'info@asus.com'),
    (N'Xiaomi Corporation', N'Xiaomi Campus, No. 68, Qinghe Middle Street', N'0864001005678', N'service.global@xiaomi.com');

CREATE TABLE LoaiSanPham (
    MaLoaiSanPham INT PRIMARY KEY IDENTITY(1,1),
    TenLoaiSanPham NVARCHAR(100) NOT NULL
);

INSERT INTO LoaiSanPham (TenLoaiSanPham)
VALUES 
    (N'Samsung'),
    (N'Apple'),
    (N'OPPO'),
    (N'Xiaomi'),
    (N'ASUS');

CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY IDENTITY(1,1),
    TenSanPham NVARCHAR(MAX) NOT NULL,
    Anh NVARCHAR(255),
	Gia DECIMAL(18, 2) NOT NULL,
    TonKho INT NOT NULL,
	MoTa NVARCHAR(MAX),
    MaLoaiSanPham INT,
	MaNhaSanXuat INT,
    FOREIGN KEY (MaNhaSanXuat) REFERENCES NhaSanXuat(MaNhaSanXuat),
    FOREIGN KEY (MaLoaiSanPham) REFERENCES LoaiSanPham(MaLoaiSanPham)
);

INSERT INTO SanPham (TenSanPham, Anh, Gia, TonKho, MoTa, MaLoaiSanPham, MaNhaSanXuat)
VALUES 
(N'Samsung Galaxy Z Fold6', 'image1.jpg', 41990000.00, 990, N'Đặc điểm nổi bật của Samsung Galaxy Z Fold6:
Màn hình chính Dynamic AMOLED 2X 7.6 inch cho trải nghiệm giải trí, làm việc đỉnh cao.
Chip Snapdragon 8 Gen 3 cho tốc độ xử lý siêu nhanh, đáp ứng tốt mọi nhu cầu sử dụng.
Camera chính 50.0 MP ghi lại những khoảnh khắc đẹp với độ chi tiết, màu sắc ấn tượng.
Pin 4400mAh cho phép bạn sử dụng điện thoại cả ngày dài mà không cần lo lắng về việc hết pin.
Samsung Z Fold 6 là siêu phẩm điện thoại gập được ra mắt ngày 10/7, hiệu năng dẫn đầu phân khúc với chip 8 nhân Snapdragon 8 Gen 3 for Galaxy, 12GB RAM cùng bộ nhớ trong từ 256GB đến 1TB. Thay đổi mạnh mẽ về hiệu năng và thiết kế, Galaxy Z Fold 6 hứa hẹn sẽ là chiếc smartphone AI đáng sở hữu nhất nửa cuối năm 2024. Cùng CellphoneS cập nhật tất tần tật thông tin về Galaxy Z Fold6 ngay đây nhé!', 6, 6),
(N'iPhone 15 128GB | Chính hãng VN/A', 'image4.jpg', 19690000.00, 1488, N'Đặc điểm nổi bật của iPhone 15 128GB | Chính hãng VN/A:
Thiết kế thời thượng và bền bỉ - Mặt lưng kính được pha màu xu hướng cùng khung viền nhôm bền bỉ
Dynamic Island hiển thị linh động mọi thông báo ngay lập tức giúp bạn nắm bắt mọi thông tin
Chụp ảnh đẹp nức lòng - Camera chính 48MP, Độ phân giải lên đến 4x và Tele 2x chụp chân dung hoàn hảo
Pin dùng cả ngày không lắng lo - Thời gian xem video lên đến 20 giờ và sạc nhanh qua cổng USB-C tiện lợi
Cải tiến hiệu năng vượt bậc - A16 Bionic mạnh mẽ giúp bạn cân mọi tác vụ dù có yêu cầu đồ hoạ cao
iPhone 15 128GB được trang bị màn hình Dynamic Island kích thước 6.1 inch với công nghệ hiển thị Super Retina XDR màn lại trải nghiệm hình ảnh vượt trội. Điện thoại với mặt lưng kính nhám chống bám mồ hôi cùng 5 phiên bản màu sắc lựa chọn: Hồng, Vàng, Xanh lá, Xanh dương và đen. Camera trên iPhone 15 series cũng được nâng cấp lên cảm biến 48MP cùng tính năng chụp zoom quang học tới 2x. Cùng với thiết kế cổng sạc thay đổi từ lightning sang USB-C vô cùng ấn tượng.', 7, 7),
(N'ASUS ROG Phone 6 Batman 12GB 256GB', 'image13.jpg', 14990000.00, 1988, N'Đặc điểm nổi bật của ASUS ROG Phone 6 Batman 12GB 256GB:
Thiết kế cực ngầu, đậm chất bí ẩn - Ngoại hình độc đáo với k hung viền bằng kim loại, màu sắc ma mị
Cấu hình mạnh mẽ chiến mọi tựa game - Snapdragon 8+ Gen 1 cùng RAM 12GB
Không lo gián đoạn với viên pin lớn 6.000 mAh đi kèm sạc nhanh Quick Charge 5.0 65W
Hệ điều hành tuỳ biến theo giao diện người hùng Batman - Tha hồ lựa chọn hình nền động và hiệu ứng âm thanh người hùng', 9, 10),
(N'OPPO A3 (6GB 128GB)', 'image7.jpg', 4990000.00, 1488, N'Đặc điểm nổi bật của OPPO A3 (6GB 128GB):
Màn hình LCD, 6.67 inch cho phép bạn xem nội dung với độ chi tiết cao và màu sắc rực rỡ.
Chip Snapdragon 6s 4G Gen 1 mang đến hiệu năng mượt mà, xử lý các tác vụ hàng ngày một cách nhanh chóng.
Camera sau 50MP cho phép bạn chụp ảnh chất lượng cao, với độ chi tiết cao và màu sắc rực rỡ. 
Pin dung lượng lớn 5100mAh cho phép bạn sử dụng điện thoại cả ngày dài mà không cần lo lắng về việc hết pin.
Điện thoại OPPO A3 xử lý ổn định và mượt mà mọi tác vụ nhờ bộ vi xử lý 8 nhân Qualcomm Snapdragon 6s 4G Gen1, kết hợp với đó là 6GB RAM và 128GB bộ nhớ trong. Mẫu máy hiển thị tốt với màn hình LCD độ phân giải 1604 × 720 pixel (HD+) kích thước 6.67 inch với độ sáng khá cao lên đến 1000 nit. Bên cạnh đó, sản phẩm OPPO A Series còn trang bị camera chính với độ phân giải 50MP kèm dung lượng pin 5.100mAh. ', 8, 8),
(N'Xiaomi Redmi 14C', 'image10.jpg', 3290000.00, 498, N'Đặc điểm nổi bật của Xiaomi Redmi 14C:
Màn hình 6,88 inch, lớn nhất trên dòng Redmi cho đến nay, mang đến không gian xem rộng rãi và phong phú .
Viên pin lớn 5160mAh, giúp người dùng yên tâm duy trì kết nối mà không cần phải sạc lại thường xuyên.
Redmi 14C được trang bị bộ vi xử lý 8 nhân MediaTek Helio G81- Ultra, mang lại hiệu năng mượt mà và hiệu quả.
Điện thoại được trang bị hệ thống camera kép AI 50MP mạnh mẽ để dễ dàng ghi lại những khoảnh khắc đáng nhớ.
Điện thoại Xiaomi Redmi 14C sở hữu vi xử lý MediaTek Helio G81-Ultra, cung cấp hiệu năng mạnh mẽ, giúp xử lý mượt mà các tác vụ hàng ngày và chơi game ổn định. Với màn hình 6.88 inch độ phân giải Full HD+, Redmi 14C mang lại trải nghiệm hình ảnh rõ nét và sống động hàng đầu cho người sử dụng. Đặc biệt, máy còn sở hữu dung lượng pin lớn 5160mAh đảm bảo thời gian sử dụng dài lâu, kết hợp với khả năng sạc nhanh cải thiện, đem lại sự tiện lợi và liền mạch trong suốt quá trình sử dụng.', 10, 9),
(N'Xiaomi POCO X6 Pro 5G 8GB 256GB', 'image17.jpg', 8490000.00, 1195, N'Đặc điểm nổi bật của Xiaomi POCO X6 Pro 5G 8GB 256GB:
Màn hình sống động, tần số 120Hz - Đem đến chất lượng hình ảnh sắc nét, màu sắc sống động.
Hiệu năng đỉnh cao với chip Dimensity 8300 Ultra - Chiến được hầu hết các tựa game mobile phổ biến.
Bộ 3 camera chất lượng, quay chụp sắc nét - Đem đến cho bạn những bức hình chân dung chất lượng cao.
Trang bị pin 5000mAh đi cùng sạc nhanh 67 W giúp bạn thoải mái sử dụng điện thoại suốt cả ngày dài.
Điện thoại Xiaomi Poco X6 Pro được trang bị con chip Dimensity 8300 Ultra 8 nhân, tiến trình 4nm, tích hợp với GPU Mali-G615 cùng RAM 8GB, bộ nhớ trong 256GB. Máy sở hữu 3 camera sau với camera chính 64MP và 1 camera selfie 16MP. Ngoài ra máy X6 Pro được trang bị màn hình AMOLED 6.67 inch, độ phân giải 1220 x 2712 pixels cùng tần số quét 120Hz.', 10, 9),
(N'Samsung Galaxy A05S 4GB 128GB', 'image18.jpg', 3390000.00, 797, N'Đặc điểm nổi bật của Samsung Galaxy A05S 4GB 128GB
Hiển thị sống động từng thước phim - Màn hình lớn 6.7" IPS hiển thị sắc nét
Vận hành tác vụ mượt mà như mong đợi - Xử lí tốt hơn với chip Snapdragon 680 và RAM 4GB
Sử dụng thoải mái cả ngày dài - Pin lớn 5000mAh và hỗ trợ sạc nhanh 25W
Ghi lại trọn vẹn mọi khoảnh khắc - Camera sau đến 50MP đi kèm nhiều chế độ chụp và tính năng cải tiến
Samsung Galaxy A05s được trang bị con chip Qualcomm Snapdragon 680 cùng với đó là dung lượng pin lớn 5000mAh, công nghệ sạc nhanh 25W và màn hình 6.7 inch chất lượng. Đặc biệt, hãng còn nâng cấp cả camera sau lên tới 50MP và camera selfie 13MP để mang tới cho người dùng trải nghiệm trọn vẹn nhất. Hứa hẹn đây sẽ là mẫu smartphone trong tầm giá giúp người dùng thoải mái khám phá thế giới đầy sắc màu.', 6, 6),
(N'ASUS ROG Phone 6 Diablo 16GB 512GB', 'image19.jpg', 17990000.00, 1533, N'Đặc điểm nổi bật của ASUS ROG Phone 6 Diablo 16GB 512GB:
Màn hình 6.78 inch tuyệt sắc và mãn nhãn - Đem lại khả năng tái hiện màu sắc rực rỡ với sắc đen sâu và tiết kiệm năng lượng.
Cấu hình mạnh mẽ, chiến mọi game bạn thích khi sở hữu chip Snapdragon 8+ Gen 1 cực mạnh, đi kèm 16GB RAM và bộ nhớ trong 512GB.
Thiết kế siêu “ngầu”, mạnh mẽ và đầy cảm hứng có hệ thống LED chạy quanh thân máy.
Quay chụp xuất sắc với bộ ba camera 50MP - Bắt trọn mọi nội dung trong khung hình.
Asus ROG Phone 6 Diablo – Giải trí cực mượt, chiến game cực đã
Asus ROG Phone 6 Diablo sở hữu thiết kế đầy sáng tạo với hiệu suất hoạt động vượt ngoài mong đợi. Đây được xem là chiếc điện thoại Asus thích hợp cho người dùng có nhu cầu sử dụng những phần mềm đồ họa cao hay chơi những tựa game nặng.', 9, 10),
(N'iPhone 14 Pro Max 128GB | Chính hãng VN/A', 'image5.jpg', 25590000.00, 1100, N'Đặc điểm nổi bật của iPhone 14 Pro Max 128GB | Chính hãng VN/A:
Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6,7 inch, hỗ trợ always-on display
Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic
Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động
Pin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến
iPhone 14 Pro Max sở hữu thiết kế màn hình Dynamic Island ấn tượng cùng màn hình OLED 6,7 inch hỗ trợ always-on display và hiệu năng vượt trội với chip A16 Bionic. Bên cạnh đó máy còn sở hữu nhiều nâng cấp về camera với cụm camera sau 48MP, camera trước 12MP dùng bộ nhớ RAM 6GB đa nhiệm vượt trội. Cùng phân tích chi tiết thông số siêu phẩm này ngay sau đây.', 7, 7),
(N'Xiaomi 14T', 'image20.jpg', 13990000.00, 1700, N'Đặc điểm nổi bật của Xiaomi 14T:
Hiệu năng mạnh mẽ với chip MediaTek Dimensity 8300-Ultra - Mang lại hiệu năng tốt cho các tác vụ hàng ngày, từ lướt web, xem video đến chơi game với độ ổn định cao.
Thấu kính quang học Leica Summilux - Ghi lại những bức ảnh chi tiết, sắc nét phù hợp với nhu cầu nhiếp ảnh di động và quay phim chất lượng cao.
Màn hình 144Hz AMOLED cho màu sắc sống động, độ sáng cao và khả năng tái hiện hình ảnh chân thực, mang lại trải nghiệm xem phim, chơi game tuyệt vời.
Xiaomi 14T trang bị pin lớn 5.000mAh, kết hợp với công nghệ sạc nhanh 67W - Sạc đầy nhanh chóng và duy trì thời gian sử dụng suốt cả ngày.
Xiaomi 14T 5G ra mắt trong tháng 10 đã là dấu mốc đánh dấu thành công sự hợp tác của Xiaomi cùng Leica - thương hiệu máy ảnh nổi tiếng của Đức. Trong đó, dòng điện thoại mới  này còn mang nhiều ưu điểm vượt trội như giá rẻ hơn, trang bị thêm nhiều tính năng AI, chips mạnh hơn và cải tiến nhiều so với thế hệ tiền nhiệm. Cùng khám phá chi tiết ngay nhé!', 10, 9),
(N'OPPO Find X5 Pro 12GB 256GB', 'image21.jpg', 15990000.00, 1899, N'Đặc điểm nổi bật của OPPO Find X5 Pro 12GB 256GB:
Chip Snapdragon 8 Gen 1 cho hiệu suất mạnh mẽ, cân mọi tác vụ từ giải trí đến làm việc
Màn hình AMOLED 120 Hz mang đến cho bạn trải nghiệm mượt mà, màu sắc sống động
Dùng thoải mái cả ngày với dung lượng pin 5.000 mAh, tích hợp sạc nhanh 80W hiện đại
RAM 12GB đảm bảo khả năng xử lý đa nhiệm không giật lag, ROM 256GB giúp lưu trữ tốt
OPPO Find X5 Pro sở hữu thiết kế tinh tế, đẳng cấp với mặt sau chất liệu gốm, thêm vào đó là camera Hasseblad cùng màn hình 1 tỷ màu Bionic và hiệu năng vượt trội từ chip Snapdragon 8 Gen 1. Hệ thống camera đột phá với 3 camera sau và camera selfie chất lượng cao cho những bức ảnh ấn tượng, đặc biệt là khả năng quay đếm 4K.', 8, 8),
(N'ASUS ROG Phone 6 Mediatek', 'image22.jpg', 30000000.00, 399, N'Đặc điểm nổi bật của ASUS ROG Phone 6 Mediatek:
Hiệu năng dẫn đầu mọi trận đấu - Chip MediaTek Dimensity 7000 mạnh mẽ cùng RAM 12GB
Chất lượng hiển thị đúng chuẩn gaming - Màn hình 6.78 inches, FullHD+, HDR10+ cùng tần số quét 165Hz
Thiết kế thân thiện cho chơi game, mặt lưng ánh sáng Aura RGB độc đáo
Bùng nổ năng lượng cho ngày dài ấn tượng - Viên pin 6000 mAh, sạc nhanh siêu tốc 65W', 9, 10),
(N'Samsung Galaxy M55 (12GB 256GB)', 'image23.jpg', 10190000.00, 900, N'Đặc điểm nổi bật của Samsung Galaxy M55 (12GB 256GB):
Trải nghiệm hình ảnh sống động và sắc nét với màn hình AMOLED 6.7 inch, độ phân giải Super AMOLED+.
Ghi lại những bức ảnh tuyệt đẹp với camera chính 50MP, khẩu độ f/1.8, cùng nhiều tính năng chụp ảnh thông minh.
Qualcomm Snapdragon 7 Gen 1 nhân kết hợp với RAM 12GB mang đến hiệu suất mạnh mẽ cho mọi tác vụ, từ chơi game đến chỉnh sửa video.
Pin khủng 5000mAh - Sử dụng điện thoại cả ngày dài mà không lo hết pin nhờ viên pin.
Samsung M55 là sản phẩm mới thuộc dòng Galaxy M, với màn hình 6.7 inch Super AMOLED Plus cung cấp khả năng hiển thị Full HD+ siêu thực cùng tần số quét lên đến 120Hz. Kèm theo đó là các thông số cấu hình đỉnh cao tới từ chipset Qualcomm Snapdragon 7 Gen 1, bộ nhớ trong 256GB cùng RAM 12GB, đảm bảo tốc độ xử lý, đa nhiệm và lưu trữ ấn tượng. Ngoài ra Galaxy M55 còn sở hữu viên pin dung lượng 5000mAh, hỗ trợ trải nghiệm dài lâu chỉ sau 1 lần nạp pin.', 6, 6),
(N'OPPO Reno12 F 5G (8GB 256GB)', 'image11.jpg', 9190000.00, 2100, N'Đặc điểm nổi bật của OPPO Reno12 F 5G (8GB 256GB):
Màn hình rộng với độ phân giải Full HD+ cho hình ảnh sắc nét, màu sắc rực rỡ và độ tương phản cao, mang đến trải nghiệm xem phim, chơi game và đọc sách tuyệt vời.
Thiết kế mỏng nhẹ dễ dàng mang theo bên mình, đồng thời vẫn đảm bảo độ bền bỉ và chắc chắn.
Hỗ trợ sạc nhanh 45W - Sạc nhanh chóng và hiệu quả, giúp bạn tiết kiệm thời gian.
Hệ điều hành mới nhất mang đến nhiều tính năng mới và cải tiến.
Điện thoại OPPO Reno12 F 5G có dung lượng lưu trữ 8GB+256GB kết hợp chipset MediaTek D6300 đem đến sự ổn định để xử lý các tác vụ khác nhau. Với camera sau độ phân giải cao lên đến 50 MP và camera selfie 32MP, giúp đem đến hình ảnh sắc nét khi chụp và quay video. Dung lượng pin của điện thoại lớn 5.000 mAh sẽ cho phép đáp ứng các nhu cầu cá nhân như chơi game hay lướt web cả ngày. Bên cạnh đó, màn hình của điện thoại 6.67 inch, với độ làm mới 120 Hz, không lo bị giật lag khi sử dụng.', 8, 8),
(N'iPhone 13 256GB | Chính hãng VN/A', 'image24.jpg', 17590000.00, 1950, N'Đặc điểm nổi bật của iPhone 13 256GB | Chính hãng VN/A:
Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút
iPhone 13 256GB được đánh giá là dòng iPhone mang một thiết kế ấn tượng, gợi lên nét đẹp sang trọng, ấn tượng cùng khả năng xử lý đồ họa vượt trội, trở thành phiên bản cuốn hút, tạo điểm nhất độc đáo cho người dùng', 7, 7),
(N'Xiaomi Mi 11 Lite 5G', 'image25.jpg', 10490000.00, 850, N'Đặc điểm nổi bật của Xiaomi Mi 11 Lite 5G:
Không gian hiển thị thoải mái, chuyển động mượt - Màn hình tràn viền 6,55 inch, tần số quét 90Hz, HDR10+
Hiệu năng mạnh mẽ, ổn định - Chip Snapdragon 780G trên 5nm, 128GB bộ nhớ và 8GB RAM
Camera chụp ảnh ấn tượng - Cụm 3 camera sau 64MP, chụp đêm rõ nét
Sạc nhanh, trải nghiệm suốt ngày dài - Dung lượng pin 4250 mAh và hỗ trợ sạc nhanh 33W', 10, 9);

CREATE TABLE DonHang (
    MaDonHang INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT,
    NgayMuaHang DATETIME DEFAULT GETDATE(),
    TrangThaiDonHang NVARCHAR(255) NOT NULL,
    TongTien DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);

ALTER TABLE DonHang
ADD 
    DiaChiGiaoHang NVARCHAR(255) NULL,    
    SoDienThoai NVARCHAR(15) NULL,        
    TenNguoiNhan NVARCHAR(100) NULL;

CREATE TABLE ChiTietDonHang (
    MaChiTietDonHang INT PRIMARY KEY IDENTITY(1,1),
    MaDonHang INT NOT NULL,
    MaSanPham INT NOT NULL,
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    DonGia DECIMAL(18,2) NOT NULL,
	TongGia AS (SoLuong * DonGia),
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE GioHang (
    MaGioHang INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT NOT NULL,
    MaSanPham INT NOT NULL,
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE PhuongThucThanhToan (
    MaPhuongThucThanhToan INT PRIMARY KEY IDENTITY(1,1),
    TenPhuongThucThanhToan NVARCHAR(255) NOT NULL
);

INSERT INTO PhuongThucThanhToan (TenPhuongThucThanhToan)
VALUES 
    (N'Ví điện tử Momo'),
    (N'VNPay');

CREATE TABLE TrangThaiThanhToan (
    MaTrangThaiThanhToan INT PRIMARY KEY IDENTITY(1,1),
    TenTrangThai NVARCHAR(255) NOT NULL
);

INSERT INTO TrangThaiThanhToan (TenTrangThai)
VALUES 
    (N'Đã Thanh Toán'),
    (N'Chờ Xử Lý'),
    (N'Thất Bại');

CREATE TABLE ThanhToan (
    MaThanhToan INT PRIMARY KEY IDENTITY(1,1),
    MaDonHang INT NOT NULL,
    MaNguoiDung INT NOT NULL,
    SoLuongMua DECIMAL(18,2) NOT NULL,
    NgayThanhToan DATE DEFAULT GETDATE(),
    MaTrangThaiThanhToan INT NOT NULL,
    MaPhuongThucThanhToan INT NOT NULL,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung),
    FOREIGN KEY (MaTrangThaiThanhToan) REFERENCES TrangThaiThanhToan(MaTrangThaiThanhToan),
    FOREIGN KEY (MaPhuongThucThanhToan) REFERENCES PhuongThucThanhToan(MaPhuongThucThanhToan)
);

CREATE TABLE LichSuMuaHang (
    MaLichSuMuaHang INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT NOT NULL, 
    MaDonHang INT NOT NULL, 
    NgayMua DATE NOT NULL, 
    TongTien DECIMAL(18,2) NOT NULL, 
    TrangThai NVARCHAR(255) NOT NULL,
	MaPhuongThucThanhToan INT NOT NULL,
    MaThanhToan INT,
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung),
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
	FOREIGN KEY (MaPhuongThucThanhToan) REFERENCES PhuongThucThanhToan(MaPhuongThucThanhToan),
	FOREIGN KEY (MaThanhToan) REFERENCES ThanhToan(MaThanhToan)
);
DROP TABLE IF EXISTS LichSuMuaHang;



CREATE PROCEDURE sp_ThongKeDoanhThu
    @NgayBatDau DATETIME,
    @NgayKetThuc DATETIME
AS
BEGIN
    -- Truy vấn dữ liệu từ bảng ThongKeDoanhThu trong khoảng thời gian xác định
    IF EXISTS (
        SELECT 1
        FROM ThongKeDoanhThu
        WHERE NgayThongKe BETWEEN @NgayBatDau AND @NgayKetThuc
        AND TongDonHang > 0  -- Kiểm tra nếu có đơn hàng trong ngày
    )
    BEGIN
        -- Nếu có đơn hàng, trả về thống kê
        SELECT
            MaThongKe,
            NgayThongKe,
            NgayKetThucTK,
            TongDonHang,
            TongDoanhThu
        FROM ThongKeDoanhThu
        WHERE NgayThongKe BETWEEN @NgayBatDau AND @NgayKetThuc
        AND TongDonHang > 0  -- Chỉ lấy các ngày có đơn hàng
    END
    ELSE
    BEGIN
        -- Nếu không có đơn hàng, không trả về kết quả gì
        PRINT 'Không có đơn hàng trong khoảng thời gian này.'
    END
END