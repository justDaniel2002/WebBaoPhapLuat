USE [master]
GO
/****** Object:  Database [webbaophapluat]    Script Date: 6/12/2024 5:03:11 PM ******/
CREATE DATABASE [webbaophapluat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webbaophapluat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\webbaophapluat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webbaophapluat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\webbaophapluat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [webbaophapluat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webbaophapluat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webbaophapluat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webbaophapluat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webbaophapluat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webbaophapluat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webbaophapluat] SET ARITHABORT OFF 
GO
ALTER DATABASE [webbaophapluat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webbaophapluat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webbaophapluat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webbaophapluat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webbaophapluat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webbaophapluat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webbaophapluat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webbaophapluat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webbaophapluat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webbaophapluat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webbaophapluat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webbaophapluat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webbaophapluat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webbaophapluat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webbaophapluat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webbaophapluat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webbaophapluat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webbaophapluat] SET RECOVERY FULL 
GO
ALTER DATABASE [webbaophapluat] SET  MULTI_USER 
GO
ALTER DATABASE [webbaophapluat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webbaophapluat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webbaophapluat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webbaophapluat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webbaophapluat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webbaophapluat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'webbaophapluat', N'ON'
GO
ALTER DATABASE [webbaophapluat] SET QUERY_STORE = OFF
GO
USE [webbaophapluat]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[facebookURL] [varchar](max) NULL,
	[facebookId] [varchar](max) NULL,
	[roleId] [int] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NULL,
	[imageURL] [varchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[createdDate] [datetime] NULL,
	[accountId] [int] NULL,
	[postId] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InnerTag]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InnerTag](
	[innerTagId] [int] IDENTITY(1,1) NOT NULL,
	[tagId] [int] NULL,
	[innerTagName] [nvarchar](max) NULL,
 CONSTRAINT [PK_InnerTag] PRIMARY KEY CLUSTERED 
(
	[innerTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[imageURL] [varchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[categoryId] [int] NULL,
	[tagId] [int] NULL,
	[innerTagId] [int] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostView]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostView](
	[postId] [int] NOT NULL,
	[accountId] [int] NOT NULL,
	[viewDate] [datetime] NULL,
 CONSTRAINT [PK_PostView] PRIMARY KEY CLUSTERED 
(
	[postId] ASC,
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 6/12/2024 5:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[tagId] [int] IDENTITY(1,1) NOT NULL,
	[tagName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([accountId], [email], [password], [facebookURL], [facebookId], [roleId], [createdDate]) VALUES (1, N'myemail@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, 1, CAST(N'2024-06-03T19:39:32.407' AS DateTime))
GO
INSERT [dbo].[Account] ([accountId], [email], [password], [facebookURL], [facebookId], [roleId], [createdDate]) VALUES (2, N'myEmail2@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, 3, CAST(N'2024-06-05T11:34:05.133' AS DateTime))
GO
INSERT [dbo].[Account] ([accountId], [email], [password], [facebookURL], [facebookId], [roleId], [createdDate]) VALUES (3, N'myEmail3@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, 3, CAST(N'2024-06-09T16:08:35.690' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([categoryId], [categoryName], [imageURL]) VALUES (1, N'Xây Dựng, Chỉnh Đốn Đảng', N'https://image.baophapluat.vn/Uploaded/2024/lwp-klc/2022_10_04/xaydung-chinhdon-9772.png')
GO
INSERT [dbo].[Category] ([categoryId], [categoryName], [imageURL]) VALUES (2, N'Phòng Chống Tham Nhũng, Tiêu Cực', N'  https://image.baophapluat.vn/Uploaded/2024/firns/2022_10_06/phong-chong-tham-nhung-3974.png
')
GO
INSERT [dbo].[Category] ([categoryId], [categoryName], [imageURL]) VALUES (3, N'Văn Hóa, Pháp Luật', N'  https://image.baophapluat.vn/Uploaded/2024/lwp-klc/2022_10_04/van-hoa-phap-luat-8831.png
')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([commentId], [content], [createdDate], [accountId], [postId]) VALUES (1, N'Xin chào', CAST(N'2024-06-05T11:55:11.150' AS DateTime), 2, 2)
GO
INSERT [dbo].[Comment] ([commentId], [content], [createdDate], [accountId], [postId]) VALUES (7, N'hello', CAST(N'2024-06-09T16:25:08.587' AS DateTime), 3, 2)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[InnerTag] ON 
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (1, 2, N'Hoạt Động Bộ Trưởng')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (2, 2, N'Hoạt Động Ngành Tư Pháp')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (3, 5, N'Tin Nóng')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (4, 5, N'Pháp Đinh')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (5, 5, N'Điều Tra')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (6, 6, N'Y Tế')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (7, 6, N'Giáo Dục')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (8, 6, N'Môi Trường')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (9, 6, N'Giao Thông')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (10, 6, N'Tin Địa Phương')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (11, 7, N'Du Lịch')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (12, 7, N'Bản Sắc Việt')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (13, 7, N'Giải Trí')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (14, 7, N'Thể Thao')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (15, 7, N'Sống An Vui')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (16, 7, N'Giới Thiệu Sách')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (17, 7, N'Sáng Tác')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (18, 8, N'Tài Chính')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (19, 8, N'Chứng Khoán')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (20, 8, N'Ngân Hàng')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (21, 8, N'Kinh Tế Số')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (22, 8, N'Doanh Nghiệp - Doanh Nhân')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (23, 9, N'Chính Sách')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (24, 9, N'Doanh Nghiệp')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (25, 9, N'Thị Trường')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (26, 9, N'Phong Thủy')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (27, 9, N'Không Gian Xinh')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (28, 9, N'Nhà Đẹp')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (29, 9, N'Sàn Giao DỊch')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (30, 10, N'Cử Chi')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (31, 10, N'Tư Vấn')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (32, 10, N'Đơn Thư')
GO
INSERT [dbo].[InnerTag] ([innerTagId], [tagId], [innerTagName]) VALUES (33, 10, N'Văn Bản Mới')
GO
SET IDENTITY_INSERT [dbo].[InnerTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (2, N'MyPost2', N'https://image.baophapluat.vn/w840/Uploaded/2024/qjcqrmdwp/2024_06_03/untitled-2617.png', N'MyPost2', CAST(N'2024-06-03T19:44:47.480' AS DateTime), 1, 2, 2, 1, NULL)
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (19, N'Thay đổi mẫu giấy thi tốt nghiệp THPT năm 2024', N'https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_05_17/thi-tot-nghiep-thpt-2022-2-454-7836.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Theo Cục trưởng Cục Quản lý chất lượng Huỳnh Văn Chương, từ kỳ thi năm nay, Bộ GD&amp;ĐT sẽ sửa lại mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT. Điều này thực hiện theo đề nghị của các sở GD&amp;ĐT để tránh nhầm lẫn cho thí sinh.</p> 
<p style="text-align: justify;">Trước đây, khi kỳ thi đại học được tổ chức theo cụm, số báo danh của thí sinh gồm cả phần chữ và số, ví dụ như "BKA012345". Những năm gần đây, số báo danh chỉ còn phần số, nhưng giấy thi vẫn in lưu ý "Thí sinh phải ghi cả phần chữ và số". Theo các Sở GD&amp;ĐT, điều này khiến nhiều thí sinh nhầm lẫn, ghi dưới dạng "012345 (không một hai ba bốn năm)". </p> 
<p style="text-align: justify;">Vì vậy, Bộ ban hành mẫu giấy thi tự luận mới, bỏ phần ghi chú này. Thí sinh chỉ cần ghi đúng số báo danh của mình là đủ (ví dụ 012345).</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997700" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" data-width="1130" data-height="797" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" alt="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." title="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." width="840" height="592"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024.</p></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Với phiếu trả lời trắc nghiệm, Bộ GD&amp;ĐT giữ nguyên mẫu cũ. Thí sinh cần ghi đầy đủ thông tin, 6 chữ số cuối của số báo danh, đồng thời tô kín các ô tròn trong bảng số phía dưới (tương ứng với các chữ số đã ghi).</p> 
<p style="text-align: justify;">Ở phần trả lời, với mỗi câu trắc nghiệm, thí sinh chọn và tô kín một ô tròn trong các đáp án A, B, C, D.</p> 
<p style="text-align: justify;">Thí sinh không được tô vào phương án có số thứ tự không tương ứng với câu hỏi trắc nghiệm trong đề thi.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997702" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" data-width="595" data-height="854" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" alt="Phiếu trả lời các môn thi trắc nghiệm." title="Phiếu trả lời các môn thi trắc nghiệm." width="595" height="854"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Phiếu trả lời các môn thi trắc nghiệm.</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Kỳ thi tốt nghiệp THPT năm nay sẽ diễn ra từ 26/6 đến 28/6. Cụ thể, ngày 26/6, thí sinh làm thủ tục dự thi; ngày 27 và 28/6 diễn ra kỳ thi chính thức; 29/6 là ngày dự phòng.</p> 
<p style="text-align: justify;">Thí sinh tham gia làm 4 bài thi bắt buộc, gồm Toán, Ngữ văn, Ngoại ngữ và một trong hai bài thi Khoa học Tự nhiên hoặc Khoa học Xã hội.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Thời gian công bố kết quả thi tốt nghiệp dự kiến vào 8h ngày 17/7. Sau đó, các địa phương tiến hành xét tốt nghiệp cho học sinh dự thi và sử dụng kết quả thi tốt nghiệp để xét tuyển sinh đại học, cao đẳng theo kế hoạch tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:43:02.580' AS DateTime), 1, 1, 1, 2, N'(PLVN) - Để tránh nhầm lẫn cho thí sinh khi viết số báo danh, Bộ GD&ĐT sẽ thay đổi mẫu giấy thi tốt nghiệp THPT năm nay.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (20, N'Vị thế, uy tín của Việt Nam trên trường quốc tế (Kỳ 3): Thành viên tích cực, có trách nhiệm của cộng đồng quốc tế', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Đóng góp tích cực vào việc giữ gìn hòa bình thế giới</strong></p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị Đối ngoại toàn quốc triển khai thực hiện Nghị quyết Đại hội lần thứ XIII của Đảng (tháng 12/2021), Tổng Bí thư Nguyễn Phú Trọng nêu rõ, bất kỳ quốc gia, dân tộc nào trong quá trình hình thành và phát triển cũng đều phải xử lý hai vấn đề cơ bản là đối nội và đối ngoại. Hai vấn đề này có mối quan hệ hữu cơ, biện chứng, tác động qua lại, hỗ trợ lẫn nhau như hai cái cánh của một con chim, tạo thế và lực cho nhau, nhất là trong điều kiện toàn cầu hoá phát triển mạnh mẽ và sâu rộng. </p> 
<p style="text-align: justify;">Đúng như những nhận định của người đứng đầu Đảng ta, đối ngoại ngày nay không chỉ là sự nối tiếp của chính sách đối nội, mà còn là một động lực mạnh mẽ cho sự phát triển của các quốc gia, dân tộc. Thông qua những hoạt động đối ngoại, vị thế và uy tín quốc tế của nước ta trong khu vực và trên thế giới ngày càng được nâng cao, đóng góp tích cực và trách nhiệm vào việc giữ vững hoà bình, hợp tác phát triển và tiến bộ trên thế giới. Đây cũng chính là quyết tâm mà Đại hội lần thứ XIII của Đảng đã thống nhất rất cao: “Chủ động và tích cực hội nhập quốc tế toàn diện, sâu rộng; Việt Nam là bạn, là đối tác tin cậy và là thành viên tích cực, có trách nhiệm trong cộng đồng quốc tế”. </p> 
<p style="text-align: justify;">Kể từ khi Liên hợp quốc (LHQ) chính thức kết nạp Việt Nam trở thành quốc gia thành viên thứ 149 vào năm 1977, chúng ta đã không ngừng nỗ lực, chủ động và trách nhiệm đóng góp vào mục tiêu chung của thế giới, nhất là việc Việt Nam tham gia hoạt động gìn giữ hòa bình (GGHB) của LHQ. Cụ thể, tháng 11/2012, Bộ Chính trị thông qua Đề án tổng thể về việc Việt Nam tham gia hoạt động GGHB LHQ; sau đó, Quốc hội thông qua Nghị quyết số 130/2020/QH14 về tham gia lực lượng GGHB của LHQ. Đây là những bằng chứng thuyết phục cho cam kết của Việt Nam trong việc tham gia và giải quyết các vấn đề chung của quốc tế.</p> 
<p style="text-align: justify;">Ngày 27/5/2014, Trung tâm GGHB Việt Nam được thành lập. Ngay khi ra mắt, Trung tâm đã cử 2 sĩ quan đầu tiên đi làm nhiệm vụ cùng Phái bộ GGHB của LHQ tại Nam Sudan. Từ đây, những sĩ quan Quân đội nhân dân (QĐND) Việt Nam mang trên đầu chiếc mũ nồi xanh và mang trong tim dòng máu Lạc Hồng, truyền thống đoàn kết, nhân nghĩa của dân tộc để sẵn sàng nhận nhiệm vụ ở bất cứ đâu, mang lại hòa bình, ấm no, thịnh vượng cho mọi người dân trên thế giới. Đến năm 2022, Công an nhân dân Việt Nam cũng chính thức tham gia GGHB LHQ.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Trong 10 năm Việt Nam triển khai lực lượng tham gia sứ mệnh GGHB, chúng ta đã cử trên 800 lượt sĩ quan, quân nhân chuyên nghiệp triển khai theo hình thức cá nhân và đơn vị, trong đó có 5 thê đội (bộ phận của đội hình được sắp xếp theo bậc thang để hành động theo thứ tự - NV) của Bệnh viện dã chiến cấp 2 triển khai tại Phái bộ Nam Sudan; 2 thê đội của Đội Công binh triển khai tại khu vực Abyei và 114 lượt sĩ quan triển khai theo hình thức cá nhân. Số lượng cán bộ, sĩ quan hoàn thành xuất sắc nhiệm vụ của Việt Nam cao hơn nhiều so với mặt bằng chung của LHQ. Không chỉ vậy, Đội Công binh Việt Nam ở khu vực Abyei đã giúp đỡ chính quyền và người dân địa phương bằng những hành động thiết thực như xây dựng và tu sửa đường; xây dựng, cải tạo lớp học; dạy học tình nguyện; khoan giếng nước tặng khu dân cư địa phương và các trường học; khám, chữa bệnh, tư vấn sức khỏe và cấp phát thuốc miễn phí cho người dân...</p> 
<p style="text-align: justify;"><strong>Tinh thần đoàn kết quốc tế cao cả</strong></p> 
<p style="text-align: justify;">Cùng với việc hoàn thành nhiều trọng trách quốc tế quan trọng, Việt Nam đã đề xuất nhiều sáng kiến, giải pháp thúc đẩy hợp tác, đóng góp có trách nhiệm vào các vấn đề chung của thế giới như phòng, chống dịch bệnh, thiên tai, biến đổi khí hậu, an ninh lương thực; cử lực lượng hỗ trợ khắc phục hậu quả động đất tại Thổ Nhĩ Kỳ…</p> 
<p style="text-align: justify;"> “Cảm ơn Việt Nam” là câu nói xúc động của Tổng thống Thổ Nhĩ Kỳ Tayyip Erdogan khi gặp đoàn cứu hộ, cứu nạn của QĐND Việt Nam tại hai tỉnh Hatay và Kahramanmaras (tháng 2/2023). Ông nhấn mạnh, thảm họa động đất một lần nữa cho thấy tầm quan trọng của tình đoàn kết quốc tế. Thổ Nhĩ Kỳ sẽ không bao giờ quên tình bạn đó. Không chỉ là một trong những quốc gia đầu tiên nhanh chóng cử các lực lượng tham gia công tác tìm kiếm, cứu nạn, hỗ trợ người dân Thổ Nhĩ Kỳ, đoàn cứu hộ, cứu nạn của QĐND Việt Nam còn trao gần 25 tấn hàng viện trợ của Bộ Quốc phòng, gồm lương khô, gạo, sữa, thiết bị y tế và nhiều nhu yếu phẩm khác tặng Thổ Nhĩ Kỳ. Cùng với đó, đoàn công tác cứu nạn, cứu hộ quốc tế của Bộ Công an Việt Nam đã trao tặng 2 tấn thiết bị y tế cho Thổ Nhĩ Kỳ… </p> 
<p style="text-align: justify;">Gần đây, vào tháng 11/2023, thông qua LHQ, Việt Nam đã đóng góp 500.000 USD để cứu trợ nhân đạo người dân Palestine bị ảnh hưởng bởi xung đột ở dải Gaza, thể hiện tinh thần đoàn kết với nhân dân Palestine. Trước đó, khi động đất và sóng thần gây thiệt hại lớn tại Nhật Bản vào năm 2011, Chính phủ Việt Nam đã trợ giúp nhân dân Nhật Bản 200.000 USD để góp phần khắc phục hậu quả. Ngoài ra, hưởng ứng lời kêu gọi của Hội Chữ thập đỏ Việt Nam, đã có hàng nghìn tổ chức, cá nhân ủng hộ nhân dân Nhật Bản bị thiên tai với hơn 161 tỷ đồng (tương đương 7,783 triệu USD). </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Thể hiện vai trò nòng cốt, dẫn dắt, hòa giải</strong></p> 
<p style="text-align: justify;">Để triển khai hiệu quả, thực chất đường lối đối ngoại, tháng 8/2018, Ban Bí thư đã ban hành Chỉ thị số 25-CT/TW về đẩy mạnh và nâng tầm đối ngoại đa phương đến năm 2030, trong đó xác định: phấn đấu đóng vai trò nòng cốt, dẫn dắt, hòa giải tại các diễn đàn đa phương có tầm quan trọng chiến lược đối với đất nước, phù hợp với khả năng và điều kiện cụ thể. </p> 
<p style="text-align: justify;">Nhờ những định hướng này, vào năm Việt Nam đảm nhận vai trò Chủ tịch ASEAN 2020 đã thành công toàn diện, là một đỉnh cao thắng lợi của đường lối đối ngoại đa phương của Đảng. Theo đó, đã thông qua hơn 550 cuộc họp, nhiều sáng kiến, ưu tiên của Việt Nam đã trở thành tài sản chung của ASEAN. Trong Năm Chủ tịch ASEAN 2020 của Việt Nam, rất nhiều cái “đầu tiên” đã được sáng tạo để hoàn thành các mục tiêu đề ra: số lượng các Hội nghị tăng lên để kịp thời ứng phó với dịch Covid-19; nhiều Hội nghị Cấp cao, Bộ trưởng lần đầu được tổ chức trực tuyến; nhiều văn kiện quan trọng của ASEAN cũng được ký kết trực tuyến lần đầu tiên. Điều này đã minh chứng cho năng lực công nghệ và khả năng của Việt Nam trong kỷ nguyên chuyển đổi số.</p> 
<p style="text-align: justify;">Chúng ta đã không chỉ khéo léo, linh hoạt dẫn dắt, điều hòa những khác biệt giữa các quốc gia thành viên ASEAN để giữ vững hình ảnh đoàn kết, đồng thuận của Hiệp hội, mà còn xử lý hài hòa, hiệu quả các bất đồng giữa các đối tác, qua đó tất cả các hội nghị trong năm diễn ra thành công. Với thành công của Năm Chủ tịch ASEAN 2020, Việt Nam không còn chỉ là một thành viên tích cực, luôn nghiêm túc thực thi các thỏa thuận đã cam kết, mà đã trở thành một chỗ dựa vững chắc, tin cậy, đặc biệt trong những thời khắc ASEAN phải đối mặt với nhiều khó khăn, thách thức.</p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị tổng kết 2 năm Việt Nam đảm nhiệm cương vị Ủy viên không thường trực Hội đồng Bảo an LHQ nhiệm kỳ 2020 - 2021 (tháng 1/2022), Thủ tướng Phạm Minh Chính nêu rõ, việc Việt Nam lần thứ hai đảm nhiệm vị trí quan trọng này (chỉ hơn 10 năm sau khi kết thúc nhiệm kỳ đầu tiên) với số phiếu bầu gần như tuyệt đối (192/193 phiếu) cho thấy vị thế của đất nước và sự tín nhiệm cao của quốc tế đối với chính sách đối ngoại của chúng ta… Việt Nam đã khẳng định được năng lực điều hành, từng bước thể hiện rõ vai trò nòng cốt, dẫn dắt, hòa giải tại các hội nghị Hội đồng Bảo an với nhiều dấu ấn tích cực, được các nước ủy viên Hội đồng Bảo an, kể cả các nước ủy viên thường trực, các nước bạn bè truyền thống, đang phát triển, các nước trong Phong trào không liên kết... coi trọng, đánh giá cao. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Tại cuộc gặp với Tổng Bí thư Nguyễn Phú Trọng trong khuôn khổ chuyến thăm chính thức Việt Nam (tháng 10/2022), Tổng Thư ký LHQ António Guterres cho rằng Việt Nam luôn thể hiện lập trường nguyên tắc trên những vấn đề về bảo vệ hòa bình, phát triển bền vững, đề cao Hiến chương LHQ, luật pháp quốc tế, nhất là những nguyên tắc cơ bản nhất. Việt Nam cũng tích cực hợp tác cùng LHQ và các đối tác quốc tế ứng phó với các vấn đề an ninh phi truyền thống ngày càng gay gắt.</p> 
<p style="text-align: justify;"> Những nỗ lực không ngừng nghỉ và những thành quả to lớn trong công tác đối ngoại Đảng, ngoại giao Nhà nước và đối ngoại nhân dân của Việt Nam đã góp phần rất quan trọng vào thành tựu chung to lớn, có ý nghĩa lịch sử của đất nước, như Đại hội XIII của Đảng đã khẳng định: “Đất nước ta chưa bao giờ có được cơ đồ, tiềm lực, vị thế và uy tín quốc tế như ngày nay”.</p> 
<blockquote style="text-align: justify;" class="quote cms-quote"> 
 <table class="picture"> 
  <tbody> 
   <tr> 
    <td class="pic"><img data-image-id="997611" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="740" data-height="416" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tong-thu-ky-lhq-antonio-guterres-anh-reuters-2301.jpeg" alt="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" title="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" width="740" height="416"></td> 
   </tr> 
   <tr> 
    <td class="caption"><p>Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)</p> </td> 
   </tr> 
  </tbody> 
 </table> 
 <p>“Cách đây chưa đầy một thế hệ, các nhân viên LHQ đã ở Việt Nam, hỗ trợ lương thực cho một quốc gia bị chiến tranh tàn phá và cô lập. Cũng chính Việt Nam hôm nay đã và đang gửi những người lính gìn giữ hòa bình đến giúp đỡ người dân ở những nơi khó khăn nhất trên thế giới, cách xa quê hương hàng nghìn dặm” - Tổng Thư ký LHQ Antonio Guterres chia sẻ tại Lễ kỷ niệm 45 năm Việt Nam gia nhập LHQ. </p> 
</blockquote>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Vân Thanh">Vân Thanh</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:43:02.580' AS DateTime), 1, 2, 3, 3, N'(PLVN) - Quán triệt tư tưởng mà Chủ tịch Hồ Chí Minh từng nhấn mạnh “giữ gìn hòa bình thế giới tức là giữ gìn lợi ích của nước ta”, Đảng và Nhà nước ta đã triển khai hiệu quả đường lối đối ngoại trên tinh thần chủ động và phát huy vai trò tại các cơ chế đa phương, là thành viên tích cực, có trách nhiệm của cộng đồng quốc tế.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (21, N'Việt Nam được bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003 về bảo vệ di sản văn hoá phi vật thể', N'https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" data-image-id="997747" data-width="1600" data-height="949" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" width="840" height="498"></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;"><em>Các đại biểu tham dự kỳ họp.</em></p> 
<p style="text-align: justify;">Theo phóng viên TTXVN tại Pháp, ngày 11/6, tại Trụ sở Tổ chức Giáo dục, Khoa học và Văn hoá Liên hợp quốc (UNESCO) ở thủ đô Paris, Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), đã khai mạc với sự tham dự của 183 quốc gia thành viên và hơn 100 quan sát viên. Thứ trưởng Bộ Ngoại giao Hà Kim Ngọc, Chủ tịch Ủy ban Quốc gia UNESCO Việt Nam, dẫn đầu Đoàn Việt Nam tham dự kỳ họp này.</p> 
<p style="text-align: justify;">Tại phiên khai mạc, Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003, đưa số lượng các cơ chế then chốt của UNESCO mà Việt Nam tham gia lên con số 6 (thành viên Uỷ ban Di sản thế giới và Hội đồng Chấp hành UNESCO, Phó Chủ tịch Đại hội đồng UNESCO, Phó Chủ tịch Ủy ban liên Chính phủ Công ước 2005 về bảo vệ và phát huy sự đa dạng của các biểu đạt văn hóa, Phó Chủ tịch Ủy ban liên Chính phủ và Phó Chủ tịch Đại hội đồng Công ước 2003).</p> 
<p style="text-align: justify;">Chủ tịch Uỷ ban Quốc gia UNESCO Việt Nam Hà Kim Ngọc nhấn mạnh ý nghĩa quan trọng của sự kiện này, một lần nữa cho thấy vị thế và uy tín quốc tế ngày càng cao của Việt Nam, sự ủng hộ, tin tưởng của cộng đồng quốc tế đối với vai trò và năng lực điều hành của ta tại các thể chế đa phương toàn cầu, và đặc biệt là sự ghi nhận đối với những đóng góp của Việt Nam trong gìn giữ, bảo tồn và phát huy giá trị di sản phi vật thể trong nước và trên thế giới. Đây cũng là kết quả của việc triển khai chính sách đối ngoại đúng đắn của Đảng và Nhà nước về đa phương hóa, đa dạng hóa và hội nhập quốc tế toàn diện, sâu rộng, chủ trương đẩy mạnh và nâng tầm đối ngoại đa phương, cũng như Chiến lược Ngoại giao văn hoá đến năm 2030.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ở vị trí điều hành, Việt Nam sẽ trực tiếp tham gia vào quá trình xây dựng, thông qua các quyết định quan trọng của UNESCO về văn hóa, đóng góp hơn nữa cho việc hoàn thiện, thực hiện các mục tiêu của Công ước 2003, cũng như tranh thủ các chương trình, kế hoạch, sáng kiến của UNESCO phục vụ phát triển đất nước, bảo tồn và phát huy giá trị di sản, bảo đảm cao nhất lợi ích quốc gia, dân tộc trong hợp tác văn hóa ở tầm toàn cầu.</p> 
<p style="text-align: justify;">Phát biểu tại phiên khai mạc toàn thể của Kỳ họp lần thứ 10, Thứ trưởng Ngoại giao Hà Kim Ngọc đánh giá cao nỗ lực của Ủy ban liên Chính phủ, Ban thư ký và các quốc gia thành viên Công ước 2003 trong thúc đẩy các mục tiêu của Công ước, nâng cao nhận thức về vai trò của bảo vệ và trao truyền di sản phi vật thể, đặt cộng đồng vào trung tâm của nỗ lực bảo tồn di sản. Thứ trưởng khẳng định Việt Nam, với 15 di sản văn hóa phi vật thể đã được ghi danh và 550 di sản văn hóa phi vật thể cấp quốc gia, luôn luôn quan tâm bảo vệ di sản văn hóa phi vật thể, không ngừng xây dựng và hoàn thiện chính sách, luật pháp quốc gia, và gần đây nhất là Chương trình Mục tiêu Quốc gia về Phát triển Văn hóa đến 2045, và Luật Di sản văn hóa sửa đổi.</p> 
<p style="text-align: justify;">Thứ trưởng Hà Kim Ngọc đề xuất UNESCO và các nước thành viên cần tiếp tục tăng cường hợp tác quốc tế, triển khai hiệu quả Công ước, ưu tiên chia sẻ kinh nghiệm, tăng cường năng lực cho các nước đang phát triển, các quốc gia Châu Phi, nhóm đảo nhỏ đang phát triển, thúc đẩy tham gia và đóng góp của cộng đồng, phụ nữ và thanh niên.</p> 
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" data-image-id="997748" data-width="1600" data-height="766" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" width="840" height="402"></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Các đại biểu chụp ảnh chung.</p> 
<p style="text-align: justify;">Các quốc gia thành viên Công ước 2003 đánh giá cao những kinh nghiệm, hiểu biết và nỗ lực của Việt Nam trong bảo vệ và phát huy di sản văn hoá phi vật thể ở cả phương diện lý luận, luật pháp và thực tiễn, là bài học tốt cho nhiều quốc gia ở khu vực và quốc tế, góp phần bảo vệ khẩn cấp những di sản có nguy cơ bị mai một, gìn giữ những di sản đại diện cho nhân loại và quảng bá những hình mẫu di sản được bảo vệ tốt trên thế giới.</p> 
<p style="text-align: justify;">Diễn ra trong hai ngày, 11 và 12/6, Kỳ họp lần thứ 10 của Đại hội đồng Công ước 2003 là dịp để các nước thành viên cùng nhau thảo luận các vấn đề quan trọng đối với tương lai của Công ước và hướng các nỗ lực của các quốc gia và cộng đồng vào việc bảo vệ di sản sống của thế giới. Các chủ đề chính trong chương trình nghị sự bao gồm: tổng kết các hoạt động của Đại hội đồng giai đoạn 2022-2023; xem xét việc triển khai rộng rãi hơn Điều 18 của Công ước; xây dựng kế hoạch sử dụng nguồn lực của Quỹ Di sản văn hóa phi vật thể vào năm 2024 và 2025; công nhận các tổ chức phi chính phủ mới và bầu 12 thành viên mới của Ủy ban.</p> 
<p style="text-align: justify;">Đại hội đồng Công ước 2003 là cơ quan quyền lực cao nhất của UNESCO trong lĩnh vực bảo vệ di sản văn hoá phi vật thể, gồm đại diện của 183 nước thành viên. Đại hội đồng quyết định những vấn đề quan trọng liên quan đến chính sách, đường lối phát triển của Công ước, phân bổ kinh phí hỗ trợ công tác bảo tồn di sản phi vật thể ở các quốc gia, bầu Uỷ ban liên Chính phủ Công ước 2003. Việt Nam chính thức tham gia Công ước 2003 vào ngày 05/09/2005, trở thành một trong 30 quốc gia đầu tiên trên thế giới gia nhập Công ước quan trọng này. Là một thành viên tích cực và có trách nhiệm, Việt Nam đã 2 lần được tín nhiệm, trúng cử vào Ủy ban Liên Chính phủ về bảo vệ di sản văn hóa phi vật thể. Tinh thần của Công ước đã được vận dụng vào Luật sửa đổi, bổ sung một số điều của Luật Di sản văn hóa năm 2009 và vào thực tiễn hoạt động bảo vệ và phát huy giá trị di sản văn hóa phi vật thể ở Việt Nam, với những kết quả rất đáng ghi nhận.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện nay, Việt Nam đang trong quá trình hoàn thiện, đệ trình và thúc đẩy việc ghi danh các hồ sơ đề cử như: Quần thể di tích và danh thắng Yên Tử - Vĩnh Nghiêm - Côn Sơn, Kiếp Bạc; Khu di tích khảo cổ Óc Eo-Ba Thê; Hang Con Moong; Lễ hội Vía bà Chúa Xứ núi Sam; Nghệ thuật Tranh dân gian Đông Hồ; Nghệ thuật Chèo; Mo Mường; Công viên địa chất Lạng Sơn; và đặc biệt là Dự án bảo tồn và phát huy giá trị khu Trung tâm Hoàng thành Thăng Long - Hà Nội.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Theo TTXVN">Theo TTXVN</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:43:02.580' AS DateTime), 1, 3, 4, 4, N'Tại phiên khai mạc Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (22, N'Truy tìm đối tượng tên ''Hoàng'' nghi hiếp dâm trẻ em', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Thông tin từ Công an TP Hà Nội, Cơ quan CSĐT Công an quận Thanh Xuân đang điều tra vụ án hình sự "Hiếp dâm người dưới 16 tuổi" xảy ra trong khoảng thời gian từ ngày 20/8/2022 đến ngày 27/2/2023 tại nhà nghỉ trên địa bàn phường Nhân Chính, quận Thanh Xuân.</p> 
<p style="text-align: justify;">Ngày 23/5/2024, Cơ quan CSĐT - Công an quận Thanh Xuân đã ra quyết định khởi tố vụ án hình sự “hiếp dâm” người dưới 16 tuổi để điều tra làm rõ vụ án. Theo đó, Công an quận Thanh Xuân xác định đối tượng tình nghi có hành vi hiếp dâm người dưới 16 tuổi tên là “Hoàng”. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện chưa rõ nhân thân lai lịch của đối tượng. Để phục vụ điều tra, Công an quận Thanh Xuân quyết định truy tìm đối tượng trên.</p> 
<p style="text-align: justify;">"Ai biết thông tin về đối tượng thì báo ngay cho Cơ quan CSĐT Công an quận Thanh Xuân (SĐT: 0866.183.988), cơ quan Công an nơi gần nhất hoặc cung cấp thông tin qua trang facebook Công an thành phố Hà Nội để phối hợp giải quyết vụ việc theo quy định", Công an TP Hà Nội thông báo.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Bùi Lan">Bùi Lan</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:43:02.580' AS DateTime), 1, 1, 5, 5, N'(PLVN) - Ai biết thông tin về đối tượng trong ảnh ở đâu cần báo ngay cho Công an quận Thanh Xuân, TP Hà Nội, theo số điện thoại 0866.183.988.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (23, N'Cần giải pháp đồng bộ để quản lý thị trường tín chỉ carbon', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<div class="notebox nright cms-note" align="right" style="text-align: justify;">
 <p> Kinh tế xanh đang mở ra nhiều cơ hội nhưng cũng đặt ra không ít thách thức. Đây là một vấn đề khá mới mẻ tại Việt Nam, đặc biệt là thị trường tín chỉ carbon - đang được cộng đồng doanh nghiệp rất quan tâm vì những lợi ích mà nó mang lại cũng như các vướng mắc về pháp lý… </p> 
 <p><strong>Những vấn đề trên được bàn thảo, giải đáp trong Chương trình Tọa đàm với chủ đề: “Thị trường tín chỉ carbon: Góc nhìn từ kinh tế, môi trường và khuôn khổ pháp lý” do Báo Pháp luật Việt Nam tổ chức vào hôm nay, 12/6, tại Phòng Hội thảo - Khách sạn Mường Thanh, TP Hồ Chí Minh.</strong> </p> 
 <p> Những vấn đề như: Quy định của pháp luật Việt Nam về tín chỉ carbon (cơ sở pháp lý để được công nhận tín chỉ carbon hiện nay tại Việt Nam…); Những mặt tích cực, những thiếu sót, bất cập, vướng mắc liên quan tới tín chỉ carbon hiện nay tại Việt Nam; Doanh nghiệp (cả doanh nghiệp phát thải lẫn doanh nghiệp cung cấp, kinh doanh tín chỉ carbon), người dân sẽ được lợi gì khi tham gia thị trường tín chỉ carbon… sẽ được các chuyên gia đầu ngành, khách mời ở các Bộ ngành, doanh nghiệp… giải đáp, kiến nghị.</p>
</div> 
<p style="text-align: justify;"><em>GS. TS Võ Xuân Vinh (Viện trưởng Viện Nghiên cứu Kinh doanh, ĐH Kinh tế TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước</strong></p> 
<p style="text-align: justify;">“Việt Nam có hơn 14 triệu ha rừng, với tiềm năng tạo ra tín chỉ carbon từ các dự án bảo vệ và phục hồi rừng. Các chương trình như REDD+ (Reducing Emissions from Deforestation and Forest Degradation) đã giúp Việt Nam đạt được hàng triệu tín chỉ carbon từ việc bảo vệ và phục hồi rừng.</p> 
<p style="text-align: justify;"> Với ước tính có thể bán ra 57 triệu tín chỉ carbon cho các tổ chức quốc tế, Việt Nam có thể thu về hàng trăm triệu USD/năm. Giá tín chỉ carbon hiện tại khoảng 5 USD/tín chỉ.</p> 
<p style="text-align: justify;">Vậy số tiền này sẽ được chi trả cho người trồng rừng hay chi trả cho Nhà nước, hay theo tỷ lệ nào?. </p> 
<p style="text-align: justify;">Theo Điều 139 Luật Bảo vệ môi trường 2020, Nhà nước khuyến khích việc tham gia TTTC carbon và có các quy định về trách nhiệm, quyền lợi của các bên tham gia. Tuy nhiên, Luật này chưa quy định chi tiết về tỷ lệ phân chia thu nhập từ tín chỉ carbon. Do đó, tỷ lệ phân chia thu nhập có lẽ sẽ được xác định dựa trên hợp đồng thỏa thuận giữa các bên liên quan.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997609" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" data-width="692" data-height="536" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" alt="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" title="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" width="692" height="536"><br>GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)</td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Mặt khác, việc cạnh tranh trong việc bán tín chỉ carbon có thể gia tăng khi nhiều DN cùng tham gia thị trường, đòi hỏi DN phải nâng cao năng lực cạnh tranh và tìm kiếm các thị trường mới. Nguy cơ gian lận trong báo cáo và giám sát lượng phát thải cũng có thể ảnh hưởng đến uy tín và hiệu quả của DN, yêu cầu DN phải tuân thủ nghiêm ngặt các quy định và xây dựng hệ thống giám sát minh bạch.</p> 
<p style="text-align: justify;">Tôi cho rằng, phát triển một TTTC carbon nội địa mạnh mẽ là yếu tố then chốt để thúc đẩy sự tham gia của các DN và người dân. Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước, tạo ra nền tảng để các bên có thể giao dịch một cách minh bạch và hiệu quả. Bên cạnh đó, cần khuyến khích sự tham gia của các tổ chức tài chính, quỹ đầu tư vào thị trường này để tăng tính thanh khoản và đa dạng hóa các loại hình tín chỉ carbon có thể giao dịch.</p> 
<p style="text-align: justify;">Đặc biệt, nên khuyến khích đầu tư vào công nghệ xanh và các dự án giảm phát thải thông qua các chính sách hỗ trợ tài chính và ưu đãi thuế. Việc áp dụng công nghệ xanh không chỉ giúp giảm thiểu phát thải khí nhà kính, mà còn nâng cao hiệu quả sản xuất và kinh doanh của các DN. Các dự án năng lượng tái tạo, công nghệ tiết kiệm năng lượng và cải thiện quy trình sản xuất sạch là những lĩnh vực cần được ưu tiên đầu tư để đạt được mục tiêu phát triển bền vững…”.</p> 
<p style="text-align: justify;"><em>TS Võ Trung Tín (Trưởng bộ môn Luật Đất đai - Môi trường, Khoa Luật Thương mại, Trường ĐH Luật TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần có quy trình thực hiện dự án tín chỉ carbon</strong></p> 
<p style="text-align: justify;">“Về tăng cường công tác quản lý tín chỉ carbon, Bộ TN&amp;MT cần chủ trì, phối hợp các Bộ, ngành liên quan sửa đổi Nghị định 06/2022/NĐ-CP. Trong đó, tôi cho rằng cần bổ sung các quy định như với dự án tín chỉ carbon nói chung, cần có quy trình thực hiện dự án tín chỉ carbon. </p> 
<p style="text-align: justify;">Tôi cho rằng một dự án tín chỉ carbon trong khuôn khổ Công ước khung của Liên hợp quốc về biến đổi khí hậu (UNFCCC) cần trải qua các bước cơ bản như: Đăng ký ý tưởng dự án và phương pháp luận; Đăng ký dự án; Báo cáo thực hiện dự án; Thẩm định và cấp tín chỉ carbon. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Về cơ quan thẩm quyền, Chính phủ có thể giao cho từng Bộ quản lý công nhận phương pháp luận, phê duyệt ý tưởng dự án, phê duyệt dự án, cấp tín chỉ carbon phù hợp với trách nhiệm tổ chức thực hiện hệ thống giám sát - báo cáo - thẩm định (MRV) cấp lĩnh vực, cấp cơ sở thuộc phạm vi quản lý của các Bộ quản lý lĩnh vực.</p> 
<p style="text-align: justify;">Với các dự án Sáng kiến giảm phát thải từ mất rừng và suy thoái rừng (REDD), Việt Nam có độ che phủ rừng 42% nên tiềm năng thực hiện dự án tín chỉ carbon là rất lớn. Tuy nhiên, dự án REDD cũng có một số hạn chế dẫn đến tổ chức, cá nhân ngoài Nhà nước chưa thể đầu tư thực hiện. Cụ thể, chúng ta chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon. Kết quả giảm phát thải từ dự án REDD chỉ trở thành sản phẩm hàng hóa để chuyển nhượng; khi được xác nhận là tín chỉ phải qua quá trình nghiên cứu khả thi, lập dự án theo tiêu chuẩn carbon phù hợp, thẩm tra hồ sơ, xác nhận tín chỉ, phát hành và chuyển nhượng, trao đổi, bù trừ. </p> 
<p style="text-align: justify;">Đây là một quá trình đặc thù, khác với nhiều lĩnh vực khác bởi nhiều giai đoạn phải được các tổ chức độc lập thực hiện, trong khi các quy định hiện hành ở Việt Nam chưa có hoặc có nhưng không phù hợp với thị trường carbon và thông lệ quốc tế.</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997598" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="854" data-height="1280" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h5-1080.jpg" alt="TS Võ Trung Tín. (Ảnh: P.Thảo)" title="TS Võ Trung Tín. (Ảnh: P.Thảo)" width="840" height="1259"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>TS Võ Trung Tín. (Ảnh: P.Thảo)</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Vì chưa có các quy định rõ ràng về pháp lý liên quan đến đầu tư, đất đai, lâm nghiệp và cơ chế chia sẻ lợi ích giữa các bên liên quan trong dự án nên các dự án REDD chủ yếu được các cơ quan nhà nước trực tiếp triển khai. Hiện chỉ có Cty SK Forest đang dự định ký kết Thư ý định với Bộ TN&amp;MT để có cơ sở thực hiện dự án.</p> 
<p style="text-align: justify;">Về vấn đề này, tôi cho rằng, cần ban hành quy định với quyền sở hữu tín chỉ carbon rừng. Các quốc gia trên thế giới đều có xu hướng làm rõ quyền với tín chỉ carbon từ dự án REDD. Khung pháp lý cần cho nhà đầu tư hiểu rõ được họ có quyền sở hữu với carbon được cô lập từ các dự án bảo vệ rừng, quyền hưởng lợi từ việc cung cấp và bán dịch vụ giảm phát thải, quyền chuyển nhượng tín chỉ carbon, cũng như các nghĩa vụ kèm theo”. </p> 
<p style="text-align: justify;"><em>LS Lê Duy Khang (Cty Luật TNHH MTV Tín và Tâm):</em></p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Vấn đề phí và thuế chuyển nhượng với tín chỉ carbon cần được làm rõ</strong></p> 
<p style="text-align: justify;">“Hiện nay, các quy định về thuế trong Quyết định 130/2007/QĐ-TTg chỉ được áp dụng với các giao dịch tín chỉ carbon hình thành từ dự án cơ chế phát triển sạch (CDM). Các loại tín chỉ carbon khác nhau từ nhiều cơ chế khác nhau liệu có cách xử lý thuế khác nhau? Trong đó, ba vấn đề quan trọng mà các nhà đầu tư quan tâm; là tiền thu được từ việc chuyển nhượng tín chỉ carbon có được miễn thuế thu nhập hay không? Thuế giá trị gia tăng có được áp dụng với giá trị tăng thêm của tín chỉ carbon khi giao dịch trên sàn không? Trong trường hợp xuất khẩu tín chỉ carbon (bán cho đối tác nước ngoài), thuế suất với tín chỉ carbon được xác định như thế nào?</p> 
<p style="text-align: justify;">Tôi đề xuất, vấn đề thuế của tín chỉ carbon nói riêng cũng như hạn ngạch phát thải nói chung cần được nghiên cứu và ban hành đồng bộ. Dự kiến, lộ trình sàn giao dịch tín chỉ carbon sẽ được vận hành vào 2025 và đi vào hoạt động chính thức năm 2028. Nếu chậm trễ ban hành sẽ dẫn đến thiệt hại cho cả Nhà nước về thất thu ngân sách và gây khó khăn cho DN phải xử lý về mặt kế toán đối với loại tài sản mới này”.</p>





<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:43:02.580' AS DateTime), 1, 2, 6, 6, N'(PLVN) - Việt Nam chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon... Để xây dựng và phát triển một TTTC carbon đồng bộ, Việt Nam cần sớm triển khai đồng bộ một số giải pháp. Báo Pháp luật Việt Nam ghi nhận một số ý kiến đề xuất của các chuyên gia đầu ngành về vấn đề này.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (24, N'Muốn thi văn bằng 2 vào ngành Công an cần đáp ứng những điều kiện gì?', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Bộ Công an hướng dẫn:</strong> Tuyển sinh tuyển mới đào tạo trình độ đại học Công an nhân dân đối với công dân tốt nghiệp trình độ đại học trở lên các trường ngoài ngành Công an nhân dân thực hiện theo hướng dẫn tuyển sinh hàng năm của Bộ Công an.</p> 
<p style="text-align: justify;">Để được tuyển sinh, thí sinh cần đảm bảo đủ điều kiện về học lực trình độ đại học mà thí sinh đã theo học, đủ tiêu chuẩn sức khỏe và tiêu chuẩn chính trị theo quy định của Bộ Công an. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ngoài ra, thí sinh cần đáp ứng một số điều kiện cơ bản như: có tuổi đời không quá 30 tuổi (được xác định theo giấy khai sinh, tính đến ngày dự thi); chiều cao đạt từ 1m64 đến 1m95 đối với nam; chỉ số khối cơ thể (BMI) được tính bằng trọng lượng (đơn vị tính: ki-lô-gam) chia cho bình phương chiều cao (đơn vị tính: mét) đạt từ 18,5 đến 30; nếu mắt bị khúc xạ thì không quá 3 đi-ốp; xếp hạng bằng tốt nghiệp đại học từ loại khá trở lên... </p> 
<p style="text-align: justify;">Để biết cụ thể hơn về các điều kiện dự tuyển, thí sinh cần theo dõi thông tin tuyển sinh được thông báo công khai trên các phương tiện thông tin đại chúng, các buổi tuyên truyền hướng nghiệp của các học viện, trường Công an nhân dân để biết cụ thể về tiêu chuẩn, điều kiện dự tuyển trong năm tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:43:02.580' AS DateTime), 1, 3, 7, 7, N'(PLVN) - Sinh viên một trường đại học muốn sau khi tốt nghiệp sẽ đăng ký vào trường Công an nhân dân theo phương án thi Văn bằng 2. Vậy để được thi Văn bằng 2 vào ngành công an cần chuẩn bị những điều kiện gì?')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (25, N'Thay đổi mẫu giấy thi tốt nghiệp THPT năm 2024', N'https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_05_17/thi-tot-nghiep-thpt-2022-2-454-7836.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Theo Cục trưởng Cục Quản lý chất lượng Huỳnh Văn Chương, từ kỳ thi năm nay, Bộ GD&amp;ĐT sẽ sửa lại mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT. Điều này thực hiện theo đề nghị của các sở GD&amp;ĐT để tránh nhầm lẫn cho thí sinh.</p> 
<p style="text-align: justify;">Trước đây, khi kỳ thi đại học được tổ chức theo cụm, số báo danh của thí sinh gồm cả phần chữ và số, ví dụ như "BKA012345". Những năm gần đây, số báo danh chỉ còn phần số, nhưng giấy thi vẫn in lưu ý "Thí sinh phải ghi cả phần chữ và số". Theo các Sở GD&amp;ĐT, điều này khiến nhiều thí sinh nhầm lẫn, ghi dưới dạng "012345 (không một hai ba bốn năm)". </p> 
<p style="text-align: justify;">Vì vậy, Bộ ban hành mẫu giấy thi tự luận mới, bỏ phần ghi chú này. Thí sinh chỉ cần ghi đúng số báo danh của mình là đủ (ví dụ 012345).</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997700" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" data-width="1130" data-height="797" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" alt="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." title="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." width="840" height="592"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024.</p></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Với phiếu trả lời trắc nghiệm, Bộ GD&amp;ĐT giữ nguyên mẫu cũ. Thí sinh cần ghi đầy đủ thông tin, 6 chữ số cuối của số báo danh, đồng thời tô kín các ô tròn trong bảng số phía dưới (tương ứng với các chữ số đã ghi).</p> 
<p style="text-align: justify;">Ở phần trả lời, với mỗi câu trắc nghiệm, thí sinh chọn và tô kín một ô tròn trong các đáp án A, B, C, D.</p> 
<p style="text-align: justify;">Thí sinh không được tô vào phương án có số thứ tự không tương ứng với câu hỏi trắc nghiệm trong đề thi.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997702" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" data-width="595" data-height="854" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" alt="Phiếu trả lời các môn thi trắc nghiệm." title="Phiếu trả lời các môn thi trắc nghiệm." width="595" height="854"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Phiếu trả lời các môn thi trắc nghiệm.</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Kỳ thi tốt nghiệp THPT năm nay sẽ diễn ra từ 26/6 đến 28/6. Cụ thể, ngày 26/6, thí sinh làm thủ tục dự thi; ngày 27 và 28/6 diễn ra kỳ thi chính thức; 29/6 là ngày dự phòng.</p> 
<p style="text-align: justify;">Thí sinh tham gia làm 4 bài thi bắt buộc, gồm Toán, Ngữ văn, Ngoại ngữ và một trong hai bài thi Khoa học Tự nhiên hoặc Khoa học Xã hội.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Thời gian công bố kết quả thi tốt nghiệp dự kiến vào 8h ngày 17/7. Sau đó, các địa phương tiến hành xét tốt nghiệp cho học sinh dự thi và sử dụng kết quả thi tốt nghiệp để xét tuyển sinh đại học, cao đẳng theo kế hoạch tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:54:59.157' AS DateTime), 1, 1, 8, 8, N'(PLVN) - Để tránh nhầm lẫn cho thí sinh khi viết số báo danh, Bộ GD&ĐT sẽ thay đổi mẫu giấy thi tốt nghiệp THPT năm nay.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (26, N'Vị thế, uy tín của Việt Nam trên trường quốc tế (Kỳ 3): Thành viên tích cực, có trách nhiệm của cộng đồng quốc tế', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Đóng góp tích cực vào việc giữ gìn hòa bình thế giới</strong></p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị Đối ngoại toàn quốc triển khai thực hiện Nghị quyết Đại hội lần thứ XIII của Đảng (tháng 12/2021), Tổng Bí thư Nguyễn Phú Trọng nêu rõ, bất kỳ quốc gia, dân tộc nào trong quá trình hình thành và phát triển cũng đều phải xử lý hai vấn đề cơ bản là đối nội và đối ngoại. Hai vấn đề này có mối quan hệ hữu cơ, biện chứng, tác động qua lại, hỗ trợ lẫn nhau như hai cái cánh của một con chim, tạo thế và lực cho nhau, nhất là trong điều kiện toàn cầu hoá phát triển mạnh mẽ và sâu rộng. </p> 
<p style="text-align: justify;">Đúng như những nhận định của người đứng đầu Đảng ta, đối ngoại ngày nay không chỉ là sự nối tiếp của chính sách đối nội, mà còn là một động lực mạnh mẽ cho sự phát triển của các quốc gia, dân tộc. Thông qua những hoạt động đối ngoại, vị thế và uy tín quốc tế của nước ta trong khu vực và trên thế giới ngày càng được nâng cao, đóng góp tích cực và trách nhiệm vào việc giữ vững hoà bình, hợp tác phát triển và tiến bộ trên thế giới. Đây cũng chính là quyết tâm mà Đại hội lần thứ XIII của Đảng đã thống nhất rất cao: “Chủ động và tích cực hội nhập quốc tế toàn diện, sâu rộng; Việt Nam là bạn, là đối tác tin cậy và là thành viên tích cực, có trách nhiệm trong cộng đồng quốc tế”. </p> 
<p style="text-align: justify;">Kể từ khi Liên hợp quốc (LHQ) chính thức kết nạp Việt Nam trở thành quốc gia thành viên thứ 149 vào năm 1977, chúng ta đã không ngừng nỗ lực, chủ động và trách nhiệm đóng góp vào mục tiêu chung của thế giới, nhất là việc Việt Nam tham gia hoạt động gìn giữ hòa bình (GGHB) của LHQ. Cụ thể, tháng 11/2012, Bộ Chính trị thông qua Đề án tổng thể về việc Việt Nam tham gia hoạt động GGHB LHQ; sau đó, Quốc hội thông qua Nghị quyết số 130/2020/QH14 về tham gia lực lượng GGHB của LHQ. Đây là những bằng chứng thuyết phục cho cam kết của Việt Nam trong việc tham gia và giải quyết các vấn đề chung của quốc tế.</p> 
<p style="text-align: justify;">Ngày 27/5/2014, Trung tâm GGHB Việt Nam được thành lập. Ngay khi ra mắt, Trung tâm đã cử 2 sĩ quan đầu tiên đi làm nhiệm vụ cùng Phái bộ GGHB của LHQ tại Nam Sudan. Từ đây, những sĩ quan Quân đội nhân dân (QĐND) Việt Nam mang trên đầu chiếc mũ nồi xanh và mang trong tim dòng máu Lạc Hồng, truyền thống đoàn kết, nhân nghĩa của dân tộc để sẵn sàng nhận nhiệm vụ ở bất cứ đâu, mang lại hòa bình, ấm no, thịnh vượng cho mọi người dân trên thế giới. Đến năm 2022, Công an nhân dân Việt Nam cũng chính thức tham gia GGHB LHQ.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Trong 10 năm Việt Nam triển khai lực lượng tham gia sứ mệnh GGHB, chúng ta đã cử trên 800 lượt sĩ quan, quân nhân chuyên nghiệp triển khai theo hình thức cá nhân và đơn vị, trong đó có 5 thê đội (bộ phận của đội hình được sắp xếp theo bậc thang để hành động theo thứ tự - NV) của Bệnh viện dã chiến cấp 2 triển khai tại Phái bộ Nam Sudan; 2 thê đội của Đội Công binh triển khai tại khu vực Abyei và 114 lượt sĩ quan triển khai theo hình thức cá nhân. Số lượng cán bộ, sĩ quan hoàn thành xuất sắc nhiệm vụ của Việt Nam cao hơn nhiều so với mặt bằng chung của LHQ. Không chỉ vậy, Đội Công binh Việt Nam ở khu vực Abyei đã giúp đỡ chính quyền và người dân địa phương bằng những hành động thiết thực như xây dựng và tu sửa đường; xây dựng, cải tạo lớp học; dạy học tình nguyện; khoan giếng nước tặng khu dân cư địa phương và các trường học; khám, chữa bệnh, tư vấn sức khỏe và cấp phát thuốc miễn phí cho người dân...</p> 
<p style="text-align: justify;"><strong>Tinh thần đoàn kết quốc tế cao cả</strong></p> 
<p style="text-align: justify;">Cùng với việc hoàn thành nhiều trọng trách quốc tế quan trọng, Việt Nam đã đề xuất nhiều sáng kiến, giải pháp thúc đẩy hợp tác, đóng góp có trách nhiệm vào các vấn đề chung của thế giới như phòng, chống dịch bệnh, thiên tai, biến đổi khí hậu, an ninh lương thực; cử lực lượng hỗ trợ khắc phục hậu quả động đất tại Thổ Nhĩ Kỳ…</p> 
<p style="text-align: justify;"> “Cảm ơn Việt Nam” là câu nói xúc động của Tổng thống Thổ Nhĩ Kỳ Tayyip Erdogan khi gặp đoàn cứu hộ, cứu nạn của QĐND Việt Nam tại hai tỉnh Hatay và Kahramanmaras (tháng 2/2023). Ông nhấn mạnh, thảm họa động đất một lần nữa cho thấy tầm quan trọng của tình đoàn kết quốc tế. Thổ Nhĩ Kỳ sẽ không bao giờ quên tình bạn đó. Không chỉ là một trong những quốc gia đầu tiên nhanh chóng cử các lực lượng tham gia công tác tìm kiếm, cứu nạn, hỗ trợ người dân Thổ Nhĩ Kỳ, đoàn cứu hộ, cứu nạn của QĐND Việt Nam còn trao gần 25 tấn hàng viện trợ của Bộ Quốc phòng, gồm lương khô, gạo, sữa, thiết bị y tế và nhiều nhu yếu phẩm khác tặng Thổ Nhĩ Kỳ. Cùng với đó, đoàn công tác cứu nạn, cứu hộ quốc tế của Bộ Công an Việt Nam đã trao tặng 2 tấn thiết bị y tế cho Thổ Nhĩ Kỳ… </p> 
<p style="text-align: justify;">Gần đây, vào tháng 11/2023, thông qua LHQ, Việt Nam đã đóng góp 500.000 USD để cứu trợ nhân đạo người dân Palestine bị ảnh hưởng bởi xung đột ở dải Gaza, thể hiện tinh thần đoàn kết với nhân dân Palestine. Trước đó, khi động đất và sóng thần gây thiệt hại lớn tại Nhật Bản vào năm 2011, Chính phủ Việt Nam đã trợ giúp nhân dân Nhật Bản 200.000 USD để góp phần khắc phục hậu quả. Ngoài ra, hưởng ứng lời kêu gọi của Hội Chữ thập đỏ Việt Nam, đã có hàng nghìn tổ chức, cá nhân ủng hộ nhân dân Nhật Bản bị thiên tai với hơn 161 tỷ đồng (tương đương 7,783 triệu USD). </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Thể hiện vai trò nòng cốt, dẫn dắt, hòa giải</strong></p> 
<p style="text-align: justify;">Để triển khai hiệu quả, thực chất đường lối đối ngoại, tháng 8/2018, Ban Bí thư đã ban hành Chỉ thị số 25-CT/TW về đẩy mạnh và nâng tầm đối ngoại đa phương đến năm 2030, trong đó xác định: phấn đấu đóng vai trò nòng cốt, dẫn dắt, hòa giải tại các diễn đàn đa phương có tầm quan trọng chiến lược đối với đất nước, phù hợp với khả năng và điều kiện cụ thể. </p> 
<p style="text-align: justify;">Nhờ những định hướng này, vào năm Việt Nam đảm nhận vai trò Chủ tịch ASEAN 2020 đã thành công toàn diện, là một đỉnh cao thắng lợi của đường lối đối ngoại đa phương của Đảng. Theo đó, đã thông qua hơn 550 cuộc họp, nhiều sáng kiến, ưu tiên của Việt Nam đã trở thành tài sản chung của ASEAN. Trong Năm Chủ tịch ASEAN 2020 của Việt Nam, rất nhiều cái “đầu tiên” đã được sáng tạo để hoàn thành các mục tiêu đề ra: số lượng các Hội nghị tăng lên để kịp thời ứng phó với dịch Covid-19; nhiều Hội nghị Cấp cao, Bộ trưởng lần đầu được tổ chức trực tuyến; nhiều văn kiện quan trọng của ASEAN cũng được ký kết trực tuyến lần đầu tiên. Điều này đã minh chứng cho năng lực công nghệ và khả năng của Việt Nam trong kỷ nguyên chuyển đổi số.</p> 
<p style="text-align: justify;">Chúng ta đã không chỉ khéo léo, linh hoạt dẫn dắt, điều hòa những khác biệt giữa các quốc gia thành viên ASEAN để giữ vững hình ảnh đoàn kết, đồng thuận của Hiệp hội, mà còn xử lý hài hòa, hiệu quả các bất đồng giữa các đối tác, qua đó tất cả các hội nghị trong năm diễn ra thành công. Với thành công của Năm Chủ tịch ASEAN 2020, Việt Nam không còn chỉ là một thành viên tích cực, luôn nghiêm túc thực thi các thỏa thuận đã cam kết, mà đã trở thành một chỗ dựa vững chắc, tin cậy, đặc biệt trong những thời khắc ASEAN phải đối mặt với nhiều khó khăn, thách thức.</p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị tổng kết 2 năm Việt Nam đảm nhiệm cương vị Ủy viên không thường trực Hội đồng Bảo an LHQ nhiệm kỳ 2020 - 2021 (tháng 1/2022), Thủ tướng Phạm Minh Chính nêu rõ, việc Việt Nam lần thứ hai đảm nhiệm vị trí quan trọng này (chỉ hơn 10 năm sau khi kết thúc nhiệm kỳ đầu tiên) với số phiếu bầu gần như tuyệt đối (192/193 phiếu) cho thấy vị thế của đất nước và sự tín nhiệm cao của quốc tế đối với chính sách đối ngoại của chúng ta… Việt Nam đã khẳng định được năng lực điều hành, từng bước thể hiện rõ vai trò nòng cốt, dẫn dắt, hòa giải tại các hội nghị Hội đồng Bảo an với nhiều dấu ấn tích cực, được các nước ủy viên Hội đồng Bảo an, kể cả các nước ủy viên thường trực, các nước bạn bè truyền thống, đang phát triển, các nước trong Phong trào không liên kết... coi trọng, đánh giá cao. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Tại cuộc gặp với Tổng Bí thư Nguyễn Phú Trọng trong khuôn khổ chuyến thăm chính thức Việt Nam (tháng 10/2022), Tổng Thư ký LHQ António Guterres cho rằng Việt Nam luôn thể hiện lập trường nguyên tắc trên những vấn đề về bảo vệ hòa bình, phát triển bền vững, đề cao Hiến chương LHQ, luật pháp quốc tế, nhất là những nguyên tắc cơ bản nhất. Việt Nam cũng tích cực hợp tác cùng LHQ và các đối tác quốc tế ứng phó với các vấn đề an ninh phi truyền thống ngày càng gay gắt.</p> 
<p style="text-align: justify;"> Những nỗ lực không ngừng nghỉ và những thành quả to lớn trong công tác đối ngoại Đảng, ngoại giao Nhà nước và đối ngoại nhân dân của Việt Nam đã góp phần rất quan trọng vào thành tựu chung to lớn, có ý nghĩa lịch sử của đất nước, như Đại hội XIII của Đảng đã khẳng định: “Đất nước ta chưa bao giờ có được cơ đồ, tiềm lực, vị thế và uy tín quốc tế như ngày nay”.</p> 
<blockquote style="text-align: justify;" class="quote cms-quote"> 
 <table class="picture"> 
  <tbody> 
   <tr> 
    <td class="pic"><img data-image-id="997611" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="740" data-height="416" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tong-thu-ky-lhq-antonio-guterres-anh-reuters-2301.jpeg" alt="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" title="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" width="740" height="416"></td> 
   </tr> 
   <tr> 
    <td class="caption"><p>Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)</p> </td> 
   </tr> 
  </tbody> 
 </table> 
 <p>“Cách đây chưa đầy một thế hệ, các nhân viên LHQ đã ở Việt Nam, hỗ trợ lương thực cho một quốc gia bị chiến tranh tàn phá và cô lập. Cũng chính Việt Nam hôm nay đã và đang gửi những người lính gìn giữ hòa bình đến giúp đỡ người dân ở những nơi khó khăn nhất trên thế giới, cách xa quê hương hàng nghìn dặm” - Tổng Thư ký LHQ Antonio Guterres chia sẻ tại Lễ kỷ niệm 45 năm Việt Nam gia nhập LHQ. </p> 
</blockquote>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Vân Thanh">Vân Thanh</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:54:59.157' AS DateTime), 1, 3, 9, 9, N'(PLVN) - Quán triệt tư tưởng mà Chủ tịch Hồ Chí Minh từng nhấn mạnh “giữ gìn hòa bình thế giới tức là giữ gìn lợi ích của nước ta”, Đảng và Nhà nước ta đã triển khai hiệu quả đường lối đối ngoại trên tinh thần chủ động và phát huy vai trò tại các cơ chế đa phương, là thành viên tích cực, có trách nhiệm của cộng đồng quốc tế.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (27, N'Việt Nam được bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003 về bảo vệ di sản văn hoá phi vật thể', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" data-image-id="997747" data-width="1600" data-height="949" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" width="840" height="498"></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;"><em>Các đại biểu tham dự kỳ họp.</em></p> 
<p style="text-align: justify;">Theo phóng viên TTXVN tại Pháp, ngày 11/6, tại Trụ sở Tổ chức Giáo dục, Khoa học và Văn hoá Liên hợp quốc (UNESCO) ở thủ đô Paris, Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), đã khai mạc với sự tham dự của 183 quốc gia thành viên và hơn 100 quan sát viên. Thứ trưởng Bộ Ngoại giao Hà Kim Ngọc, Chủ tịch Ủy ban Quốc gia UNESCO Việt Nam, dẫn đầu Đoàn Việt Nam tham dự kỳ họp này.</p> 
<p style="text-align: justify;">Tại phiên khai mạc, Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003, đưa số lượng các cơ chế then chốt của UNESCO mà Việt Nam tham gia lên con số 6 (thành viên Uỷ ban Di sản thế giới và Hội đồng Chấp hành UNESCO, Phó Chủ tịch Đại hội đồng UNESCO, Phó Chủ tịch Ủy ban liên Chính phủ Công ước 2005 về bảo vệ và phát huy sự đa dạng của các biểu đạt văn hóa, Phó Chủ tịch Ủy ban liên Chính phủ và Phó Chủ tịch Đại hội đồng Công ước 2003).</p> 
<p style="text-align: justify;">Chủ tịch Uỷ ban Quốc gia UNESCO Việt Nam Hà Kim Ngọc nhấn mạnh ý nghĩa quan trọng của sự kiện này, một lần nữa cho thấy vị thế và uy tín quốc tế ngày càng cao của Việt Nam, sự ủng hộ, tin tưởng của cộng đồng quốc tế đối với vai trò và năng lực điều hành của ta tại các thể chế đa phương toàn cầu, và đặc biệt là sự ghi nhận đối với những đóng góp của Việt Nam trong gìn giữ, bảo tồn và phát huy giá trị di sản phi vật thể trong nước và trên thế giới. Đây cũng là kết quả của việc triển khai chính sách đối ngoại đúng đắn của Đảng và Nhà nước về đa phương hóa, đa dạng hóa và hội nhập quốc tế toàn diện, sâu rộng, chủ trương đẩy mạnh và nâng tầm đối ngoại đa phương, cũng như Chiến lược Ngoại giao văn hoá đến năm 2030.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ở vị trí điều hành, Việt Nam sẽ trực tiếp tham gia vào quá trình xây dựng, thông qua các quyết định quan trọng của UNESCO về văn hóa, đóng góp hơn nữa cho việc hoàn thiện, thực hiện các mục tiêu của Công ước 2003, cũng như tranh thủ các chương trình, kế hoạch, sáng kiến của UNESCO phục vụ phát triển đất nước, bảo tồn và phát huy giá trị di sản, bảo đảm cao nhất lợi ích quốc gia, dân tộc trong hợp tác văn hóa ở tầm toàn cầu.</p> 
<p style="text-align: justify;">Phát biểu tại phiên khai mạc toàn thể của Kỳ họp lần thứ 10, Thứ trưởng Ngoại giao Hà Kim Ngọc đánh giá cao nỗ lực của Ủy ban liên Chính phủ, Ban thư ký và các quốc gia thành viên Công ước 2003 trong thúc đẩy các mục tiêu của Công ước, nâng cao nhận thức về vai trò của bảo vệ và trao truyền di sản phi vật thể, đặt cộng đồng vào trung tâm của nỗ lực bảo tồn di sản. Thứ trưởng khẳng định Việt Nam, với 15 di sản văn hóa phi vật thể đã được ghi danh và 550 di sản văn hóa phi vật thể cấp quốc gia, luôn luôn quan tâm bảo vệ di sản văn hóa phi vật thể, không ngừng xây dựng và hoàn thiện chính sách, luật pháp quốc gia, và gần đây nhất là Chương trình Mục tiêu Quốc gia về Phát triển Văn hóa đến 2045, và Luật Di sản văn hóa sửa đổi.</p> 
<p style="text-align: justify;">Thứ trưởng Hà Kim Ngọc đề xuất UNESCO và các nước thành viên cần tiếp tục tăng cường hợp tác quốc tế, triển khai hiệu quả Công ước, ưu tiên chia sẻ kinh nghiệm, tăng cường năng lực cho các nước đang phát triển, các quốc gia Châu Phi, nhóm đảo nhỏ đang phát triển, thúc đẩy tham gia và đóng góp của cộng đồng, phụ nữ và thanh niên.</p> 
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" data-image-id="997748" data-width="1600" data-height="766" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" width="840" height="402"></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Các đại biểu chụp ảnh chung.</p> 
<p style="text-align: justify;">Các quốc gia thành viên Công ước 2003 đánh giá cao những kinh nghiệm, hiểu biết và nỗ lực của Việt Nam trong bảo vệ và phát huy di sản văn hoá phi vật thể ở cả phương diện lý luận, luật pháp và thực tiễn, là bài học tốt cho nhiều quốc gia ở khu vực và quốc tế, góp phần bảo vệ khẩn cấp những di sản có nguy cơ bị mai một, gìn giữ những di sản đại diện cho nhân loại và quảng bá những hình mẫu di sản được bảo vệ tốt trên thế giới.</p> 
<p style="text-align: justify;">Diễn ra trong hai ngày, 11 và 12/6, Kỳ họp lần thứ 10 của Đại hội đồng Công ước 2003 là dịp để các nước thành viên cùng nhau thảo luận các vấn đề quan trọng đối với tương lai của Công ước và hướng các nỗ lực của các quốc gia và cộng đồng vào việc bảo vệ di sản sống của thế giới. Các chủ đề chính trong chương trình nghị sự bao gồm: tổng kết các hoạt động của Đại hội đồng giai đoạn 2022-2023; xem xét việc triển khai rộng rãi hơn Điều 18 của Công ước; xây dựng kế hoạch sử dụng nguồn lực của Quỹ Di sản văn hóa phi vật thể vào năm 2024 và 2025; công nhận các tổ chức phi chính phủ mới và bầu 12 thành viên mới của Ủy ban.</p> 
<p style="text-align: justify;">Đại hội đồng Công ước 2003 là cơ quan quyền lực cao nhất của UNESCO trong lĩnh vực bảo vệ di sản văn hoá phi vật thể, gồm đại diện của 183 nước thành viên. Đại hội đồng quyết định những vấn đề quan trọng liên quan đến chính sách, đường lối phát triển của Công ước, phân bổ kinh phí hỗ trợ công tác bảo tồn di sản phi vật thể ở các quốc gia, bầu Uỷ ban liên Chính phủ Công ước 2003. Việt Nam chính thức tham gia Công ước 2003 vào ngày 05/09/2005, trở thành một trong 30 quốc gia đầu tiên trên thế giới gia nhập Công ước quan trọng này. Là một thành viên tích cực và có trách nhiệm, Việt Nam đã 2 lần được tín nhiệm, trúng cử vào Ủy ban Liên Chính phủ về bảo vệ di sản văn hóa phi vật thể. Tinh thần của Công ước đã được vận dụng vào Luật sửa đổi, bổ sung một số điều của Luật Di sản văn hóa năm 2009 và vào thực tiễn hoạt động bảo vệ và phát huy giá trị di sản văn hóa phi vật thể ở Việt Nam, với những kết quả rất đáng ghi nhận.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện nay, Việt Nam đang trong quá trình hoàn thiện, đệ trình và thúc đẩy việc ghi danh các hồ sơ đề cử như: Quần thể di tích và danh thắng Yên Tử - Vĩnh Nghiêm - Côn Sơn, Kiếp Bạc; Khu di tích khảo cổ Óc Eo-Ba Thê; Hang Con Moong; Lễ hội Vía bà Chúa Xứ núi Sam; Nghệ thuật Tranh dân gian Đông Hồ; Nghệ thuật Chèo; Mo Mường; Công viên địa chất Lạng Sơn; và đặc biệt là Dự án bảo tồn và phát huy giá trị khu Trung tâm Hoàng thành Thăng Long - Hà Nội.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Theo TTXVN">Theo TTXVN</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:54:59.157' AS DateTime), 1, 1, 10, 10, N'Tại phiên khai mạc Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (28, N'Truy tìm đối tượng tên ''Hoàng'' nghi hiếp dâm trẻ em', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Thông tin từ Công an TP Hà Nội, Cơ quan CSĐT Công an quận Thanh Xuân đang điều tra vụ án hình sự "Hiếp dâm người dưới 16 tuổi" xảy ra trong khoảng thời gian từ ngày 20/8/2022 đến ngày 27/2/2023 tại nhà nghỉ trên địa bàn phường Nhân Chính, quận Thanh Xuân.</p> 
<p style="text-align: justify;">Ngày 23/5/2024, Cơ quan CSĐT - Công an quận Thanh Xuân đã ra quyết định khởi tố vụ án hình sự “hiếp dâm” người dưới 16 tuổi để điều tra làm rõ vụ án. Theo đó, Công an quận Thanh Xuân xác định đối tượng tình nghi có hành vi hiếp dâm người dưới 16 tuổi tên là “Hoàng”. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện chưa rõ nhân thân lai lịch của đối tượng. Để phục vụ điều tra, Công an quận Thanh Xuân quyết định truy tìm đối tượng trên.</p> 
<p style="text-align: justify;">"Ai biết thông tin về đối tượng thì báo ngay cho Cơ quan CSĐT Công an quận Thanh Xuân (SĐT: 0866.183.988), cơ quan Công an nơi gần nhất hoặc cung cấp thông tin qua trang facebook Công an thành phố Hà Nội để phối hợp giải quyết vụ việc theo quy định", Công an TP Hà Nội thông báo.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Bùi Lan">Bùi Lan</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:54:59.157' AS DateTime), 1, 2, 10, 11, N'(PLVN) - Ai biết thông tin về đối tượng trong ảnh ở đâu cần báo ngay cho Công an quận Thanh Xuân, TP Hà Nội, theo số điện thoại 0866.183.988.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (29, N'Cần giải pháp đồng bộ để quản lý thị trường tín chỉ carbon', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<div class="notebox nright cms-note" align="right" style="text-align: justify;">
 <p> Kinh tế xanh đang mở ra nhiều cơ hội nhưng cũng đặt ra không ít thách thức. Đây là một vấn đề khá mới mẻ tại Việt Nam, đặc biệt là thị trường tín chỉ carbon - đang được cộng đồng doanh nghiệp rất quan tâm vì những lợi ích mà nó mang lại cũng như các vướng mắc về pháp lý… </p> 
 <p><strong>Những vấn đề trên được bàn thảo, giải đáp trong Chương trình Tọa đàm với chủ đề: “Thị trường tín chỉ carbon: Góc nhìn từ kinh tế, môi trường và khuôn khổ pháp lý” do Báo Pháp luật Việt Nam tổ chức vào hôm nay, 12/6, tại Phòng Hội thảo - Khách sạn Mường Thanh, TP Hồ Chí Minh.</strong> </p> 
 <p> Những vấn đề như: Quy định của pháp luật Việt Nam về tín chỉ carbon (cơ sở pháp lý để được công nhận tín chỉ carbon hiện nay tại Việt Nam…); Những mặt tích cực, những thiếu sót, bất cập, vướng mắc liên quan tới tín chỉ carbon hiện nay tại Việt Nam; Doanh nghiệp (cả doanh nghiệp phát thải lẫn doanh nghiệp cung cấp, kinh doanh tín chỉ carbon), người dân sẽ được lợi gì khi tham gia thị trường tín chỉ carbon… sẽ được các chuyên gia đầu ngành, khách mời ở các Bộ ngành, doanh nghiệp… giải đáp, kiến nghị.</p>
</div> 
<p style="text-align: justify;"><em>GS. TS Võ Xuân Vinh (Viện trưởng Viện Nghiên cứu Kinh doanh, ĐH Kinh tế TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước</strong></p> 
<p style="text-align: justify;">“Việt Nam có hơn 14 triệu ha rừng, với tiềm năng tạo ra tín chỉ carbon từ các dự án bảo vệ và phục hồi rừng. Các chương trình như REDD+ (Reducing Emissions from Deforestation and Forest Degradation) đã giúp Việt Nam đạt được hàng triệu tín chỉ carbon từ việc bảo vệ và phục hồi rừng.</p> 
<p style="text-align: justify;"> Với ước tính có thể bán ra 57 triệu tín chỉ carbon cho các tổ chức quốc tế, Việt Nam có thể thu về hàng trăm triệu USD/năm. Giá tín chỉ carbon hiện tại khoảng 5 USD/tín chỉ.</p> 
<p style="text-align: justify;">Vậy số tiền này sẽ được chi trả cho người trồng rừng hay chi trả cho Nhà nước, hay theo tỷ lệ nào?. </p> 
<p style="text-align: justify;">Theo Điều 139 Luật Bảo vệ môi trường 2020, Nhà nước khuyến khích việc tham gia TTTC carbon và có các quy định về trách nhiệm, quyền lợi của các bên tham gia. Tuy nhiên, Luật này chưa quy định chi tiết về tỷ lệ phân chia thu nhập từ tín chỉ carbon. Do đó, tỷ lệ phân chia thu nhập có lẽ sẽ được xác định dựa trên hợp đồng thỏa thuận giữa các bên liên quan.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997609" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" data-width="692" data-height="536" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" alt="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" title="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" width="692" height="536"><br>GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)</td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Mặt khác, việc cạnh tranh trong việc bán tín chỉ carbon có thể gia tăng khi nhiều DN cùng tham gia thị trường, đòi hỏi DN phải nâng cao năng lực cạnh tranh và tìm kiếm các thị trường mới. Nguy cơ gian lận trong báo cáo và giám sát lượng phát thải cũng có thể ảnh hưởng đến uy tín và hiệu quả của DN, yêu cầu DN phải tuân thủ nghiêm ngặt các quy định và xây dựng hệ thống giám sát minh bạch.</p> 
<p style="text-align: justify;">Tôi cho rằng, phát triển một TTTC carbon nội địa mạnh mẽ là yếu tố then chốt để thúc đẩy sự tham gia của các DN và người dân. Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước, tạo ra nền tảng để các bên có thể giao dịch một cách minh bạch và hiệu quả. Bên cạnh đó, cần khuyến khích sự tham gia của các tổ chức tài chính, quỹ đầu tư vào thị trường này để tăng tính thanh khoản và đa dạng hóa các loại hình tín chỉ carbon có thể giao dịch.</p> 
<p style="text-align: justify;">Đặc biệt, nên khuyến khích đầu tư vào công nghệ xanh và các dự án giảm phát thải thông qua các chính sách hỗ trợ tài chính và ưu đãi thuế. Việc áp dụng công nghệ xanh không chỉ giúp giảm thiểu phát thải khí nhà kính, mà còn nâng cao hiệu quả sản xuất và kinh doanh của các DN. Các dự án năng lượng tái tạo, công nghệ tiết kiệm năng lượng và cải thiện quy trình sản xuất sạch là những lĩnh vực cần được ưu tiên đầu tư để đạt được mục tiêu phát triển bền vững…”.</p> 
<p style="text-align: justify;"><em>TS Võ Trung Tín (Trưởng bộ môn Luật Đất đai - Môi trường, Khoa Luật Thương mại, Trường ĐH Luật TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần có quy trình thực hiện dự án tín chỉ carbon</strong></p> 
<p style="text-align: justify;">“Về tăng cường công tác quản lý tín chỉ carbon, Bộ TN&amp;MT cần chủ trì, phối hợp các Bộ, ngành liên quan sửa đổi Nghị định 06/2022/NĐ-CP. Trong đó, tôi cho rằng cần bổ sung các quy định như với dự án tín chỉ carbon nói chung, cần có quy trình thực hiện dự án tín chỉ carbon. </p> 
<p style="text-align: justify;">Tôi cho rằng một dự án tín chỉ carbon trong khuôn khổ Công ước khung của Liên hợp quốc về biến đổi khí hậu (UNFCCC) cần trải qua các bước cơ bản như: Đăng ký ý tưởng dự án và phương pháp luận; Đăng ký dự án; Báo cáo thực hiện dự án; Thẩm định và cấp tín chỉ carbon. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Về cơ quan thẩm quyền, Chính phủ có thể giao cho từng Bộ quản lý công nhận phương pháp luận, phê duyệt ý tưởng dự án, phê duyệt dự án, cấp tín chỉ carbon phù hợp với trách nhiệm tổ chức thực hiện hệ thống giám sát - báo cáo - thẩm định (MRV) cấp lĩnh vực, cấp cơ sở thuộc phạm vi quản lý của các Bộ quản lý lĩnh vực.</p> 
<p style="text-align: justify;">Với các dự án Sáng kiến giảm phát thải từ mất rừng và suy thoái rừng (REDD), Việt Nam có độ che phủ rừng 42% nên tiềm năng thực hiện dự án tín chỉ carbon là rất lớn. Tuy nhiên, dự án REDD cũng có một số hạn chế dẫn đến tổ chức, cá nhân ngoài Nhà nước chưa thể đầu tư thực hiện. Cụ thể, chúng ta chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon. Kết quả giảm phát thải từ dự án REDD chỉ trở thành sản phẩm hàng hóa để chuyển nhượng; khi được xác nhận là tín chỉ phải qua quá trình nghiên cứu khả thi, lập dự án theo tiêu chuẩn carbon phù hợp, thẩm tra hồ sơ, xác nhận tín chỉ, phát hành và chuyển nhượng, trao đổi, bù trừ. </p> 
<p style="text-align: justify;">Đây là một quá trình đặc thù, khác với nhiều lĩnh vực khác bởi nhiều giai đoạn phải được các tổ chức độc lập thực hiện, trong khi các quy định hiện hành ở Việt Nam chưa có hoặc có nhưng không phù hợp với thị trường carbon và thông lệ quốc tế.</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997598" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="854" data-height="1280" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h5-1080.jpg" alt="TS Võ Trung Tín. (Ảnh: P.Thảo)" title="TS Võ Trung Tín. (Ảnh: P.Thảo)" width="840" height="1259"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>TS Võ Trung Tín. (Ảnh: P.Thảo)</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Vì chưa có các quy định rõ ràng về pháp lý liên quan đến đầu tư, đất đai, lâm nghiệp và cơ chế chia sẻ lợi ích giữa các bên liên quan trong dự án nên các dự án REDD chủ yếu được các cơ quan nhà nước trực tiếp triển khai. Hiện chỉ có Cty SK Forest đang dự định ký kết Thư ý định với Bộ TN&amp;MT để có cơ sở thực hiện dự án.</p> 
<p style="text-align: justify;">Về vấn đề này, tôi cho rằng, cần ban hành quy định với quyền sở hữu tín chỉ carbon rừng. Các quốc gia trên thế giới đều có xu hướng làm rõ quyền với tín chỉ carbon từ dự án REDD. Khung pháp lý cần cho nhà đầu tư hiểu rõ được họ có quyền sở hữu với carbon được cô lập từ các dự án bảo vệ rừng, quyền hưởng lợi từ việc cung cấp và bán dịch vụ giảm phát thải, quyền chuyển nhượng tín chỉ carbon, cũng như các nghĩa vụ kèm theo”. </p> 
<p style="text-align: justify;"><em>LS Lê Duy Khang (Cty Luật TNHH MTV Tín và Tâm):</em></p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Vấn đề phí và thuế chuyển nhượng với tín chỉ carbon cần được làm rõ</strong></p> 
<p style="text-align: justify;">“Hiện nay, các quy định về thuế trong Quyết định 130/2007/QĐ-TTg chỉ được áp dụng với các giao dịch tín chỉ carbon hình thành từ dự án cơ chế phát triển sạch (CDM). Các loại tín chỉ carbon khác nhau từ nhiều cơ chế khác nhau liệu có cách xử lý thuế khác nhau? Trong đó, ba vấn đề quan trọng mà các nhà đầu tư quan tâm; là tiền thu được từ việc chuyển nhượng tín chỉ carbon có được miễn thuế thu nhập hay không? Thuế giá trị gia tăng có được áp dụng với giá trị tăng thêm của tín chỉ carbon khi giao dịch trên sàn không? Trong trường hợp xuất khẩu tín chỉ carbon (bán cho đối tác nước ngoài), thuế suất với tín chỉ carbon được xác định như thế nào?</p> 
<p style="text-align: justify;">Tôi đề xuất, vấn đề thuế của tín chỉ carbon nói riêng cũng như hạn ngạch phát thải nói chung cần được nghiên cứu và ban hành đồng bộ. Dự kiến, lộ trình sàn giao dịch tín chỉ carbon sẽ được vận hành vào 2025 và đi vào hoạt động chính thức năm 2028. Nếu chậm trễ ban hành sẽ dẫn đến thiệt hại cho cả Nhà nước về thất thu ngân sách và gây khó khăn cho DN phải xử lý về mặt kế toán đối với loại tài sản mới này”.</p>





<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:54:59.157' AS DateTime), 1, 3, 9, 12, N'(PLVN) - Việt Nam chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon... Để xây dựng và phát triển một TTTC carbon đồng bộ, Việt Nam cần sớm triển khai đồng bộ một số giải pháp. Báo Pháp luật Việt Nam ghi nhận một số ý kiến đề xuất của các chuyên gia đầu ngành về vấn đề này.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (30, N'Muốn thi văn bằng 2 vào ngành Công an cần đáp ứng những điều kiện gì?', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Bộ Công an hướng dẫn:</strong> Tuyển sinh tuyển mới đào tạo trình độ đại học Công an nhân dân đối với công dân tốt nghiệp trình độ đại học trở lên các trường ngoài ngành Công an nhân dân thực hiện theo hướng dẫn tuyển sinh hàng năm của Bộ Công an.</p> 
<p style="text-align: justify;">Để được tuyển sinh, thí sinh cần đảm bảo đủ điều kiện về học lực trình độ đại học mà thí sinh đã theo học, đủ tiêu chuẩn sức khỏe và tiêu chuẩn chính trị theo quy định của Bộ Công an. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ngoài ra, thí sinh cần đáp ứng một số điều kiện cơ bản như: có tuổi đời không quá 30 tuổi (được xác định theo giấy khai sinh, tính đến ngày dự thi); chiều cao đạt từ 1m64 đến 1m95 đối với nam; chỉ số khối cơ thể (BMI) được tính bằng trọng lượng (đơn vị tính: ki-lô-gam) chia cho bình phương chiều cao (đơn vị tính: mét) đạt từ 18,5 đến 30; nếu mắt bị khúc xạ thì không quá 3 đi-ốp; xếp hạng bằng tốt nghiệp đại học từ loại khá trở lên... </p> 
<p style="text-align: justify;">Để biết cụ thể hơn về các điều kiện dự tuyển, thí sinh cần theo dõi thông tin tuyển sinh được thông báo công khai trên các phương tiện thông tin đại chúng, các buổi tuyên truyền hướng nghiệp của các học viện, trường Công an nhân dân để biết cụ thể về tiêu chuẩn, điều kiện dự tuyển trong năm tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:54:59.157' AS DateTime), 1, 3, 8, 13, N'(PLVN) - Sinh viên một trường đại học muốn sau khi tốt nghiệp sẽ đăng ký vào trường Công an nhân dân theo phương án thi Văn bằng 2. Vậy để được thi Văn bằng 2 vào ngành công an cần chuẩn bị những điều kiện gì?')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (31, N'Thay đổi mẫu giấy thi tốt nghiệp THPT năm 2024', N'https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_05_17/thi-tot-nghiep-thpt-2022-2-454-7836.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Theo Cục trưởng Cục Quản lý chất lượng Huỳnh Văn Chương, từ kỳ thi năm nay, Bộ GD&amp;ĐT sẽ sửa lại mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT. Điều này thực hiện theo đề nghị của các sở GD&amp;ĐT để tránh nhầm lẫn cho thí sinh.</p> 
<p style="text-align: justify;">Trước đây, khi kỳ thi đại học được tổ chức theo cụm, số báo danh của thí sinh gồm cả phần chữ và số, ví dụ như "BKA012345". Những năm gần đây, số báo danh chỉ còn phần số, nhưng giấy thi vẫn in lưu ý "Thí sinh phải ghi cả phần chữ và số". Theo các Sở GD&amp;ĐT, điều này khiến nhiều thí sinh nhầm lẫn, ghi dưới dạng "012345 (không một hai ba bốn năm)". </p> 
<p style="text-align: justify;">Vì vậy, Bộ ban hành mẫu giấy thi tự luận mới, bỏ phần ghi chú này. Thí sinh chỉ cần ghi đúng số báo danh của mình là đủ (ví dụ 012345).</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997700" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" data-width="1130" data-height="797" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" alt="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." title="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." width="840" height="592"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024.</p></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Với phiếu trả lời trắc nghiệm, Bộ GD&amp;ĐT giữ nguyên mẫu cũ. Thí sinh cần ghi đầy đủ thông tin, 6 chữ số cuối của số báo danh, đồng thời tô kín các ô tròn trong bảng số phía dưới (tương ứng với các chữ số đã ghi).</p> 
<p style="text-align: justify;">Ở phần trả lời, với mỗi câu trắc nghiệm, thí sinh chọn và tô kín một ô tròn trong các đáp án A, B, C, D.</p> 
<p style="text-align: justify;">Thí sinh không được tô vào phương án có số thứ tự không tương ứng với câu hỏi trắc nghiệm trong đề thi.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997702" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" data-width="595" data-height="854" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" alt="Phiếu trả lời các môn thi trắc nghiệm." title="Phiếu trả lời các môn thi trắc nghiệm." width="595" height="854"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Phiếu trả lời các môn thi trắc nghiệm.</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Kỳ thi tốt nghiệp THPT năm nay sẽ diễn ra từ 26/6 đến 28/6. Cụ thể, ngày 26/6, thí sinh làm thủ tục dự thi; ngày 27 và 28/6 diễn ra kỳ thi chính thức; 29/6 là ngày dự phòng.</p> 
<p style="text-align: justify;">Thí sinh tham gia làm 4 bài thi bắt buộc, gồm Toán, Ngữ văn, Ngoại ngữ và một trong hai bài thi Khoa học Tự nhiên hoặc Khoa học Xã hội.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Thời gian công bố kết quả thi tốt nghiệp dự kiến vào 8h ngày 17/7. Sau đó, các địa phương tiến hành xét tốt nghiệp cho học sinh dự thi và sử dụng kết quả thi tốt nghiệp để xét tuyển sinh đại học, cao đẳng theo kế hoạch tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:15.697' AS DateTime), 1, 2, 7, 14, N'(PLVN) - Để tránh nhầm lẫn cho thí sinh khi viết số báo danh, Bộ GD&ĐT sẽ thay đổi mẫu giấy thi tốt nghiệp THPT năm nay.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (32, N'Vị thế, uy tín của Việt Nam trên trường quốc tế (Kỳ 3): Thành viên tích cực, có trách nhiệm của cộng đồng quốc tế', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Đóng góp tích cực vào việc giữ gìn hòa bình thế giới</strong></p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị Đối ngoại toàn quốc triển khai thực hiện Nghị quyết Đại hội lần thứ XIII của Đảng (tháng 12/2021), Tổng Bí thư Nguyễn Phú Trọng nêu rõ, bất kỳ quốc gia, dân tộc nào trong quá trình hình thành và phát triển cũng đều phải xử lý hai vấn đề cơ bản là đối nội và đối ngoại. Hai vấn đề này có mối quan hệ hữu cơ, biện chứng, tác động qua lại, hỗ trợ lẫn nhau như hai cái cánh của một con chim, tạo thế và lực cho nhau, nhất là trong điều kiện toàn cầu hoá phát triển mạnh mẽ và sâu rộng. </p> 
<p style="text-align: justify;">Đúng như những nhận định của người đứng đầu Đảng ta, đối ngoại ngày nay không chỉ là sự nối tiếp của chính sách đối nội, mà còn là một động lực mạnh mẽ cho sự phát triển của các quốc gia, dân tộc. Thông qua những hoạt động đối ngoại, vị thế và uy tín quốc tế của nước ta trong khu vực và trên thế giới ngày càng được nâng cao, đóng góp tích cực và trách nhiệm vào việc giữ vững hoà bình, hợp tác phát triển và tiến bộ trên thế giới. Đây cũng chính là quyết tâm mà Đại hội lần thứ XIII của Đảng đã thống nhất rất cao: “Chủ động và tích cực hội nhập quốc tế toàn diện, sâu rộng; Việt Nam là bạn, là đối tác tin cậy và là thành viên tích cực, có trách nhiệm trong cộng đồng quốc tế”. </p> 
<p style="text-align: justify;">Kể từ khi Liên hợp quốc (LHQ) chính thức kết nạp Việt Nam trở thành quốc gia thành viên thứ 149 vào năm 1977, chúng ta đã không ngừng nỗ lực, chủ động và trách nhiệm đóng góp vào mục tiêu chung của thế giới, nhất là việc Việt Nam tham gia hoạt động gìn giữ hòa bình (GGHB) của LHQ. Cụ thể, tháng 11/2012, Bộ Chính trị thông qua Đề án tổng thể về việc Việt Nam tham gia hoạt động GGHB LHQ; sau đó, Quốc hội thông qua Nghị quyết số 130/2020/QH14 về tham gia lực lượng GGHB của LHQ. Đây là những bằng chứng thuyết phục cho cam kết của Việt Nam trong việc tham gia và giải quyết các vấn đề chung của quốc tế.</p> 
<p style="text-align: justify;">Ngày 27/5/2014, Trung tâm GGHB Việt Nam được thành lập. Ngay khi ra mắt, Trung tâm đã cử 2 sĩ quan đầu tiên đi làm nhiệm vụ cùng Phái bộ GGHB của LHQ tại Nam Sudan. Từ đây, những sĩ quan Quân đội nhân dân (QĐND) Việt Nam mang trên đầu chiếc mũ nồi xanh và mang trong tim dòng máu Lạc Hồng, truyền thống đoàn kết, nhân nghĩa của dân tộc để sẵn sàng nhận nhiệm vụ ở bất cứ đâu, mang lại hòa bình, ấm no, thịnh vượng cho mọi người dân trên thế giới. Đến năm 2022, Công an nhân dân Việt Nam cũng chính thức tham gia GGHB LHQ.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Trong 10 năm Việt Nam triển khai lực lượng tham gia sứ mệnh GGHB, chúng ta đã cử trên 800 lượt sĩ quan, quân nhân chuyên nghiệp triển khai theo hình thức cá nhân và đơn vị, trong đó có 5 thê đội (bộ phận của đội hình được sắp xếp theo bậc thang để hành động theo thứ tự - NV) của Bệnh viện dã chiến cấp 2 triển khai tại Phái bộ Nam Sudan; 2 thê đội của Đội Công binh triển khai tại khu vực Abyei và 114 lượt sĩ quan triển khai theo hình thức cá nhân. Số lượng cán bộ, sĩ quan hoàn thành xuất sắc nhiệm vụ của Việt Nam cao hơn nhiều so với mặt bằng chung của LHQ. Không chỉ vậy, Đội Công binh Việt Nam ở khu vực Abyei đã giúp đỡ chính quyền và người dân địa phương bằng những hành động thiết thực như xây dựng và tu sửa đường; xây dựng, cải tạo lớp học; dạy học tình nguyện; khoan giếng nước tặng khu dân cư địa phương và các trường học; khám, chữa bệnh, tư vấn sức khỏe và cấp phát thuốc miễn phí cho người dân...</p> 
<p style="text-align: justify;"><strong>Tinh thần đoàn kết quốc tế cao cả</strong></p> 
<p style="text-align: justify;">Cùng với việc hoàn thành nhiều trọng trách quốc tế quan trọng, Việt Nam đã đề xuất nhiều sáng kiến, giải pháp thúc đẩy hợp tác, đóng góp có trách nhiệm vào các vấn đề chung của thế giới như phòng, chống dịch bệnh, thiên tai, biến đổi khí hậu, an ninh lương thực; cử lực lượng hỗ trợ khắc phục hậu quả động đất tại Thổ Nhĩ Kỳ…</p> 
<p style="text-align: justify;"> “Cảm ơn Việt Nam” là câu nói xúc động của Tổng thống Thổ Nhĩ Kỳ Tayyip Erdogan khi gặp đoàn cứu hộ, cứu nạn của QĐND Việt Nam tại hai tỉnh Hatay và Kahramanmaras (tháng 2/2023). Ông nhấn mạnh, thảm họa động đất một lần nữa cho thấy tầm quan trọng của tình đoàn kết quốc tế. Thổ Nhĩ Kỳ sẽ không bao giờ quên tình bạn đó. Không chỉ là một trong những quốc gia đầu tiên nhanh chóng cử các lực lượng tham gia công tác tìm kiếm, cứu nạn, hỗ trợ người dân Thổ Nhĩ Kỳ, đoàn cứu hộ, cứu nạn của QĐND Việt Nam còn trao gần 25 tấn hàng viện trợ của Bộ Quốc phòng, gồm lương khô, gạo, sữa, thiết bị y tế và nhiều nhu yếu phẩm khác tặng Thổ Nhĩ Kỳ. Cùng với đó, đoàn công tác cứu nạn, cứu hộ quốc tế của Bộ Công an Việt Nam đã trao tặng 2 tấn thiết bị y tế cho Thổ Nhĩ Kỳ… </p> 
<p style="text-align: justify;">Gần đây, vào tháng 11/2023, thông qua LHQ, Việt Nam đã đóng góp 500.000 USD để cứu trợ nhân đạo người dân Palestine bị ảnh hưởng bởi xung đột ở dải Gaza, thể hiện tinh thần đoàn kết với nhân dân Palestine. Trước đó, khi động đất và sóng thần gây thiệt hại lớn tại Nhật Bản vào năm 2011, Chính phủ Việt Nam đã trợ giúp nhân dân Nhật Bản 200.000 USD để góp phần khắc phục hậu quả. Ngoài ra, hưởng ứng lời kêu gọi của Hội Chữ thập đỏ Việt Nam, đã có hàng nghìn tổ chức, cá nhân ủng hộ nhân dân Nhật Bản bị thiên tai với hơn 161 tỷ đồng (tương đương 7,783 triệu USD). </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Thể hiện vai trò nòng cốt, dẫn dắt, hòa giải</strong></p> 
<p style="text-align: justify;">Để triển khai hiệu quả, thực chất đường lối đối ngoại, tháng 8/2018, Ban Bí thư đã ban hành Chỉ thị số 25-CT/TW về đẩy mạnh và nâng tầm đối ngoại đa phương đến năm 2030, trong đó xác định: phấn đấu đóng vai trò nòng cốt, dẫn dắt, hòa giải tại các diễn đàn đa phương có tầm quan trọng chiến lược đối với đất nước, phù hợp với khả năng và điều kiện cụ thể. </p> 
<p style="text-align: justify;">Nhờ những định hướng này, vào năm Việt Nam đảm nhận vai trò Chủ tịch ASEAN 2020 đã thành công toàn diện, là một đỉnh cao thắng lợi của đường lối đối ngoại đa phương của Đảng. Theo đó, đã thông qua hơn 550 cuộc họp, nhiều sáng kiến, ưu tiên của Việt Nam đã trở thành tài sản chung của ASEAN. Trong Năm Chủ tịch ASEAN 2020 của Việt Nam, rất nhiều cái “đầu tiên” đã được sáng tạo để hoàn thành các mục tiêu đề ra: số lượng các Hội nghị tăng lên để kịp thời ứng phó với dịch Covid-19; nhiều Hội nghị Cấp cao, Bộ trưởng lần đầu được tổ chức trực tuyến; nhiều văn kiện quan trọng của ASEAN cũng được ký kết trực tuyến lần đầu tiên. Điều này đã minh chứng cho năng lực công nghệ và khả năng của Việt Nam trong kỷ nguyên chuyển đổi số.</p> 
<p style="text-align: justify;">Chúng ta đã không chỉ khéo léo, linh hoạt dẫn dắt, điều hòa những khác biệt giữa các quốc gia thành viên ASEAN để giữ vững hình ảnh đoàn kết, đồng thuận của Hiệp hội, mà còn xử lý hài hòa, hiệu quả các bất đồng giữa các đối tác, qua đó tất cả các hội nghị trong năm diễn ra thành công. Với thành công của Năm Chủ tịch ASEAN 2020, Việt Nam không còn chỉ là một thành viên tích cực, luôn nghiêm túc thực thi các thỏa thuận đã cam kết, mà đã trở thành một chỗ dựa vững chắc, tin cậy, đặc biệt trong những thời khắc ASEAN phải đối mặt với nhiều khó khăn, thách thức.</p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị tổng kết 2 năm Việt Nam đảm nhiệm cương vị Ủy viên không thường trực Hội đồng Bảo an LHQ nhiệm kỳ 2020 - 2021 (tháng 1/2022), Thủ tướng Phạm Minh Chính nêu rõ, việc Việt Nam lần thứ hai đảm nhiệm vị trí quan trọng này (chỉ hơn 10 năm sau khi kết thúc nhiệm kỳ đầu tiên) với số phiếu bầu gần như tuyệt đối (192/193 phiếu) cho thấy vị thế của đất nước và sự tín nhiệm cao của quốc tế đối với chính sách đối ngoại của chúng ta… Việt Nam đã khẳng định được năng lực điều hành, từng bước thể hiện rõ vai trò nòng cốt, dẫn dắt, hòa giải tại các hội nghị Hội đồng Bảo an với nhiều dấu ấn tích cực, được các nước ủy viên Hội đồng Bảo an, kể cả các nước ủy viên thường trực, các nước bạn bè truyền thống, đang phát triển, các nước trong Phong trào không liên kết... coi trọng, đánh giá cao. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Tại cuộc gặp với Tổng Bí thư Nguyễn Phú Trọng trong khuôn khổ chuyến thăm chính thức Việt Nam (tháng 10/2022), Tổng Thư ký LHQ António Guterres cho rằng Việt Nam luôn thể hiện lập trường nguyên tắc trên những vấn đề về bảo vệ hòa bình, phát triển bền vững, đề cao Hiến chương LHQ, luật pháp quốc tế, nhất là những nguyên tắc cơ bản nhất. Việt Nam cũng tích cực hợp tác cùng LHQ và các đối tác quốc tế ứng phó với các vấn đề an ninh phi truyền thống ngày càng gay gắt.</p> 
<p style="text-align: justify;"> Những nỗ lực không ngừng nghỉ và những thành quả to lớn trong công tác đối ngoại Đảng, ngoại giao Nhà nước và đối ngoại nhân dân của Việt Nam đã góp phần rất quan trọng vào thành tựu chung to lớn, có ý nghĩa lịch sử của đất nước, như Đại hội XIII của Đảng đã khẳng định: “Đất nước ta chưa bao giờ có được cơ đồ, tiềm lực, vị thế và uy tín quốc tế như ngày nay”.</p> 
<blockquote style="text-align: justify;" class="quote cms-quote"> 
 <table class="picture"> 
  <tbody> 
   <tr> 
    <td class="pic"><img data-image-id="997611" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="740" data-height="416" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tong-thu-ky-lhq-antonio-guterres-anh-reuters-2301.jpeg" alt="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" title="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" width="740" height="416"></td> 
   </tr> 
   <tr> 
    <td class="caption"><p>Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)</p> </td> 
   </tr> 
  </tbody> 
 </table> 
 <p>“Cách đây chưa đầy một thế hệ, các nhân viên LHQ đã ở Việt Nam, hỗ trợ lương thực cho một quốc gia bị chiến tranh tàn phá và cô lập. Cũng chính Việt Nam hôm nay đã và đang gửi những người lính gìn giữ hòa bình đến giúp đỡ người dân ở những nơi khó khăn nhất trên thế giới, cách xa quê hương hàng nghìn dặm” - Tổng Thư ký LHQ Antonio Guterres chia sẻ tại Lễ kỷ niệm 45 năm Việt Nam gia nhập LHQ. </p> 
</blockquote>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Vân Thanh">Vân Thanh</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:15.697' AS DateTime), 1, 1, 6, 15, N'(PLVN) - Quán triệt tư tưởng mà Chủ tịch Hồ Chí Minh từng nhấn mạnh “giữ gìn hòa bình thế giới tức là giữ gìn lợi ích của nước ta”, Đảng và Nhà nước ta đã triển khai hiệu quả đường lối đối ngoại trên tinh thần chủ động và phát huy vai trò tại các cơ chế đa phương, là thành viên tích cực, có trách nhiệm của cộng đồng quốc tế.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (33, N'Việt Nam được bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003 về bảo vệ di sản văn hoá phi vật thể', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" data-image-id="997747" data-width="1600" data-height="949" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" width="840" height="498"></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;"><em>Các đại biểu tham dự kỳ họp.</em></p> 
<p style="text-align: justify;">Theo phóng viên TTXVN tại Pháp, ngày 11/6, tại Trụ sở Tổ chức Giáo dục, Khoa học và Văn hoá Liên hợp quốc (UNESCO) ở thủ đô Paris, Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), đã khai mạc với sự tham dự của 183 quốc gia thành viên và hơn 100 quan sát viên. Thứ trưởng Bộ Ngoại giao Hà Kim Ngọc, Chủ tịch Ủy ban Quốc gia UNESCO Việt Nam, dẫn đầu Đoàn Việt Nam tham dự kỳ họp này.</p> 
<p style="text-align: justify;">Tại phiên khai mạc, Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003, đưa số lượng các cơ chế then chốt của UNESCO mà Việt Nam tham gia lên con số 6 (thành viên Uỷ ban Di sản thế giới và Hội đồng Chấp hành UNESCO, Phó Chủ tịch Đại hội đồng UNESCO, Phó Chủ tịch Ủy ban liên Chính phủ Công ước 2005 về bảo vệ và phát huy sự đa dạng của các biểu đạt văn hóa, Phó Chủ tịch Ủy ban liên Chính phủ và Phó Chủ tịch Đại hội đồng Công ước 2003).</p> 
<p style="text-align: justify;">Chủ tịch Uỷ ban Quốc gia UNESCO Việt Nam Hà Kim Ngọc nhấn mạnh ý nghĩa quan trọng của sự kiện này, một lần nữa cho thấy vị thế và uy tín quốc tế ngày càng cao của Việt Nam, sự ủng hộ, tin tưởng của cộng đồng quốc tế đối với vai trò và năng lực điều hành của ta tại các thể chế đa phương toàn cầu, và đặc biệt là sự ghi nhận đối với những đóng góp của Việt Nam trong gìn giữ, bảo tồn và phát huy giá trị di sản phi vật thể trong nước và trên thế giới. Đây cũng là kết quả của việc triển khai chính sách đối ngoại đúng đắn của Đảng và Nhà nước về đa phương hóa, đa dạng hóa và hội nhập quốc tế toàn diện, sâu rộng, chủ trương đẩy mạnh và nâng tầm đối ngoại đa phương, cũng như Chiến lược Ngoại giao văn hoá đến năm 2030.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ở vị trí điều hành, Việt Nam sẽ trực tiếp tham gia vào quá trình xây dựng, thông qua các quyết định quan trọng của UNESCO về văn hóa, đóng góp hơn nữa cho việc hoàn thiện, thực hiện các mục tiêu của Công ước 2003, cũng như tranh thủ các chương trình, kế hoạch, sáng kiến của UNESCO phục vụ phát triển đất nước, bảo tồn và phát huy giá trị di sản, bảo đảm cao nhất lợi ích quốc gia, dân tộc trong hợp tác văn hóa ở tầm toàn cầu.</p> 
<p style="text-align: justify;">Phát biểu tại phiên khai mạc toàn thể của Kỳ họp lần thứ 10, Thứ trưởng Ngoại giao Hà Kim Ngọc đánh giá cao nỗ lực của Ủy ban liên Chính phủ, Ban thư ký và các quốc gia thành viên Công ước 2003 trong thúc đẩy các mục tiêu của Công ước, nâng cao nhận thức về vai trò của bảo vệ và trao truyền di sản phi vật thể, đặt cộng đồng vào trung tâm của nỗ lực bảo tồn di sản. Thứ trưởng khẳng định Việt Nam, với 15 di sản văn hóa phi vật thể đã được ghi danh và 550 di sản văn hóa phi vật thể cấp quốc gia, luôn luôn quan tâm bảo vệ di sản văn hóa phi vật thể, không ngừng xây dựng và hoàn thiện chính sách, luật pháp quốc gia, và gần đây nhất là Chương trình Mục tiêu Quốc gia về Phát triển Văn hóa đến 2045, và Luật Di sản văn hóa sửa đổi.</p> 
<p style="text-align: justify;">Thứ trưởng Hà Kim Ngọc đề xuất UNESCO và các nước thành viên cần tiếp tục tăng cường hợp tác quốc tế, triển khai hiệu quả Công ước, ưu tiên chia sẻ kinh nghiệm, tăng cường năng lực cho các nước đang phát triển, các quốc gia Châu Phi, nhóm đảo nhỏ đang phát triển, thúc đẩy tham gia và đóng góp của cộng đồng, phụ nữ và thanh niên.</p> 
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" data-image-id="997748" data-width="1600" data-height="766" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" width="840" height="402"></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Các đại biểu chụp ảnh chung.</p> 
<p style="text-align: justify;">Các quốc gia thành viên Công ước 2003 đánh giá cao những kinh nghiệm, hiểu biết và nỗ lực của Việt Nam trong bảo vệ và phát huy di sản văn hoá phi vật thể ở cả phương diện lý luận, luật pháp và thực tiễn, là bài học tốt cho nhiều quốc gia ở khu vực và quốc tế, góp phần bảo vệ khẩn cấp những di sản có nguy cơ bị mai một, gìn giữ những di sản đại diện cho nhân loại và quảng bá những hình mẫu di sản được bảo vệ tốt trên thế giới.</p> 
<p style="text-align: justify;">Diễn ra trong hai ngày, 11 và 12/6, Kỳ họp lần thứ 10 của Đại hội đồng Công ước 2003 là dịp để các nước thành viên cùng nhau thảo luận các vấn đề quan trọng đối với tương lai của Công ước và hướng các nỗ lực của các quốc gia và cộng đồng vào việc bảo vệ di sản sống của thế giới. Các chủ đề chính trong chương trình nghị sự bao gồm: tổng kết các hoạt động của Đại hội đồng giai đoạn 2022-2023; xem xét việc triển khai rộng rãi hơn Điều 18 của Công ước; xây dựng kế hoạch sử dụng nguồn lực của Quỹ Di sản văn hóa phi vật thể vào năm 2024 và 2025; công nhận các tổ chức phi chính phủ mới và bầu 12 thành viên mới của Ủy ban.</p> 
<p style="text-align: justify;">Đại hội đồng Công ước 2003 là cơ quan quyền lực cao nhất của UNESCO trong lĩnh vực bảo vệ di sản văn hoá phi vật thể, gồm đại diện của 183 nước thành viên. Đại hội đồng quyết định những vấn đề quan trọng liên quan đến chính sách, đường lối phát triển của Công ước, phân bổ kinh phí hỗ trợ công tác bảo tồn di sản phi vật thể ở các quốc gia, bầu Uỷ ban liên Chính phủ Công ước 2003. Việt Nam chính thức tham gia Công ước 2003 vào ngày 05/09/2005, trở thành một trong 30 quốc gia đầu tiên trên thế giới gia nhập Công ước quan trọng này. Là một thành viên tích cực và có trách nhiệm, Việt Nam đã 2 lần được tín nhiệm, trúng cử vào Ủy ban Liên Chính phủ về bảo vệ di sản văn hóa phi vật thể. Tinh thần của Công ước đã được vận dụng vào Luật sửa đổi, bổ sung một số điều của Luật Di sản văn hóa năm 2009 và vào thực tiễn hoạt động bảo vệ và phát huy giá trị di sản văn hóa phi vật thể ở Việt Nam, với những kết quả rất đáng ghi nhận.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện nay, Việt Nam đang trong quá trình hoàn thiện, đệ trình và thúc đẩy việc ghi danh các hồ sơ đề cử như: Quần thể di tích và danh thắng Yên Tử - Vĩnh Nghiêm - Côn Sơn, Kiếp Bạc; Khu di tích khảo cổ Óc Eo-Ba Thê; Hang Con Moong; Lễ hội Vía bà Chúa Xứ núi Sam; Nghệ thuật Tranh dân gian Đông Hồ; Nghệ thuật Chèo; Mo Mường; Công viên địa chất Lạng Sơn; và đặc biệt là Dự án bảo tồn và phát huy giá trị khu Trung tâm Hoàng thành Thăng Long - Hà Nội.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Theo TTXVN">Theo TTXVN</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:15.697' AS DateTime), 1, 2, 5, 16, N'Tại phiên khai mạc Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (34, N'Truy tìm đối tượng tên ''Hoàng'' nghi hiếp dâm trẻ em', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Thông tin từ Công an TP Hà Nội, Cơ quan CSĐT Công an quận Thanh Xuân đang điều tra vụ án hình sự "Hiếp dâm người dưới 16 tuổi" xảy ra trong khoảng thời gian từ ngày 20/8/2022 đến ngày 27/2/2023 tại nhà nghỉ trên địa bàn phường Nhân Chính, quận Thanh Xuân.</p> 
<p style="text-align: justify;">Ngày 23/5/2024, Cơ quan CSĐT - Công an quận Thanh Xuân đã ra quyết định khởi tố vụ án hình sự “hiếp dâm” người dưới 16 tuổi để điều tra làm rõ vụ án. Theo đó, Công an quận Thanh Xuân xác định đối tượng tình nghi có hành vi hiếp dâm người dưới 16 tuổi tên là “Hoàng”. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện chưa rõ nhân thân lai lịch của đối tượng. Để phục vụ điều tra, Công an quận Thanh Xuân quyết định truy tìm đối tượng trên.</p> 
<p style="text-align: justify;">"Ai biết thông tin về đối tượng thì báo ngay cho Cơ quan CSĐT Công an quận Thanh Xuân (SĐT: 0866.183.988), cơ quan Công an nơi gần nhất hoặc cung cấp thông tin qua trang facebook Công an thành phố Hà Nội để phối hợp giải quyết vụ việc theo quy định", Công an TP Hà Nội thông báo.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Bùi Lan">Bùi Lan</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:15.697' AS DateTime), 1, 1, 4, 17, N'(PLVN) - Ai biết thông tin về đối tượng trong ảnh ở đâu cần báo ngay cho Công an quận Thanh Xuân, TP Hà Nội, theo số điện thoại 0866.183.988.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (35, N'Cần giải pháp đồng bộ để quản lý thị trường tín chỉ carbon', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<div class="notebox nright cms-note" align="right" style="text-align: justify;">
 <p> Kinh tế xanh đang mở ra nhiều cơ hội nhưng cũng đặt ra không ít thách thức. Đây là một vấn đề khá mới mẻ tại Việt Nam, đặc biệt là thị trường tín chỉ carbon - đang được cộng đồng doanh nghiệp rất quan tâm vì những lợi ích mà nó mang lại cũng như các vướng mắc về pháp lý… </p> 
 <p><strong>Những vấn đề trên được bàn thảo, giải đáp trong Chương trình Tọa đàm với chủ đề: “Thị trường tín chỉ carbon: Góc nhìn từ kinh tế, môi trường và khuôn khổ pháp lý” do Báo Pháp luật Việt Nam tổ chức vào hôm nay, 12/6, tại Phòng Hội thảo - Khách sạn Mường Thanh, TP Hồ Chí Minh.</strong> </p> 
 <p> Những vấn đề như: Quy định của pháp luật Việt Nam về tín chỉ carbon (cơ sở pháp lý để được công nhận tín chỉ carbon hiện nay tại Việt Nam…); Những mặt tích cực, những thiếu sót, bất cập, vướng mắc liên quan tới tín chỉ carbon hiện nay tại Việt Nam; Doanh nghiệp (cả doanh nghiệp phát thải lẫn doanh nghiệp cung cấp, kinh doanh tín chỉ carbon), người dân sẽ được lợi gì khi tham gia thị trường tín chỉ carbon… sẽ được các chuyên gia đầu ngành, khách mời ở các Bộ ngành, doanh nghiệp… giải đáp, kiến nghị.</p>
</div> 
<p style="text-align: justify;"><em>GS. TS Võ Xuân Vinh (Viện trưởng Viện Nghiên cứu Kinh doanh, ĐH Kinh tế TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước</strong></p> 
<p style="text-align: justify;">“Việt Nam có hơn 14 triệu ha rừng, với tiềm năng tạo ra tín chỉ carbon từ các dự án bảo vệ và phục hồi rừng. Các chương trình như REDD+ (Reducing Emissions from Deforestation and Forest Degradation) đã giúp Việt Nam đạt được hàng triệu tín chỉ carbon từ việc bảo vệ và phục hồi rừng.</p> 
<p style="text-align: justify;"> Với ước tính có thể bán ra 57 triệu tín chỉ carbon cho các tổ chức quốc tế, Việt Nam có thể thu về hàng trăm triệu USD/năm. Giá tín chỉ carbon hiện tại khoảng 5 USD/tín chỉ.</p> 
<p style="text-align: justify;">Vậy số tiền này sẽ được chi trả cho người trồng rừng hay chi trả cho Nhà nước, hay theo tỷ lệ nào?. </p> 
<p style="text-align: justify;">Theo Điều 139 Luật Bảo vệ môi trường 2020, Nhà nước khuyến khích việc tham gia TTTC carbon và có các quy định về trách nhiệm, quyền lợi của các bên tham gia. Tuy nhiên, Luật này chưa quy định chi tiết về tỷ lệ phân chia thu nhập từ tín chỉ carbon. Do đó, tỷ lệ phân chia thu nhập có lẽ sẽ được xác định dựa trên hợp đồng thỏa thuận giữa các bên liên quan.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997609" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" data-width="692" data-height="536" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" alt="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" title="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" width="692" height="536"><br>GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)</td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Mặt khác, việc cạnh tranh trong việc bán tín chỉ carbon có thể gia tăng khi nhiều DN cùng tham gia thị trường, đòi hỏi DN phải nâng cao năng lực cạnh tranh và tìm kiếm các thị trường mới. Nguy cơ gian lận trong báo cáo và giám sát lượng phát thải cũng có thể ảnh hưởng đến uy tín và hiệu quả của DN, yêu cầu DN phải tuân thủ nghiêm ngặt các quy định và xây dựng hệ thống giám sát minh bạch.</p> 
<p style="text-align: justify;">Tôi cho rằng, phát triển một TTTC carbon nội địa mạnh mẽ là yếu tố then chốt để thúc đẩy sự tham gia của các DN và người dân. Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước, tạo ra nền tảng để các bên có thể giao dịch một cách minh bạch và hiệu quả. Bên cạnh đó, cần khuyến khích sự tham gia của các tổ chức tài chính, quỹ đầu tư vào thị trường này để tăng tính thanh khoản và đa dạng hóa các loại hình tín chỉ carbon có thể giao dịch.</p> 
<p style="text-align: justify;">Đặc biệt, nên khuyến khích đầu tư vào công nghệ xanh và các dự án giảm phát thải thông qua các chính sách hỗ trợ tài chính và ưu đãi thuế. Việc áp dụng công nghệ xanh không chỉ giúp giảm thiểu phát thải khí nhà kính, mà còn nâng cao hiệu quả sản xuất và kinh doanh của các DN. Các dự án năng lượng tái tạo, công nghệ tiết kiệm năng lượng và cải thiện quy trình sản xuất sạch là những lĩnh vực cần được ưu tiên đầu tư để đạt được mục tiêu phát triển bền vững…”.</p> 
<p style="text-align: justify;"><em>TS Võ Trung Tín (Trưởng bộ môn Luật Đất đai - Môi trường, Khoa Luật Thương mại, Trường ĐH Luật TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần có quy trình thực hiện dự án tín chỉ carbon</strong></p> 
<p style="text-align: justify;">“Về tăng cường công tác quản lý tín chỉ carbon, Bộ TN&amp;MT cần chủ trì, phối hợp các Bộ, ngành liên quan sửa đổi Nghị định 06/2022/NĐ-CP. Trong đó, tôi cho rằng cần bổ sung các quy định như với dự án tín chỉ carbon nói chung, cần có quy trình thực hiện dự án tín chỉ carbon. </p> 
<p style="text-align: justify;">Tôi cho rằng một dự án tín chỉ carbon trong khuôn khổ Công ước khung của Liên hợp quốc về biến đổi khí hậu (UNFCCC) cần trải qua các bước cơ bản như: Đăng ký ý tưởng dự án và phương pháp luận; Đăng ký dự án; Báo cáo thực hiện dự án; Thẩm định và cấp tín chỉ carbon. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Về cơ quan thẩm quyền, Chính phủ có thể giao cho từng Bộ quản lý công nhận phương pháp luận, phê duyệt ý tưởng dự án, phê duyệt dự án, cấp tín chỉ carbon phù hợp với trách nhiệm tổ chức thực hiện hệ thống giám sát - báo cáo - thẩm định (MRV) cấp lĩnh vực, cấp cơ sở thuộc phạm vi quản lý của các Bộ quản lý lĩnh vực.</p> 
<p style="text-align: justify;">Với các dự án Sáng kiến giảm phát thải từ mất rừng và suy thoái rừng (REDD), Việt Nam có độ che phủ rừng 42% nên tiềm năng thực hiện dự án tín chỉ carbon là rất lớn. Tuy nhiên, dự án REDD cũng có một số hạn chế dẫn đến tổ chức, cá nhân ngoài Nhà nước chưa thể đầu tư thực hiện. Cụ thể, chúng ta chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon. Kết quả giảm phát thải từ dự án REDD chỉ trở thành sản phẩm hàng hóa để chuyển nhượng; khi được xác nhận là tín chỉ phải qua quá trình nghiên cứu khả thi, lập dự án theo tiêu chuẩn carbon phù hợp, thẩm tra hồ sơ, xác nhận tín chỉ, phát hành và chuyển nhượng, trao đổi, bù trừ. </p> 
<p style="text-align: justify;">Đây là một quá trình đặc thù, khác với nhiều lĩnh vực khác bởi nhiều giai đoạn phải được các tổ chức độc lập thực hiện, trong khi các quy định hiện hành ở Việt Nam chưa có hoặc có nhưng không phù hợp với thị trường carbon và thông lệ quốc tế.</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997598" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="854" data-height="1280" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h5-1080.jpg" alt="TS Võ Trung Tín. (Ảnh: P.Thảo)" title="TS Võ Trung Tín. (Ảnh: P.Thảo)" width="840" height="1259"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>TS Võ Trung Tín. (Ảnh: P.Thảo)</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Vì chưa có các quy định rõ ràng về pháp lý liên quan đến đầu tư, đất đai, lâm nghiệp và cơ chế chia sẻ lợi ích giữa các bên liên quan trong dự án nên các dự án REDD chủ yếu được các cơ quan nhà nước trực tiếp triển khai. Hiện chỉ có Cty SK Forest đang dự định ký kết Thư ý định với Bộ TN&amp;MT để có cơ sở thực hiện dự án.</p> 
<p style="text-align: justify;">Về vấn đề này, tôi cho rằng, cần ban hành quy định với quyền sở hữu tín chỉ carbon rừng. Các quốc gia trên thế giới đều có xu hướng làm rõ quyền với tín chỉ carbon từ dự án REDD. Khung pháp lý cần cho nhà đầu tư hiểu rõ được họ có quyền sở hữu với carbon được cô lập từ các dự án bảo vệ rừng, quyền hưởng lợi từ việc cung cấp và bán dịch vụ giảm phát thải, quyền chuyển nhượng tín chỉ carbon, cũng như các nghĩa vụ kèm theo”. </p> 
<p style="text-align: justify;"><em>LS Lê Duy Khang (Cty Luật TNHH MTV Tín và Tâm):</em></p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Vấn đề phí và thuế chuyển nhượng với tín chỉ carbon cần được làm rõ</strong></p> 
<p style="text-align: justify;">“Hiện nay, các quy định về thuế trong Quyết định 130/2007/QĐ-TTg chỉ được áp dụng với các giao dịch tín chỉ carbon hình thành từ dự án cơ chế phát triển sạch (CDM). Các loại tín chỉ carbon khác nhau từ nhiều cơ chế khác nhau liệu có cách xử lý thuế khác nhau? Trong đó, ba vấn đề quan trọng mà các nhà đầu tư quan tâm; là tiền thu được từ việc chuyển nhượng tín chỉ carbon có được miễn thuế thu nhập hay không? Thuế giá trị gia tăng có được áp dụng với giá trị tăng thêm của tín chỉ carbon khi giao dịch trên sàn không? Trong trường hợp xuất khẩu tín chỉ carbon (bán cho đối tác nước ngoài), thuế suất với tín chỉ carbon được xác định như thế nào?</p> 
<p style="text-align: justify;">Tôi đề xuất, vấn đề thuế của tín chỉ carbon nói riêng cũng như hạn ngạch phát thải nói chung cần được nghiên cứu và ban hành đồng bộ. Dự kiến, lộ trình sàn giao dịch tín chỉ carbon sẽ được vận hành vào 2025 và đi vào hoạt động chính thức năm 2028. Nếu chậm trễ ban hành sẽ dẫn đến thiệt hại cho cả Nhà nước về thất thu ngân sách và gây khó khăn cho DN phải xử lý về mặt kế toán đối với loại tài sản mới này”.</p>





<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:15.697' AS DateTime), 1, 3, 3, 18, N'(PLVN) - Việt Nam chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon... Để xây dựng và phát triển một TTTC carbon đồng bộ, Việt Nam cần sớm triển khai đồng bộ một số giải pháp. Báo Pháp luật Việt Nam ghi nhận một số ý kiến đề xuất của các chuyên gia đầu ngành về vấn đề này.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (36, N'Muốn thi văn bằng 2 vào ngành Công an cần đáp ứng những điều kiện gì?', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Bộ Công an hướng dẫn:</strong> Tuyển sinh tuyển mới đào tạo trình độ đại học Công an nhân dân đối với công dân tốt nghiệp trình độ đại học trở lên các trường ngoài ngành Công an nhân dân thực hiện theo hướng dẫn tuyển sinh hàng năm của Bộ Công an.</p> 
<p style="text-align: justify;">Để được tuyển sinh, thí sinh cần đảm bảo đủ điều kiện về học lực trình độ đại học mà thí sinh đã theo học, đủ tiêu chuẩn sức khỏe và tiêu chuẩn chính trị theo quy định của Bộ Công an. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ngoài ra, thí sinh cần đáp ứng một số điều kiện cơ bản như: có tuổi đời không quá 30 tuổi (được xác định theo giấy khai sinh, tính đến ngày dự thi); chiều cao đạt từ 1m64 đến 1m95 đối với nam; chỉ số khối cơ thể (BMI) được tính bằng trọng lượng (đơn vị tính: ki-lô-gam) chia cho bình phương chiều cao (đơn vị tính: mét) đạt từ 18,5 đến 30; nếu mắt bị khúc xạ thì không quá 3 đi-ốp; xếp hạng bằng tốt nghiệp đại học từ loại khá trở lên... </p> 
<p style="text-align: justify;">Để biết cụ thể hơn về các điều kiện dự tuyển, thí sinh cần theo dõi thông tin tuyển sinh được thông báo công khai trên các phương tiện thông tin đại chúng, các buổi tuyên truyền hướng nghiệp của các học viện, trường Công an nhân dân để biết cụ thể về tiêu chuẩn, điều kiện dự tuyển trong năm tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:15.697' AS DateTime), 1, 3, 2, 19, N'(PLVN) - Sinh viên một trường đại học muốn sau khi tốt nghiệp sẽ đăng ký vào trường Công an nhân dân theo phương án thi Văn bằng 2. Vậy để được thi Văn bằng 2 vào ngành công an cần chuẩn bị những điều kiện gì?')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (37, N'Thay đổi mẫu giấy thi tốt nghiệp THPT năm 2024', N'https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_05_17/thi-tot-nghiep-thpt-2022-2-454-7836.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Theo Cục trưởng Cục Quản lý chất lượng Huỳnh Văn Chương, từ kỳ thi năm nay, Bộ GD&amp;ĐT sẽ sửa lại mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT. Điều này thực hiện theo đề nghị của các sở GD&amp;ĐT để tránh nhầm lẫn cho thí sinh.</p> 
<p style="text-align: justify;">Trước đây, khi kỳ thi đại học được tổ chức theo cụm, số báo danh của thí sinh gồm cả phần chữ và số, ví dụ như "BKA012345". Những năm gần đây, số báo danh chỉ còn phần số, nhưng giấy thi vẫn in lưu ý "Thí sinh phải ghi cả phần chữ và số". Theo các Sở GD&amp;ĐT, điều này khiến nhiều thí sinh nhầm lẫn, ghi dưới dạng "012345 (không một hai ba bốn năm)". </p> 
<p style="text-align: justify;">Vì vậy, Bộ ban hành mẫu giấy thi tự luận mới, bỏ phần ghi chú này. Thí sinh chỉ cần ghi đúng số báo danh của mình là đủ (ví dụ 012345).</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997700" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" data-width="1130" data-height="797" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/mau-giay-thi-tot-nghiep-thpt-moi-17180952414841356512134-2551-7209.jpg" alt="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." title="Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024." width="840" height="592"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Mẫu giấy thi tự luận trong kỳ thi tốt nghiệp THPT năm 2024.</p></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Với phiếu trả lời trắc nghiệm, Bộ GD&amp;ĐT giữ nguyên mẫu cũ. Thí sinh cần ghi đầy đủ thông tin, 6 chữ số cuối của số báo danh, đồng thời tô kín các ô tròn trong bảng số phía dưới (tương ứng với các chữ số đã ghi).</p> 
<p style="text-align: justify;">Ở phần trả lời, với mỗi câu trắc nghiệm, thí sinh chọn và tô kín một ô tròn trong các đáp án A, B, C, D.</p> 
<p style="text-align: justify;">Thí sinh không được tô vào phương án có số thứ tự không tương ứng với câu hỏi trắc nghiệm trong đề thi.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997702" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" data-width="595" data-height="854" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_12/screenshot-420-9151.png" alt="Phiếu trả lời các môn thi trắc nghiệm." title="Phiếu trả lời các môn thi trắc nghiệm." width="595" height="854"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>Phiếu trả lời các môn thi trắc nghiệm.</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Kỳ thi tốt nghiệp THPT năm nay sẽ diễn ra từ 26/6 đến 28/6. Cụ thể, ngày 26/6, thí sinh làm thủ tục dự thi; ngày 27 và 28/6 diễn ra kỳ thi chính thức; 29/6 là ngày dự phòng.</p> 
<p style="text-align: justify;">Thí sinh tham gia làm 4 bài thi bắt buộc, gồm Toán, Ngữ văn, Ngoại ngữ và một trong hai bài thi Khoa học Tự nhiên hoặc Khoa học Xã hội.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Thời gian công bố kết quả thi tốt nghiệp dự kiến vào 8h ngày 17/7. Sau đó, các địa phương tiến hành xét tốt nghiệp cho học sinh dự thi và sử dụng kết quả thi tốt nghiệp để xét tuyển sinh đại học, cao đẳng theo kế hoạch tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:25.283' AS DateTime), 1, 1, 1, 20, N'(PLVN) - Để tránh nhầm lẫn cho thí sinh khi viết số báo danh, Bộ GD&ĐT sẽ thay đổi mẫu giấy thi tốt nghiệp THPT năm nay.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (38, N'Vị thế, uy tín của Việt Nam trên trường quốc tế (Kỳ 3): Thành viên tích cực, có trách nhiệm của cộng đồng quốc tế', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Đóng góp tích cực vào việc giữ gìn hòa bình thế giới</strong></p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị Đối ngoại toàn quốc triển khai thực hiện Nghị quyết Đại hội lần thứ XIII của Đảng (tháng 12/2021), Tổng Bí thư Nguyễn Phú Trọng nêu rõ, bất kỳ quốc gia, dân tộc nào trong quá trình hình thành và phát triển cũng đều phải xử lý hai vấn đề cơ bản là đối nội và đối ngoại. Hai vấn đề này có mối quan hệ hữu cơ, biện chứng, tác động qua lại, hỗ trợ lẫn nhau như hai cái cánh của một con chim, tạo thế và lực cho nhau, nhất là trong điều kiện toàn cầu hoá phát triển mạnh mẽ và sâu rộng. </p> 
<p style="text-align: justify;">Đúng như những nhận định của người đứng đầu Đảng ta, đối ngoại ngày nay không chỉ là sự nối tiếp của chính sách đối nội, mà còn là một động lực mạnh mẽ cho sự phát triển của các quốc gia, dân tộc. Thông qua những hoạt động đối ngoại, vị thế và uy tín quốc tế của nước ta trong khu vực và trên thế giới ngày càng được nâng cao, đóng góp tích cực và trách nhiệm vào việc giữ vững hoà bình, hợp tác phát triển và tiến bộ trên thế giới. Đây cũng chính là quyết tâm mà Đại hội lần thứ XIII của Đảng đã thống nhất rất cao: “Chủ động và tích cực hội nhập quốc tế toàn diện, sâu rộng; Việt Nam là bạn, là đối tác tin cậy và là thành viên tích cực, có trách nhiệm trong cộng đồng quốc tế”. </p> 
<p style="text-align: justify;">Kể từ khi Liên hợp quốc (LHQ) chính thức kết nạp Việt Nam trở thành quốc gia thành viên thứ 149 vào năm 1977, chúng ta đã không ngừng nỗ lực, chủ động và trách nhiệm đóng góp vào mục tiêu chung của thế giới, nhất là việc Việt Nam tham gia hoạt động gìn giữ hòa bình (GGHB) của LHQ. Cụ thể, tháng 11/2012, Bộ Chính trị thông qua Đề án tổng thể về việc Việt Nam tham gia hoạt động GGHB LHQ; sau đó, Quốc hội thông qua Nghị quyết số 130/2020/QH14 về tham gia lực lượng GGHB của LHQ. Đây là những bằng chứng thuyết phục cho cam kết của Việt Nam trong việc tham gia và giải quyết các vấn đề chung của quốc tế.</p> 
<p style="text-align: justify;">Ngày 27/5/2014, Trung tâm GGHB Việt Nam được thành lập. Ngay khi ra mắt, Trung tâm đã cử 2 sĩ quan đầu tiên đi làm nhiệm vụ cùng Phái bộ GGHB của LHQ tại Nam Sudan. Từ đây, những sĩ quan Quân đội nhân dân (QĐND) Việt Nam mang trên đầu chiếc mũ nồi xanh và mang trong tim dòng máu Lạc Hồng, truyền thống đoàn kết, nhân nghĩa của dân tộc để sẵn sàng nhận nhiệm vụ ở bất cứ đâu, mang lại hòa bình, ấm no, thịnh vượng cho mọi người dân trên thế giới. Đến năm 2022, Công an nhân dân Việt Nam cũng chính thức tham gia GGHB LHQ.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Trong 10 năm Việt Nam triển khai lực lượng tham gia sứ mệnh GGHB, chúng ta đã cử trên 800 lượt sĩ quan, quân nhân chuyên nghiệp triển khai theo hình thức cá nhân và đơn vị, trong đó có 5 thê đội (bộ phận của đội hình được sắp xếp theo bậc thang để hành động theo thứ tự - NV) của Bệnh viện dã chiến cấp 2 triển khai tại Phái bộ Nam Sudan; 2 thê đội của Đội Công binh triển khai tại khu vực Abyei và 114 lượt sĩ quan triển khai theo hình thức cá nhân. Số lượng cán bộ, sĩ quan hoàn thành xuất sắc nhiệm vụ của Việt Nam cao hơn nhiều so với mặt bằng chung của LHQ. Không chỉ vậy, Đội Công binh Việt Nam ở khu vực Abyei đã giúp đỡ chính quyền và người dân địa phương bằng những hành động thiết thực như xây dựng và tu sửa đường; xây dựng, cải tạo lớp học; dạy học tình nguyện; khoan giếng nước tặng khu dân cư địa phương và các trường học; khám, chữa bệnh, tư vấn sức khỏe và cấp phát thuốc miễn phí cho người dân...</p> 
<p style="text-align: justify;"><strong>Tinh thần đoàn kết quốc tế cao cả</strong></p> 
<p style="text-align: justify;">Cùng với việc hoàn thành nhiều trọng trách quốc tế quan trọng, Việt Nam đã đề xuất nhiều sáng kiến, giải pháp thúc đẩy hợp tác, đóng góp có trách nhiệm vào các vấn đề chung của thế giới như phòng, chống dịch bệnh, thiên tai, biến đổi khí hậu, an ninh lương thực; cử lực lượng hỗ trợ khắc phục hậu quả động đất tại Thổ Nhĩ Kỳ…</p> 
<p style="text-align: justify;"> “Cảm ơn Việt Nam” là câu nói xúc động của Tổng thống Thổ Nhĩ Kỳ Tayyip Erdogan khi gặp đoàn cứu hộ, cứu nạn của QĐND Việt Nam tại hai tỉnh Hatay và Kahramanmaras (tháng 2/2023). Ông nhấn mạnh, thảm họa động đất một lần nữa cho thấy tầm quan trọng của tình đoàn kết quốc tế. Thổ Nhĩ Kỳ sẽ không bao giờ quên tình bạn đó. Không chỉ là một trong những quốc gia đầu tiên nhanh chóng cử các lực lượng tham gia công tác tìm kiếm, cứu nạn, hỗ trợ người dân Thổ Nhĩ Kỳ, đoàn cứu hộ, cứu nạn của QĐND Việt Nam còn trao gần 25 tấn hàng viện trợ của Bộ Quốc phòng, gồm lương khô, gạo, sữa, thiết bị y tế và nhiều nhu yếu phẩm khác tặng Thổ Nhĩ Kỳ. Cùng với đó, đoàn công tác cứu nạn, cứu hộ quốc tế của Bộ Công an Việt Nam đã trao tặng 2 tấn thiết bị y tế cho Thổ Nhĩ Kỳ… </p> 
<p style="text-align: justify;">Gần đây, vào tháng 11/2023, thông qua LHQ, Việt Nam đã đóng góp 500.000 USD để cứu trợ nhân đạo người dân Palestine bị ảnh hưởng bởi xung đột ở dải Gaza, thể hiện tinh thần đoàn kết với nhân dân Palestine. Trước đó, khi động đất và sóng thần gây thiệt hại lớn tại Nhật Bản vào năm 2011, Chính phủ Việt Nam đã trợ giúp nhân dân Nhật Bản 200.000 USD để góp phần khắc phục hậu quả. Ngoài ra, hưởng ứng lời kêu gọi của Hội Chữ thập đỏ Việt Nam, đã có hàng nghìn tổ chức, cá nhân ủng hộ nhân dân Nhật Bản bị thiên tai với hơn 161 tỷ đồng (tương đương 7,783 triệu USD). </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Thể hiện vai trò nòng cốt, dẫn dắt, hòa giải</strong></p> 
<p style="text-align: justify;">Để triển khai hiệu quả, thực chất đường lối đối ngoại, tháng 8/2018, Ban Bí thư đã ban hành Chỉ thị số 25-CT/TW về đẩy mạnh và nâng tầm đối ngoại đa phương đến năm 2030, trong đó xác định: phấn đấu đóng vai trò nòng cốt, dẫn dắt, hòa giải tại các diễn đàn đa phương có tầm quan trọng chiến lược đối với đất nước, phù hợp với khả năng và điều kiện cụ thể. </p> 
<p style="text-align: justify;">Nhờ những định hướng này, vào năm Việt Nam đảm nhận vai trò Chủ tịch ASEAN 2020 đã thành công toàn diện, là một đỉnh cao thắng lợi của đường lối đối ngoại đa phương của Đảng. Theo đó, đã thông qua hơn 550 cuộc họp, nhiều sáng kiến, ưu tiên của Việt Nam đã trở thành tài sản chung của ASEAN. Trong Năm Chủ tịch ASEAN 2020 của Việt Nam, rất nhiều cái “đầu tiên” đã được sáng tạo để hoàn thành các mục tiêu đề ra: số lượng các Hội nghị tăng lên để kịp thời ứng phó với dịch Covid-19; nhiều Hội nghị Cấp cao, Bộ trưởng lần đầu được tổ chức trực tuyến; nhiều văn kiện quan trọng của ASEAN cũng được ký kết trực tuyến lần đầu tiên. Điều này đã minh chứng cho năng lực công nghệ và khả năng của Việt Nam trong kỷ nguyên chuyển đổi số.</p> 
<p style="text-align: justify;">Chúng ta đã không chỉ khéo léo, linh hoạt dẫn dắt, điều hòa những khác biệt giữa các quốc gia thành viên ASEAN để giữ vững hình ảnh đoàn kết, đồng thuận của Hiệp hội, mà còn xử lý hài hòa, hiệu quả các bất đồng giữa các đối tác, qua đó tất cả các hội nghị trong năm diễn ra thành công. Với thành công của Năm Chủ tịch ASEAN 2020, Việt Nam không còn chỉ là một thành viên tích cực, luôn nghiêm túc thực thi các thỏa thuận đã cam kết, mà đã trở thành một chỗ dựa vững chắc, tin cậy, đặc biệt trong những thời khắc ASEAN phải đối mặt với nhiều khó khăn, thách thức.</p> 
<p style="text-align: justify;">Phát biểu tại Hội nghị tổng kết 2 năm Việt Nam đảm nhiệm cương vị Ủy viên không thường trực Hội đồng Bảo an LHQ nhiệm kỳ 2020 - 2021 (tháng 1/2022), Thủ tướng Phạm Minh Chính nêu rõ, việc Việt Nam lần thứ hai đảm nhiệm vị trí quan trọng này (chỉ hơn 10 năm sau khi kết thúc nhiệm kỳ đầu tiên) với số phiếu bầu gần như tuyệt đối (192/193 phiếu) cho thấy vị thế của đất nước và sự tín nhiệm cao của quốc tế đối với chính sách đối ngoại của chúng ta… Việt Nam đã khẳng định được năng lực điều hành, từng bước thể hiện rõ vai trò nòng cốt, dẫn dắt, hòa giải tại các hội nghị Hội đồng Bảo an với nhiều dấu ấn tích cực, được các nước ủy viên Hội đồng Bảo an, kể cả các nước ủy viên thường trực, các nước bạn bè truyền thống, đang phát triển, các nước trong Phong trào không liên kết... coi trọng, đánh giá cao. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Tại cuộc gặp với Tổng Bí thư Nguyễn Phú Trọng trong khuôn khổ chuyến thăm chính thức Việt Nam (tháng 10/2022), Tổng Thư ký LHQ António Guterres cho rằng Việt Nam luôn thể hiện lập trường nguyên tắc trên những vấn đề về bảo vệ hòa bình, phát triển bền vững, đề cao Hiến chương LHQ, luật pháp quốc tế, nhất là những nguyên tắc cơ bản nhất. Việt Nam cũng tích cực hợp tác cùng LHQ và các đối tác quốc tế ứng phó với các vấn đề an ninh phi truyền thống ngày càng gay gắt.</p> 
<p style="text-align: justify;"> Những nỗ lực không ngừng nghỉ và những thành quả to lớn trong công tác đối ngoại Đảng, ngoại giao Nhà nước và đối ngoại nhân dân của Việt Nam đã góp phần rất quan trọng vào thành tựu chung to lớn, có ý nghĩa lịch sử của đất nước, như Đại hội XIII của Đảng đã khẳng định: “Đất nước ta chưa bao giờ có được cơ đồ, tiềm lực, vị thế và uy tín quốc tế như ngày nay”.</p> 
<blockquote style="text-align: justify;" class="quote cms-quote"> 
 <table class="picture"> 
  <tbody> 
   <tr> 
    <td class="pic"><img data-image-id="997611" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="740" data-height="416" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tong-thu-ky-lhq-antonio-guterres-anh-reuters-2301.jpeg" alt="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" title="Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)" width="740" height="416"></td> 
   </tr> 
   <tr> 
    <td class="caption"><p>Tổng Thư ký LHQ Antonio Guterres. (Ảnh: REUTERS)</p> </td> 
   </tr> 
  </tbody> 
 </table> 
 <p>“Cách đây chưa đầy một thế hệ, các nhân viên LHQ đã ở Việt Nam, hỗ trợ lương thực cho một quốc gia bị chiến tranh tàn phá và cô lập. Cũng chính Việt Nam hôm nay đã và đang gửi những người lính gìn giữ hòa bình đến giúp đỡ người dân ở những nơi khó khăn nhất trên thế giới, cách xa quê hương hàng nghìn dặm” - Tổng Thư ký LHQ Antonio Guterres chia sẻ tại Lễ kỷ niệm 45 năm Việt Nam gia nhập LHQ. </p> 
</blockquote>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Vân Thanh">Vân Thanh</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:25.283' AS DateTime), 1, 2, 2, 21, N'(PLVN) - Quán triệt tư tưởng mà Chủ tịch Hồ Chí Minh từng nhấn mạnh “giữ gìn hòa bình thế giới tức là giữ gìn lợi ích của nước ta”, Đảng và Nhà nước ta đã triển khai hiệu quả đường lối đối ngoại trên tinh thần chủ động và phát huy vai trò tại các cơ chế đa phương, là thành viên tích cực, có trách nhiệm của cộng đồng quốc tế.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (39, N'Việt Nam được bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003 về bảo vệ di sản văn hoá phi vật thể', N'https://image.baophapluat.vn/w840/Uploaded/2024/vngtsu/2024_06_11/tham-gia-hoat-dong-gin-giu-hoa-binh-lhq-gop-phan-nang-cao-vi-the-vai-tro-cua-viet-nam-doi-voi-the-gioi-anh-ttxvn-4797.jpg', N'<div class="article__body cms-body " itemprop="articleBody">
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" data-image-id="997747" data-width="1600" data-height="949" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong1-12624-6155.jpg" width="840" height="498"></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;"><em>Các đại biểu tham dự kỳ họp.</em></p> 
<p style="text-align: justify;">Theo phóng viên TTXVN tại Pháp, ngày 11/6, tại Trụ sở Tổ chức Giáo dục, Khoa học và Văn hoá Liên hợp quốc (UNESCO) ở thủ đô Paris, Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), đã khai mạc với sự tham dự của 183 quốc gia thành viên và hơn 100 quan sát viên. Thứ trưởng Bộ Ngoại giao Hà Kim Ngọc, Chủ tịch Ủy ban Quốc gia UNESCO Việt Nam, dẫn đầu Đoàn Việt Nam tham dự kỳ họp này.</p> 
<p style="text-align: justify;">Tại phiên khai mạc, Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003, đưa số lượng các cơ chế then chốt của UNESCO mà Việt Nam tham gia lên con số 6 (thành viên Uỷ ban Di sản thế giới và Hội đồng Chấp hành UNESCO, Phó Chủ tịch Đại hội đồng UNESCO, Phó Chủ tịch Ủy ban liên Chính phủ Công ước 2005 về bảo vệ và phát huy sự đa dạng của các biểu đạt văn hóa, Phó Chủ tịch Ủy ban liên Chính phủ và Phó Chủ tịch Đại hội đồng Công ước 2003).</p> 
<p style="text-align: justify;">Chủ tịch Uỷ ban Quốc gia UNESCO Việt Nam Hà Kim Ngọc nhấn mạnh ý nghĩa quan trọng của sự kiện này, một lần nữa cho thấy vị thế và uy tín quốc tế ngày càng cao của Việt Nam, sự ủng hộ, tin tưởng của cộng đồng quốc tế đối với vai trò và năng lực điều hành của ta tại các thể chế đa phương toàn cầu, và đặc biệt là sự ghi nhận đối với những đóng góp của Việt Nam trong gìn giữ, bảo tồn và phát huy giá trị di sản phi vật thể trong nước và trên thế giới. Đây cũng là kết quả của việc triển khai chính sách đối ngoại đúng đắn của Đảng và Nhà nước về đa phương hóa, đa dạng hóa và hội nhập quốc tế toàn diện, sâu rộng, chủ trương đẩy mạnh và nâng tầm đối ngoại đa phương, cũng như Chiến lược Ngoại giao văn hoá đến năm 2030.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ở vị trí điều hành, Việt Nam sẽ trực tiếp tham gia vào quá trình xây dựng, thông qua các quyết định quan trọng của UNESCO về văn hóa, đóng góp hơn nữa cho việc hoàn thiện, thực hiện các mục tiêu của Công ước 2003, cũng như tranh thủ các chương trình, kế hoạch, sáng kiến của UNESCO phục vụ phát triển đất nước, bảo tồn và phát huy giá trị di sản, bảo đảm cao nhất lợi ích quốc gia, dân tộc trong hợp tác văn hóa ở tầm toàn cầu.</p> 
<p style="text-align: justify;">Phát biểu tại phiên khai mạc toàn thể của Kỳ họp lần thứ 10, Thứ trưởng Ngoại giao Hà Kim Ngọc đánh giá cao nỗ lực của Ủy ban liên Chính phủ, Ban thư ký và các quốc gia thành viên Công ước 2003 trong thúc đẩy các mục tiêu của Công ước, nâng cao nhận thức về vai trò của bảo vệ và trao truyền di sản phi vật thể, đặt cộng đồng vào trung tâm của nỗ lực bảo tồn di sản. Thứ trưởng khẳng định Việt Nam, với 15 di sản văn hóa phi vật thể đã được ghi danh và 550 di sản văn hóa phi vật thể cấp quốc gia, luôn luôn quan tâm bảo vệ di sản văn hóa phi vật thể, không ngừng xây dựng và hoàn thiện chính sách, luật pháp quốc gia, và gần đây nhất là Chương trình Mục tiêu Quốc gia về Phát triển Văn hóa đến 2045, và Luật Di sản văn hóa sửa đổi.</p> 
<p style="text-align: justify;">Thứ trưởng Hà Kim Ngọc đề xuất UNESCO và các nước thành viên cần tiếp tục tăng cường hợp tác quốc tế, triển khai hiệu quả Công ước, ưu tiên chia sẻ kinh nghiệm, tăng cường năng lực cho các nước đang phát triển, các quốc gia Châu Phi, nhóm đảo nhỏ đang phát triển, thúc đẩy tham gia và đóng góp của cộng đồng, phụ nữ và thanh niên.</p> 
<table class="picture" align="center" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td><img src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" data-image-id="997748" data-width="1600" data-height="766" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/bpivpvoi/2024_06_12/hoi-dong2-12624-8861.jpg" width="840" height="402"></td> 
  </tr> 
 </tbody> 
</table>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Các đại biểu chụp ảnh chung.</p> 
<p style="text-align: justify;">Các quốc gia thành viên Công ước 2003 đánh giá cao những kinh nghiệm, hiểu biết và nỗ lực của Việt Nam trong bảo vệ và phát huy di sản văn hoá phi vật thể ở cả phương diện lý luận, luật pháp và thực tiễn, là bài học tốt cho nhiều quốc gia ở khu vực và quốc tế, góp phần bảo vệ khẩn cấp những di sản có nguy cơ bị mai một, gìn giữ những di sản đại diện cho nhân loại và quảng bá những hình mẫu di sản được bảo vệ tốt trên thế giới.</p> 
<p style="text-align: justify;">Diễn ra trong hai ngày, 11 và 12/6, Kỳ họp lần thứ 10 của Đại hội đồng Công ước 2003 là dịp để các nước thành viên cùng nhau thảo luận các vấn đề quan trọng đối với tương lai của Công ước và hướng các nỗ lực của các quốc gia và cộng đồng vào việc bảo vệ di sản sống của thế giới. Các chủ đề chính trong chương trình nghị sự bao gồm: tổng kết các hoạt động của Đại hội đồng giai đoạn 2022-2023; xem xét việc triển khai rộng rãi hơn Điều 18 của Công ước; xây dựng kế hoạch sử dụng nguồn lực của Quỹ Di sản văn hóa phi vật thể vào năm 2024 và 2025; công nhận các tổ chức phi chính phủ mới và bầu 12 thành viên mới của Ủy ban.</p> 
<p style="text-align: justify;">Đại hội đồng Công ước 2003 là cơ quan quyền lực cao nhất của UNESCO trong lĩnh vực bảo vệ di sản văn hoá phi vật thể, gồm đại diện của 183 nước thành viên. Đại hội đồng quyết định những vấn đề quan trọng liên quan đến chính sách, đường lối phát triển của Công ước, phân bổ kinh phí hỗ trợ công tác bảo tồn di sản phi vật thể ở các quốc gia, bầu Uỷ ban liên Chính phủ Công ước 2003. Việt Nam chính thức tham gia Công ước 2003 vào ngày 05/09/2005, trở thành một trong 30 quốc gia đầu tiên trên thế giới gia nhập Công ước quan trọng này. Là một thành viên tích cực và có trách nhiệm, Việt Nam đã 2 lần được tín nhiệm, trúng cử vào Ủy ban Liên Chính phủ về bảo vệ di sản văn hóa phi vật thể. Tinh thần của Công ước đã được vận dụng vào Luật sửa đổi, bổ sung một số điều của Luật Di sản văn hóa năm 2009 và vào thực tiễn hoạt động bảo vệ và phát huy giá trị di sản văn hóa phi vật thể ở Việt Nam, với những kết quả rất đáng ghi nhận.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện nay, Việt Nam đang trong quá trình hoàn thiện, đệ trình và thúc đẩy việc ghi danh các hồ sơ đề cử như: Quần thể di tích và danh thắng Yên Tử - Vĩnh Nghiêm - Côn Sơn, Kiếp Bạc; Khu di tích khảo cổ Óc Eo-Ba Thê; Hang Con Moong; Lễ hội Vía bà Chúa Xứ núi Sam; Nghệ thuật Tranh dân gian Đông Hồ; Nghệ thuật Chèo; Mo Mường; Công viên địa chất Lạng Sơn; và đặc biệt là Dự án bảo tồn và phát huy giá trị khu Trung tâm Hoàng thành Thăng Long - Hà Nội.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Theo TTXVN">Theo TTXVN</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:25.283' AS DateTime), 1, 3, 4, 22, N'Tại phiên khai mạc Kỳ họp lần thứ 10 Đại hội đồng Công ước 2003 về bảo vệ di sản văn hóa phi vật thể (Công ước 2003), Việt Nam đã được các nước thành viên tín nhiệm cao bầu làm Phó Chủ tịch Đại hội đồng Công ước 2003.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (40, N'Truy tìm đối tượng tên ''Hoàng'' nghi hiếp dâm trẻ em', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;">Thông tin từ Công an TP Hà Nội, Cơ quan CSĐT Công an quận Thanh Xuân đang điều tra vụ án hình sự "Hiếp dâm người dưới 16 tuổi" xảy ra trong khoảng thời gian từ ngày 20/8/2022 đến ngày 27/2/2023 tại nhà nghỉ trên địa bàn phường Nhân Chính, quận Thanh Xuân.</p> 
<p style="text-align: justify;">Ngày 23/5/2024, Cơ quan CSĐT - Công an quận Thanh Xuân đã ra quyết định khởi tố vụ án hình sự “hiếp dâm” người dưới 16 tuổi để điều tra làm rõ vụ án. Theo đó, Công an quận Thanh Xuân xác định đối tượng tình nghi có hành vi hiếp dâm người dưới 16 tuổi tên là “Hoàng”. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Hiện chưa rõ nhân thân lai lịch của đối tượng. Để phục vụ điều tra, Công an quận Thanh Xuân quyết định truy tìm đối tượng trên.</p> 
<p style="text-align: justify;">"Ai biết thông tin về đối tượng thì báo ngay cho Cơ quan CSĐT Công an quận Thanh Xuân (SĐT: 0866.183.988), cơ quan Công an nơi gần nhất hoặc cung cấp thông tin qua trang facebook Công an thành phố Hà Nội để phối hợp giải quyết vụ việc theo quy định", Công an TP Hà Nội thông báo.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Bùi Lan">Bùi Lan</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:25.283' AS DateTime), 1, 2, 6, 23, N'(PLVN) - Ai biết thông tin về đối tượng trong ảnh ở đâu cần báo ngay cho Công an quận Thanh Xuân, TP Hà Nội, theo số điện thoại 0866.183.988.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (41, N'Cần giải pháp đồng bộ để quản lý thị trường tín chỉ carbon', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<div class="notebox nright cms-note" align="right" style="text-align: justify;">
 <p> Kinh tế xanh đang mở ra nhiều cơ hội nhưng cũng đặt ra không ít thách thức. Đây là một vấn đề khá mới mẻ tại Việt Nam, đặc biệt là thị trường tín chỉ carbon - đang được cộng đồng doanh nghiệp rất quan tâm vì những lợi ích mà nó mang lại cũng như các vướng mắc về pháp lý… </p> 
 <p><strong>Những vấn đề trên được bàn thảo, giải đáp trong Chương trình Tọa đàm với chủ đề: “Thị trường tín chỉ carbon: Góc nhìn từ kinh tế, môi trường và khuôn khổ pháp lý” do Báo Pháp luật Việt Nam tổ chức vào hôm nay, 12/6, tại Phòng Hội thảo - Khách sạn Mường Thanh, TP Hồ Chí Minh.</strong> </p> 
 <p> Những vấn đề như: Quy định của pháp luật Việt Nam về tín chỉ carbon (cơ sở pháp lý để được công nhận tín chỉ carbon hiện nay tại Việt Nam…); Những mặt tích cực, những thiếu sót, bất cập, vướng mắc liên quan tới tín chỉ carbon hiện nay tại Việt Nam; Doanh nghiệp (cả doanh nghiệp phát thải lẫn doanh nghiệp cung cấp, kinh doanh tín chỉ carbon), người dân sẽ được lợi gì khi tham gia thị trường tín chỉ carbon… sẽ được các chuyên gia đầu ngành, khách mời ở các Bộ ngành, doanh nghiệp… giải đáp, kiến nghị.</p>
</div> 
<p style="text-align: justify;"><em>GS. TS Võ Xuân Vinh (Viện trưởng Viện Nghiên cứu Kinh doanh, ĐH Kinh tế TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước</strong></p> 
<p style="text-align: justify;">“Việt Nam có hơn 14 triệu ha rừng, với tiềm năng tạo ra tín chỉ carbon từ các dự án bảo vệ và phục hồi rừng. Các chương trình như REDD+ (Reducing Emissions from Deforestation and Forest Degradation) đã giúp Việt Nam đạt được hàng triệu tín chỉ carbon từ việc bảo vệ và phục hồi rừng.</p> 
<p style="text-align: justify;"> Với ước tính có thể bán ra 57 triệu tín chỉ carbon cho các tổ chức quốc tế, Việt Nam có thể thu về hàng trăm triệu USD/năm. Giá tín chỉ carbon hiện tại khoảng 5 USD/tín chỉ.</p> 
<p style="text-align: justify;">Vậy số tiền này sẽ được chi trả cho người trồng rừng hay chi trả cho Nhà nước, hay theo tỷ lệ nào?. </p> 
<p style="text-align: justify;">Theo Điều 139 Luật Bảo vệ môi trường 2020, Nhà nước khuyến khích việc tham gia TTTC carbon và có các quy định về trách nhiệm, quyền lợi của các bên tham gia. Tuy nhiên, Luật này chưa quy định chi tiết về tỷ lệ phân chia thu nhập từ tín chỉ carbon. Do đó, tỷ lệ phân chia thu nhập có lẽ sẽ được xác định dựa trên hợp đồng thỏa thuận giữa các bên liên quan.</p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<table class="picture"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997609" src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" data-width="692" data-height="536" class="cms-photo lazyloaded" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h4-1376.jpg" alt="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" title="GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)" width="692" height="536"><br>GS. TS Võ Xuân Vinh. (Ảnh: P.Thảo)</td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Mặt khác, việc cạnh tranh trong việc bán tín chỉ carbon có thể gia tăng khi nhiều DN cùng tham gia thị trường, đòi hỏi DN phải nâng cao năng lực cạnh tranh và tìm kiếm các thị trường mới. Nguy cơ gian lận trong báo cáo và giám sát lượng phát thải cũng có thể ảnh hưởng đến uy tín và hiệu quả của DN, yêu cầu DN phải tuân thủ nghiêm ngặt các quy định và xây dựng hệ thống giám sát minh bạch.</p> 
<p style="text-align: justify;">Tôi cho rằng, phát triển một TTTC carbon nội địa mạnh mẽ là yếu tố then chốt để thúc đẩy sự tham gia của các DN và người dân. Cần thiết lập các sàn giao dịch tín chỉ carbon trong nước, tạo ra nền tảng để các bên có thể giao dịch một cách minh bạch và hiệu quả. Bên cạnh đó, cần khuyến khích sự tham gia của các tổ chức tài chính, quỹ đầu tư vào thị trường này để tăng tính thanh khoản và đa dạng hóa các loại hình tín chỉ carbon có thể giao dịch.</p> 
<p style="text-align: justify;">Đặc biệt, nên khuyến khích đầu tư vào công nghệ xanh và các dự án giảm phát thải thông qua các chính sách hỗ trợ tài chính và ưu đãi thuế. Việc áp dụng công nghệ xanh không chỉ giúp giảm thiểu phát thải khí nhà kính, mà còn nâng cao hiệu quả sản xuất và kinh doanh của các DN. Các dự án năng lượng tái tạo, công nghệ tiết kiệm năng lượng và cải thiện quy trình sản xuất sạch là những lĩnh vực cần được ưu tiên đầu tư để đạt được mục tiêu phát triển bền vững…”.</p> 
<p style="text-align: justify;"><em>TS Võ Trung Tín (Trưởng bộ môn Luật Đất đai - Môi trường, Khoa Luật Thương mại, Trường ĐH Luật TP HCM):</em></p> 
<p style="text-align: justify;"><strong>Cần có quy trình thực hiện dự án tín chỉ carbon</strong></p> 
<p style="text-align: justify;">“Về tăng cường công tác quản lý tín chỉ carbon, Bộ TN&amp;MT cần chủ trì, phối hợp các Bộ, ngành liên quan sửa đổi Nghị định 06/2022/NĐ-CP. Trong đó, tôi cho rằng cần bổ sung các quy định như với dự án tín chỉ carbon nói chung, cần có quy trình thực hiện dự án tín chỉ carbon. </p> 
<p style="text-align: justify;">Tôi cho rằng một dự án tín chỉ carbon trong khuôn khổ Công ước khung của Liên hợp quốc về biến đổi khí hậu (UNFCCC) cần trải qua các bước cơ bản như: Đăng ký ý tưởng dự án và phương pháp luận; Đăng ký dự án; Báo cáo thực hiện dự án; Thẩm định và cấp tín chỉ carbon. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle1" class="banner fyi" data-position="Web_AdsArticleMiddle1" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle1 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle1, ''adsWeb_AdsArticleMiddle1'');}else{document.getElementById(''adsWeb_AdsArticleMiddle1'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Về cơ quan thẩm quyền, Chính phủ có thể giao cho từng Bộ quản lý công nhận phương pháp luận, phê duyệt ý tưởng dự án, phê duyệt dự án, cấp tín chỉ carbon phù hợp với trách nhiệm tổ chức thực hiện hệ thống giám sát - báo cáo - thẩm định (MRV) cấp lĩnh vực, cấp cơ sở thuộc phạm vi quản lý của các Bộ quản lý lĩnh vực.</p> 
<p style="text-align: justify;">Với các dự án Sáng kiến giảm phát thải từ mất rừng và suy thoái rừng (REDD), Việt Nam có độ che phủ rừng 42% nên tiềm năng thực hiện dự án tín chỉ carbon là rất lớn. Tuy nhiên, dự án REDD cũng có một số hạn chế dẫn đến tổ chức, cá nhân ngoài Nhà nước chưa thể đầu tư thực hiện. Cụ thể, chúng ta chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon. Kết quả giảm phát thải từ dự án REDD chỉ trở thành sản phẩm hàng hóa để chuyển nhượng; khi được xác nhận là tín chỉ phải qua quá trình nghiên cứu khả thi, lập dự án theo tiêu chuẩn carbon phù hợp, thẩm tra hồ sơ, xác nhận tín chỉ, phát hành và chuyển nhượng, trao đổi, bù trừ. </p> 
<p style="text-align: justify;">Đây là một quá trình đặc thù, khác với nhiều lĩnh vực khác bởi nhiều giai đoạn phải được các tổ chức độc lập thực hiện, trong khi các quy định hiện hành ở Việt Nam chưa có hoặc có nhưng không phù hợp với thị trường carbon và thông lệ quốc tế.</p> 
<table class="picture" style="text-align: justify;"> 
 <tbody> 
  <tr> 
   <td class="pic"><img data-image-id="997598" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-width="854" data-height="1280" class="lazyload  cms-photo" data-src="https://image.baophapluat.vn/w840/Uploaded/2024/jihvwawbvhfobu/2024_06_11/h5-1080.jpg" alt="TS Võ Trung Tín. (Ảnh: P.Thảo)" title="TS Võ Trung Tín. (Ảnh: P.Thảo)" width="840" height="1259"></td> 
  </tr> 
  <tr> 
   <td class="caption"><p>TS Võ Trung Tín. (Ảnh: P.Thảo)</p></td> 
  </tr> 
 </tbody> 
</table> 
<p style="text-align: justify;">Vì chưa có các quy định rõ ràng về pháp lý liên quan đến đầu tư, đất đai, lâm nghiệp và cơ chế chia sẻ lợi ích giữa các bên liên quan trong dự án nên các dự án REDD chủ yếu được các cơ quan nhà nước trực tiếp triển khai. Hiện chỉ có Cty SK Forest đang dự định ký kết Thư ý định với Bộ TN&amp;MT để có cơ sở thực hiện dự án.</p> 
<p style="text-align: justify;">Về vấn đề này, tôi cho rằng, cần ban hành quy định với quyền sở hữu tín chỉ carbon rừng. Các quốc gia trên thế giới đều có xu hướng làm rõ quyền với tín chỉ carbon từ dự án REDD. Khung pháp lý cần cho nhà đầu tư hiểu rõ được họ có quyền sở hữu với carbon được cô lập từ các dự án bảo vệ rừng, quyền hưởng lợi từ việc cung cấp và bán dịch vụ giảm phát thải, quyền chuyển nhượng tín chỉ carbon, cũng như các nghĩa vụ kèm theo”. </p> 
<p style="text-align: justify;"><em>LS Lê Duy Khang (Cty Luật TNHH MTV Tín và Tâm):</em></p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle2" class="banner fyi" data-position="Web_AdsArticleMiddle2" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle2 != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle2, ''adsWeb_AdsArticleMiddle2'');}else{document.getElementById(''adsWeb_AdsArticleMiddle2'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;"><strong>Vấn đề phí và thuế chuyển nhượng với tín chỉ carbon cần được làm rõ</strong></p> 
<p style="text-align: justify;">“Hiện nay, các quy định về thuế trong Quyết định 130/2007/QĐ-TTg chỉ được áp dụng với các giao dịch tín chỉ carbon hình thành từ dự án cơ chế phát triển sạch (CDM). Các loại tín chỉ carbon khác nhau từ nhiều cơ chế khác nhau liệu có cách xử lý thuế khác nhau? Trong đó, ba vấn đề quan trọng mà các nhà đầu tư quan tâm; là tiền thu được từ việc chuyển nhượng tín chỉ carbon có được miễn thuế thu nhập hay không? Thuế giá trị gia tăng có được áp dụng với giá trị tăng thêm của tín chỉ carbon khi giao dịch trên sàn không? Trong trường hợp xuất khẩu tín chỉ carbon (bán cho đối tác nước ngoài), thuế suất với tín chỉ carbon được xác định như thế nào?</p> 
<p style="text-align: justify;">Tôi đề xuất, vấn đề thuế của tín chỉ carbon nói riêng cũng như hạn ngạch phát thải nói chung cần được nghiên cứu và ban hành đồng bộ. Dự kiến, lộ trình sàn giao dịch tín chỉ carbon sẽ được vận hành vào 2025 và đi vào hoạt động chính thức năm 2028. Nếu chậm trễ ban hành sẽ dẫn đến thiệt hại cho cả Nhà nước về thất thu ngân sách và gây khó khăn cho DN phải xử lý về mặt kế toán đối với loại tài sản mới này”.</p>





<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:25.283' AS DateTime), 1, 1, 8, 24, N'(PLVN) - Việt Nam chưa có quy định về sở hữu tín chỉ carbon rừng trong mối quan hệ với quyền sở hữu rừng, quyền sử dụng rừng; trong khi đây là điều kiện rất quan trọng để thực hiện chuyển nhượng tín chỉ carbon... Để xây dựng và phát triển một TTTC carbon đồng bộ, Việt Nam cần sớm triển khai đồng bộ một số giải pháp. Báo Pháp luật Việt Nam ghi nhận một số ý kiến đề xuất của các chuyên gia đầu ngành về vấn đề này.')
GO
INSERT [dbo].[Post] ([postId], [title], [imageURL], [content], [createdDate], [createdBy], [categoryId], [tagId], [innerTagId], [description]) VALUES (42, N'Muốn thi văn bằng 2 vào ngành Công an cần đáp ứng những điều kiện gì?', NULL, N'<div class="article__body cms-body " itemprop="articleBody">
<p style="text-align: justify;"><strong>Bộ Công an hướng dẫn:</strong> Tuyển sinh tuyển mới đào tạo trình độ đại học Công an nhân dân đối với công dân tốt nghiệp trình độ đại học trở lên các trường ngoài ngành Công an nhân dân thực hiện theo hướng dẫn tuyển sinh hàng năm của Bộ Công an.</p> 
<p style="text-align: justify;">Để được tuyển sinh, thí sinh cần đảm bảo đủ điều kiện về học lực trình độ đại học mà thí sinh đã theo học, đủ tiêu chuẩn sức khỏe và tiêu chuẩn chính trị theo quy định của Bộ Công an. </p>
<div class="ads_middle">
 <div id="adsWeb_AdsArticleMiddle" class="banner fyi" data-position="Web_AdsArticleMiddle" style="display: none;"> 
  <script>
window.addEventListener(''load'', function(){ if(typeof Web_AdsArticleMiddle != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleMiddle, ''adsWeb_AdsArticleMiddle'');}else{document.getElementById(''adsWeb_AdsArticleMiddle'').style.display = "none";} });
   </script> 
 </div>
</div> 
<p style="text-align: justify;">Ngoài ra, thí sinh cần đáp ứng một số điều kiện cơ bản như: có tuổi đời không quá 30 tuổi (được xác định theo giấy khai sinh, tính đến ngày dự thi); chiều cao đạt từ 1m64 đến 1m95 đối với nam; chỉ số khối cơ thể (BMI) được tính bằng trọng lượng (đơn vị tính: ki-lô-gam) chia cho bình phương chiều cao (đơn vị tính: mét) đạt từ 18,5 đến 30; nếu mắt bị khúc xạ thì không quá 3 đi-ốp; xếp hạng bằng tốt nghiệp đại học từ loại khá trở lên... </p> 
<p style="text-align: justify;">Để biết cụ thể hơn về các điều kiện dự tuyển, thí sinh cần theo dõi thông tin tuyển sinh được thông báo công khai trên các phương tiện thông tin đại chúng, các buổi tuyên truyền hướng nghiệp của các học viện, trường Công an nhân dân để biết cụ thể về tiêu chuẩn, điều kiện dự tuyển trong năm tuyển sinh.</p>


<div class="article__author">

<div class="author">

<div class="info">
<a href="javascript:void(0);" class="name cms-author" title="Minh Trang">Minh Trang</a>

</div>
</div>
 </div>



<div id="adsWeb_AdsArticleAfterBody" class="banner clearfix" data-platform="1" data-position="Web_AdsArticleAfterBody" style="display: none;">
<script>
window.addEventListener(''load'', function(){
if(typeof Web_AdsArticleAfterBody != ''undefined''){window.CMS_BANNER.pushAds(Web_AdsArticleAfterBody, ''adsWeb_AdsArticleAfterBody'');}else{document.getElementById(''adsWeb_AdsArticleAfterBody'').style.display = "none";}
});
</script>
</div>
</div>', CAST(N'2024-06-12T09:55:25.283' AS DateTime), 1, 1, 10, 25, N'(PLVN) - Sinh viên một trường đại học muốn sau khi tốt nghiệp sẽ đăng ký vào trường Công an nhân dân theo phương án thi Văn bằng 2. Vậy để được thi Văn bằng 2 vào ngành công an cần chuẩn bị những điều kiện gì?')
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Manager')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'User')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (1, N'THỜI SỰ - CHÍNH TRỊ')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (2, N'TƯ PHÁP')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (3, N'KINH TẾ')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (4, N'QUỐC TẾ')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (5, N'PHÁP LUẬT')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (6, N'XÃ HỘI')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (7, N'VĂN HÓA')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (8, N'KINH TẾ')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (9, N'BẤT ĐỘNG SẢN')
GO
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (10, N'BẠN ĐỌC')
GO
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[PostView] ADD  CONSTRAINT [DF_PostView_viewDate]  DEFAULT (getdate()) FOR [viewDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([postId])
REFERENCES [dbo].[Post] ([postId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[InnerTag]  WITH CHECK ADD  CONSTRAINT [FK_InnerTag_Tag] FOREIGN KEY([tagId])
REFERENCES [dbo].[Tag] ([tagId])
GO
ALTER TABLE [dbo].[InnerTag] CHECK CONSTRAINT [FK_InnerTag_Tag]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_InnerTag] FOREIGN KEY([innerTagId])
REFERENCES [dbo].[InnerTag] ([innerTagId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_InnerTag]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tag] FOREIGN KEY([tagId])
REFERENCES [dbo].[Tag] ([tagId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Tag]
GO
ALTER TABLE [dbo].[PostView]  WITH CHECK ADD  CONSTRAINT [FK_PostView_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[PostView] CHECK CONSTRAINT [FK_PostView_Account]
GO
ALTER TABLE [dbo].[PostView]  WITH CHECK ADD  CONSTRAINT [FK_PostView_Post] FOREIGN KEY([postId])
REFERENCES [dbo].[Post] ([postId])
GO
ALTER TABLE [dbo].[PostView] CHECK CONSTRAINT [FK_PostView_Post]
GO
USE [master]
GO
ALTER DATABASE [webbaophapluat] SET  READ_WRITE 
GO
