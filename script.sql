USE [PRJ301_SE1625]
GO
/****** Object:  Table [dbo].[Categories_HE161579]    Script Date: 7/20/2022 8:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_HE161579](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Categories_HE161579] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail_HE161579]    Script Date: 7/20/2022 8:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail_HE161579](
	[ID] [int] NOT NULL,
	[TransactionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[Quantity] [int] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_OrderDetail_HE161579] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_HE161579]    Script Date: 7/20/2022 8:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_HE161579](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Brand] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[OldPrice] [float] NULL,
	[Image] [varchar](100) NULL,
	[color] [nvarchar](50) NULL,
	[size] [varchar](50) NULL,
 CONSTRAINT [PK_Product_HE161579] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_HE161579]    Script Date: 7/20/2022 8:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_HE161579](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Role_HE161579] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_HE161579]    Script Date: 7/20/2022 8:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_HE161579](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Total] [float] NOT NULL,
	[Note] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](15) NULL,
	[UserID] [int] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Transaction_HE161579] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_HE161579]    Script Date: 7/20/2022 8:42:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_HE161579](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Status] [bit] NULL,
	[RoleID] [int] NULL,
	[Code] [char](10) NULL,
 CONSTRAINT [PK_User_HE161579] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories_HE161579] ON 

INSERT [dbo].[Categories_HE161579] ([ID], [Name]) VALUES (1, N'Laptop')
INSERT [dbo].[Categories_HE161579] ([ID], [Name]) VALUES (2, N'SmartPhone')
INSERT [dbo].[Categories_HE161579] ([ID], [Name]) VALUES (3, N'Accessories')
SET IDENTITY_INSERT [dbo].[Categories_HE161579] OFF
GO
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (1, 13, 49, N'Apple Macbook Pro 13 M2 2022 8GB 256GB', 1, 1412.3599853515625)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (2, 14, 28, N'Laptop Asus Zenbook UX425EA-KI839W', 1, 846.52001953125)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (3, 14, 12, N'Macbook Pro 16 inch 2022', 3, 9285.060546875)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (4, 14, 26, N'Laptop ASUS Gaming FX506LU-HN138T', 3, 3286.31982421875)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (5, 14, 49, N'Apple Macbook Pro 13 M2 2022 8GB 256GB', 1, 1412.3599853515625)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (6, 14, 24, N'Macbook Pro 16 inch 2021', 2, 5159.080078125)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (7, 14, 25, N'Macbook Air M2 2022 256GB', 2, 2836.639892578125)
INSERT [dbo].[OrderDetail_HE161579] ([ID], [TransactionID], [ProductID], [ProductName], [Quantity], [Total]) VALUES (8, 15, 49, N'Apple Macbook Pro 13 M2 2022 8GB 256GB', 1, 1412.3599853515625)
GO
SET IDENTITY_INSERT [dbo].[Product_HE161579] ON 

INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (3, N'Iphone 13 ProMax', 15, 1462.02, 2, N'Apple', N' iPhone 13 Pro Max thực sự là một chiếc điện thoại thông minh tốt và là bản nâng cấp đáng giá trong khoảng vài năm trở lại đây. Mẫu máy này sở hữu màn hình tuyệt vời, camera chụp hình tốt, hiệu năng tổng thể mạnh mẽ và thời lượng sử dụng pin vượt trội', 1500, N'Iphone13Promax.png', N'Blue', N'6.7 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (4, N'Iphone 12 Mini', 20, 774.01, 2, N'Apple', N'iPhone 12 mini là phiên bản nhỏ nhất với thiết kế nhỏ gọn, sang trọng. Máy sở hữu màn hình 5,4 inch, công nghệ màn hình đem đến hình ảnh chi tiết, sắc nét. Máy cũng được trang bị cấu hình cao cấp với chip A14 Bionic, bộ đôi camera 12MP với nhiều chế độ chụp ảnh đẹp.', 0, N'Iphone12Mini.png', N'Green', N'5.4 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (6, N'Iphone 11 ProMax', 25, 903.01, 2, N'Apple', N'iPhone 11 Pro Max là thiết bị iPhone có dung lượng pin khủng nhất trong lịch sử iPhone của Apple. Viên pin của máy đã được đầu tư nhiều hơn với 3969 mAh. Điều này cùng với sự tối ưu về phần mềm hay màn hình cũng sẽ giúp cho thiết bị tiêu hao ít năng lượng hơn, thời gian sử dụng kéo dài hơn rất nhiều', 0, N'Iphone11Promax.png', N'Black', N'6.5 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (7, N'Iphone X', 50, 365.51, 2, N'Apple', N'Iphone X được định vị như một mô hình cao cấp, nhằm giới thiệu công nghệ tiên tiến: màn hình OLED, máy ảnh kép với cảm biến độ sâu được nâng cao và hệ thống nhận diện khuôn mặt được biết đến với cái tên Face ID', 0, N'IphoneX.png', N'White', N'5.8 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (8, N'Iphone XS Max', 70, 645.01, 2, N'Apple', N'Điện thoại iPhone Xs Max sở hữu lối thiết kế vô cùng đẹp mắt với những đường cong mềm mại được thừa hưởng từ chiếc iPhone đời trước đó. Tuy nhiên, iPhoneXS Max lại có một thân hình to bản ngang bằng với kích thước dòng Plus nhưng chứa đựng một màn hình rộng lớn lên đến 6.5 inch', 0, N'IphoneXsmax.png', N'Gold', N'6.5 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (9, N'Iphone 12 Pro Max', 40, 1118.02, 2, N'Apple', N'So với chiếc iPhone 11 Pro Max thì iPhone 12 Pro Max có màn hình nhỉnh hơn một chút. Theo đó, máy sở hữu màn hình rộng 6.7 inch, tăng 0.2 inch so với màn hình 6.5 inch trên iPhone 11 Pro Max. Ưu điểm nổi bật là thiết kế của máy vẫn giữ nguyên như vậy mà không lớn hơn nhờ Apple đã thu nhỏ viền bezels lại', 0, N'Iphone12Promax.png', N'White', N'6.7 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (11, N'Apple MacBook Air M1', 51, 971.2, 1, N'Apple', N'Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS
Đa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm
Trang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng
Chất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc
Thiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi', 0, N'AppleMacBookAirM1.png', N'White', N'13.3 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (12, N'Macbook Pro 16 inch 2022', 26, 3095.02, 1, N'Apple', N'MacBook M1 Pro sở hữu 10 nhân CPU (8 nhân hiệu suất cao + 2 nhân tiết kiệm điện) và 16 lõi GPU, băng thông bộ nhớ lên đến 200GB/s, tốc độ xử lý tăng đến 70% so với dòng chip M1 tiền nhiệm, chinh phục được mọi tác vụ, tạo nên vị thế dẫn đầu về hiệu năng so với các sản phẩm trong cùng phân khúc, hiệu quả đa nhiệm mượt mà, ấn tượng, xử lý đặc biệt cho các tác vụ chỉnh sửa video, hình ảnh chuyên nghiệp', 3200, N'MacbookPro162022.png', N'Gold', N'16 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (13, N'Samsung Galaxy Note 20 Ultra 5G', 36, 816.42, 2, N'SamSung', N'Sang trọng, cao cấp - Màu sắc độc đáo và cuốn hút
Chụp ảnh chuyên nghiệp - Bộ 3 camera hỗ trợ Zoom xa đến 30X
Ghi chú nhanh chóng, chính xác với bút S- Pen thế hệ mới
Chơi game đỉnh cao - Exynos 990 7nm mạnh mẽ, hiệu năng xử lý vượt trội', 1418.32, N'SamsungGalaxyNote20.png', N'Yellow coppe', N'6.9 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (15, N'Samsung Galaxy Z Fold3 5G 512GB', 42, 1461.31, 2, N'SamSung', N'Thiết kế độc đáo tiện lợi, khẳng định đẳng cấp - Thiết kế gập mở, chất liệu cao cấp, bản lề chắc chắn
Màn hình kép ấn tượng - Màn hình chính 7.9" và màn hình phụ: 6.23", 120Hz chuyển động mượt mà
Hệ thống camera siêu ấn tượng - Bộ 3 ống kính camera 12MP, camera selfie ẩn dưới màn hình
Hiệu năng ấn tượng, làm chủ tốc độ - Snapdragon 888 kết hợp RAM 12GB, hỗ trợ 5G', 1934.22, N'SamsungGalaxyZFold3.png', N'Black', N'7.9 inches and 6.23 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (21, N'Samsung Galaxy S22 Ultra (12GB - 256GB)', 19, 1246.35, 2, N'SamSung', N'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm)
Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh
S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác
Dung lượng pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W', 0, N'SamsungGalaxyS22Ultra.png', N'Red', N'6.8 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (22, N'Samsung Galaxy S21 FE 5G (6GB - 128GB)', 10, 485.38, 2, N'SamSung', N'Thiết kế cao cấp - Vẻ đẹp tinh tế cùng nhiều màu sắc thời thượng
Trọn vẹn từng khung hình - Màn hình 6.4"", độ sáng cao cùng tần số quét 120Hz
Sắc nét từng khung hình - Bộ ba camera 12MP, hỗ trợ quay video 4K, chống rung điện từ EIS
Mượt mà mọi tác vụ - Chip Exynos 2100 tiến trình 5nm mạnh mẽ', 0, N'SamsungGalaxyS21FE.png', N'Green', N'6.4 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (23, N'Samsung Galaxy S20+ (Plus)', 52, 663.02, 2, N'SamSung', N'Samsung Galaxy S20 Plus sở hữu thiết kế mặt trước tương tự các sản phẩm điện thoại Samsung Galaxy S20 Plus khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10. Phần lỗ camera này cũng được làm nhỏ hơn, kết hợp với phần viền siêu mỏng nên Samsung S20 Plus cho diện tích hiển thị gần như tuyệt đối. Giúp tăng không gian trải nghiệm cho người dùng.', 1031.39, N'SamsungGalaxyS20Plus.png', N'Black', N'6.7 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (24, N'Macbook Pro 16 inch 2021', 25, 2579.54, 1, N'Apple', N'Apple đang đưa người dùng đến với thế hệ MacBook mới của năm 2021, mà mở đầu là sản phẩm MacBook Pro 2021 phiên bản 16 inch. Trang bị vi xử lý Apple M1X cùng màn hình 16 inch mini LED đẹp mắt, MacBook Pro 16 inch 2021 sẽ hỗ trợ công việc với hiệu suất tối đa cho người dùng.', 2837.06, N'MacbookPro16inch2021.png', N'Grey', N'16 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (25, N'Macbook Air M2 2022 256GB', 8, 1418.32, 1, N'Apple', N'Trên Macbook Air 2022 này, Apple sẽ trang bị cho máy màn hình Liquid Retina kích thước 13.6 inch, hỗ trợ đến 1 tỷ màu. Bên cạnh đó là độ sáng 500 nits, dải màu rộng P3 cùng công nghệ True Tone.

Nhờ vậy mà hình ảnh hiển thị sống động, rực rỡ, độ tương phản phong phú, chi tiết sắc nét hơn rất nhiều. Đây được đánh giá là màn hình lớn và sáng nhất so với các thế hệ Macbook Air trước đây.', 0, N'MacbookAirM2.png', N'White', N'13 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (26, N'Laptop ASUS Gaming FX506LU-HN138T', 26, 1095.44, 1, N'Asus', N'Laptop gaming là một trong những dòng sản phẩm được thiết kế dành riêng cho các game thủ. Nếu bạn đang tìm kiếm một chiếc laptop gaming được thiết kế nhỏ gọn, phần cứng ấn tượng và vô cùng mạnh mẽ thì laptop ASUS TUF F15 FX506LU-HN138T sẽ là sản phẩm bạn không nên bỏ qua. Hãy cùng khám phá những điều đặc biệt bên trong mẫu laptop cực chất nhà Asus này nhé.', 0, N'LaptopASUSGaming.png', N'Grey', N'15.6 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (27, N'Laptop ASUS ZenBook UM5302TA-LX087W', 52, 1203.35, 1, N'Asus', N'Laptop Asus Zenbook S 13 Oled UM5302TA sở hữu một hiệu năng vô cùng mạnh mẽ kết hợp với màn hình OLED siêu chất lượng, rất phù hợp với mọi nhu cầu giải trí, thiết kế đồ họa.', 0, N'LaptopASUSZenBook.png', N'Green', N'13.3 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (28, N'Laptop Asus Zenbook UX425EA-KI839W', 32, 846.52, 1, N'Asus', N'Laptop Asus Zenbook UX425EA-KI839W là dòng laptop cao cấp của Asus với một thiết kế mỏng nhẹ cùng với một hiệu năng mạnh mẽ. Laptop Asus Zenbook UX425EA-KI839W hứa hẹn sẽ là một sản phẩm mang lại trải nghiệm mượt mà cho người dùng.', 0, N'ZENBOOKUX425EA-KI839W.png', N'Grey', N'14 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (29, N'Tai nghe Bluetooth Apple AirPods 2 VN/A', 10, 124.25, 3, N'Apple', N'Chip H1 mới nhất cho thời gian phản hồi nhanh cùng thời lượng pin lên đến 5 giờ
Tích hợp 2 Micro giúp khử tiếng ồn của môi trường cho chất lượng âm thanh rõ ràng khi đàm thoại
Kích hoạt trợ lý ảo Siri bằng cách gọi "Hey Siri"
Nhận hoặc dừng cuộc gọi bằng 1 cú chạm với tính năng điều khiển cảm ứng
Hỗ trợ sạc nhanh:15 phút sạc pin cho thời gian sử dụng lên đến 3 giờ', 171.54, N'Airpod2.png', N'White', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (30, N'Hộp đựng tai nghe Airpods 1/2 WiWu Defense Armor', 50, 12.9, 3, N'Apple', N'Hộp đựng tai nghe Airpods 1/2 Wiwu Defense Armor chính là phụ kiện chống sốc đạt tiêu chuẩn để bảo vệ chiếc Airpods 1/2 của bạn. Sử dụng phụ kiện có giá trị cao như AirPods ½ thì việc mà chúng ta cần ưu tiên đó chính là phải bảo vệ chúng cẩn thận. Nếu trong quá trình sử dụng có làm rơi rớt sẽ gây ảnh thưởng thậm chí là hỏng tai nghe. Chính vì thế việc sử dụng ốp AirPods này để bảo vệ phụ kiện của mình là điều cần thiết.', 0, N'Hopdungairpod.png', N'Black', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (31, N'Tai nghe chống ồn JBL T600BTNC', 15, 66.64, 3, N'JBL', N'JBL T600BTNC là một trong những dòng tai nghe trùm tai không dây với công nghệ chống ồn Active Noise Cancelling và chất âm từ JBL Pure Bass Sound. Rất thích hợp cho các bạn yêu thích âm nhạc khi đeo hàng giờ do tai nghe được thiết kế từ chất liệu Premium', 0, N'JBLT600BTNC.png', N'Black', N'XL')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (32, N'Tai nghe không dây JBL Tune 115 TWS', 20, 55.46, 3, N'JBL', N'Tai nghe không dây JBL Tune 115 TWS được trang bị công nghệ âm thanh độc quyền JBL Pure Bass, góp phần mang đến âm thanh trong trẻo, sống động cùng âm bass mạnh mẽ. Bạn sẽ được đắm chìm vào âm thanh của bài hát như thể đang chiêm ngưỡng một buổi concert thực thụ với JBL Tune 115 TWS.', 0, N'JBLTune115 TWS.png', N'Black', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (33, N'Loa JBL Partybox On The Go', 10, 365.43, 3, N'JBL', N'Công suất 100W cùng công nghệ Bass Boost mang tới âm bass mạnh mẽ
Thoả sức Karaoke với 2 Micro được tặng kèm cùng loa
Dung lượng pin 6 giờ sử dụng
Chuẩn chống nước IPX4 bảo vệ loa khỏi tác động nước nhẹ
Trải nghiệm âm thanh Stereo với chức năng ghép cặp loa', 429.49, N'JBLPartyboxOnTheGo.png', N'Black', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (34, N'Loa Bluetooth JBL Boombox 2', 51, 399.4, 3, N'JBL', N'Công suất 60 W khi dùng pin, lên đến 80 W khi cắm điện trực tiếp
Bảo vệ khỏi tác động của môi trường với kháng nước chuẩn IPX7
Sử dụng liên tục 1 ngày với dung lượng pin đến 10000mAh
Tích hợp quai xách thuận tiện mang theo khi đi du lịch
Kết nối nhiều loa với nhau với công nghệ Partyboost', 0, N'JBLBoombox2.png', N'Grey', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (35, N'Tai nghe Bluetooth Apple AirPods 3', 10, 197.33, 3, N'Apple', N'6 giờ nghe nhạc với tai nghe, 1 ngày khi đi kèm hộp sạc
Trải nghiệm sống động với âm thanh vòm Spatial audio
Chuẩn Bluetooth 5.0 cho phạm vi kết nối 10m
Yên tâm khi luyện tập thể thao với chuẩn kháng nước IPX4', 0, N'Airpod3.png', N'White', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (40, N'Tai nghe Bluetooth Apple AirPods Pro 2021 Magsafe', 0, 205.93, 3, N'Apple', N'Hỗ trợ tính năng chống ồn chủ động ANC
Tính năng xuyên âm giúp người dùng nghe được âm thanh của môi trường xung quanh
Thời gian sử dụng 4.5 giờ khi bật chế độ chống ồn,19 giờ khi đi kèm với hộp sạc
Trang bị cổng sạc Lightning,5 phút sạc cho 1 giờ sử dụng
Kích hoạt trợ lý ảo Siri bằng cách gọi ""Hey Siri""
Chống nước chuẩn IPX4 cho phép thoải mái luyện tập mà không lo thấm mồ hôi
Có khả năng định vị tai nghe bị thất lạc', 220.22, N'Airpodpro.png', N'White', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (44, N'Samsung Galaxy A73 (5G) 256GB', 99, 500.04000854492188, 2, N'SamSung', N'Camera chất lượng, bắt trọn từng khoảng khắc - Cụm 4 camera với cảm biến chính lên đến 108 MP
Thưởng thức không gian giải trí cực đỉnh - Màn hình lớn 6.7 inch, độ phân giải Full HD+, 120Hz mượt mà
Cấu hình Galaxy A73 5G được nâng cấp mạnh với chip Snapdragon 778G, RAM lên đến 8 GB
Chiến game thoải mái không lo gián đoạn - Viên pin lớn 5000 mAh, hỗ trợ sạc nhanh 25 W', 0, N'a73-xanh.png', N'Green', N'6.7 inches')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (48, N'Tai nghe Bluetooth Samsung Galaxy Buds Live', 150, 63.7400016784668, 3, N'SamSung', N'Chống ồn chủ động ANC khử tiếng ồn nhưng không lấn át các âm thanh quan trọng
Màn loa 12mm tinh chỉnh bởi AKG cho chất âm sáng rõ
3 mic lọc tiếng ồn cho chất lượng đàm thoại trong trẻo
Tích hợp Softify,chạm và giữ trong một giây tất cả danh sách nhạc sẽ được đồng bộ
6 tiếng nghe nhạc,đi kèm hộp sạc cho thời gian sử dụng lên đến 21 tiếng
Hỗ trợ sạc không dây,có thể sử dụng điện thoại để sạc cho tai nghe', 192.05999755859375, N'buds_2_1_.png', N'Yellow copper', N'No size')
INSERT [dbo].[Product_HE161579] ([ID], [Name], [Quantity], [Price], [CategoryID], [Brand], [Description], [OldPrice], [Image], [color], [size]) VALUES (49, N'Apple Macbook Pro 13 M2 2022 8GB 256GB', 13, 1412.3599853515625, 1, N'Apple', N'Macbook Pro M2 2022 là phiên bản nâng cấp mạnh mẽ của Macbook Pro M1 với nhiều cải tiến vô cùng ấn tượng. Đây sẽ là chiếc laptop mang đến cho người dùng trải nghiệm cực tốt. Từ đó giúp mọi hoạt động giải trí cũng như các công việc nặng như đồ họa, thiết kế đều được xử lý một cách mượt mà và nhanh chóng hơn.', 1500, N'hero_13__d1tfa5zby7e6_large00.png', N'White', N'13 inches')
SET IDENTITY_INSERT [dbo].[Product_HE161579] OFF
GO
SET IDENTITY_INSERT [dbo].[Role_HE161579] ON 

INSERT [dbo].[Role_HE161579] ([ID], [Name], [Description]) VALUES (1, N'Admin', N'Delete,Update,Insert, View database directly')
INSERT [dbo].[Role_HE161579] ([ID], [Name], [Description]) VALUES (3, N'Administrators', N'Insert, Update, View database(Product)')
INSERT [dbo].[Role_HE161579] ([ID], [Name], [Description]) VALUES (4, N'User', N'View')
SET IDENTITY_INSERT [dbo].[Role_HE161579] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_HE161579] ON 

INSERT [dbo].[Transaction_HE161579] ([ID], [Total], [Note], [Address], [Phone], [UserID], [Time]) VALUES (13, 1412.3599853515625, N'Không có gì', N'Ninh Bình', N'0144444445', 2, CAST(N'2022-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_HE161579] ([ID], [Total], [Note], [Address], [Phone], [UserID], [Time]) VALUES (14, 22825.98046875, N'Không có gì', N'Ninh Bình', N'0144444445', 2, CAST(N'2022-07-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_HE161579] ([ID], [Total], [Note], [Address], [Phone], [UserID], [Time]) VALUES (15, 1412.3599853515625, N'', N'Nam Định, Việt Nam', N'012345678 ', 6, CAST(N'2022-07-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transaction_HE161579] OFF
GO
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (1, N'Admin', N'12345678', N'Admin', N'Nam Định', N'tiennmhe161579@fpt.edu.vn', N'0948223349', 1, 1, NULL)
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (2, N'user1', N'22112002', N'user1', N'Ninh Bình', N'user1@gmail.com', N'0144444445', 1, 3, NULL)
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (3, N'user3', N'22112002', N'Ngô Tiến', N'Hà Nội', N'user3@gmail.com', N'089983637 ', 0, 4, N'12345     ')
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (4, N'ngotien2211', N'12345678', N'Ngô Minh Báo', N'Hà Nam, Việt Nam', N'ngominhtien98@gmail.com', N'012345678 ', 1, 4, N'          ')
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (5, N'duc2211', N'12345678', N'Đào Trung Đứt', N'Hà Nội, Việt Nam', N'ducnth10@gmail.com', N'012345678 ', 1, 3, N'          ')
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (6, N'tuyen98', N'123456789', N'Ngô Minh Tuyên', N'Nam Định, Việt Nam', N'ngominhtuyen98@gmail.com', N'012345678 ', 1, 4, N'          ')
INSERT [dbo].[User_HE161579] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [Status], [RoleID], [Code]) VALUES (7, N'ngoanh2211', N'1234567890', N'Tiến Ngô', N'Nam định', N'ngominhtien221102@gmail.com', N'0899836370', 1, 4, N'          ')
GO
ALTER TABLE [dbo].[OrderDetail_HE161579]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_HE161579_Product_HE161579] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product_HE161579] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail_HE161579] CHECK CONSTRAINT [FK_OrderDetail_HE161579_Product_HE161579]
GO
ALTER TABLE [dbo].[OrderDetail_HE161579]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_HE161579_Transaction_HE161579] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transaction_HE161579] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail_HE161579] CHECK CONSTRAINT [FK_OrderDetail_HE161579_Transaction_HE161579]
GO
ALTER TABLE [dbo].[Product_HE161579]  WITH CHECK ADD  CONSTRAINT [FK_Product_HE161579_Categories_HE161579] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories_HE161579] ([ID])
GO
ALTER TABLE [dbo].[Product_HE161579] CHECK CONSTRAINT [FK_Product_HE161579_Categories_HE161579]
GO
ALTER TABLE [dbo].[Transaction_HE161579]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_HE161579_User_HE161579] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_HE161579] ([ID])
GO
ALTER TABLE [dbo].[Transaction_HE161579] CHECK CONSTRAINT [FK_Transaction_HE161579_User_HE161579]
GO
ALTER TABLE [dbo].[User_HE161579]  WITH CHECK ADD  CONSTRAINT [FK_User_HE161579_Role_HE161579] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role_HE161579] ([ID])
GO
ALTER TABLE [dbo].[User_HE161579] CHECK CONSTRAINT [FK_User_HE161579_Role_HE161579]
GO
