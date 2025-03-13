-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 12, 2025 lúc 04:31 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `note_management`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_pinned` tinyint(4) DEFAULT 0,
  `category` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `font_size` varchar(20) DEFAULT '16px',
  `note_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `title`, `content`, `created_at`, `modified_at`, `is_pinned`, `category`, `tags`, `password`, `image`, `font_size`, `note_color`) VALUES
(60, 19, 'Hôm nay tôi mệt', 'content', '2025-03-10 16:57:04', '2025-03-12 12:36:28', 1, 'category', 'tagggg,huhi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\"]', '16px', '#5e55e9'),
(61, 19, 'okok', 'content', '2025-03-10 16:58:02', '2025-03-12 12:36:28', 1, 'category', 'tagggg,huhi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\"]', '16px', '#5e55e9'),
(62, 19, 'okok', 'content', '2025-03-10 16:58:22', '2025-03-12 12:36:28', 1, 'category', 'omg,igi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\"]', '16px', '#5e55e9'),
(63, 19, 'okok', 'content', '2025-03-10 16:59:15', '2025-03-12 12:36:28', 1, 'category', 'omg,igi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\",\"uploads\\/\\u0111otongquat.png\",\"uploads\\/all.drawio.png\"]', '16px', '#5e55e9'),
(64, 18, 'Nonem', 'content', '2025-03-10 17:07:06', '2025-03-12 12:36:28', 1, 'category', 'omg,igi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\",\"uploads\\/\\u0111otongquat.png\",\"uploads\\/all.drawio.png\"]', '16px', '#5e55e9'),
(65, 18, 'sdijsfil', 'content', '2025-03-10 17:08:35', '2025-03-12 12:36:28', 1, 'category', 'omg,igi', '123456', '[\"uploads\\/vivo-y100-128gb-(10).jpg\",\"uploads\\/\\u0111otongquat.png\",\"uploads\\/all.drawio.png\"]', '16px', '#5e55e9'),
(66, 18, 'sdijsfil', 'content', '2025-03-10 17:40:12', '2025-03-12 12:36:28', 1, 'category', 'omg,igi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\",\"uploads\\/\\u0111otongquat.png\",\"uploads\\/all.drawio.png\"]', '16px', '#5e55e9'),
(67, 18, 'Test cap nhat ghi chu', 'content', '2025-03-10 17:40:15', '2025-03-12 12:36:28', 1, 'category', 'omg,igi', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\",\"uploads\\/\\u0111otongquat.png\",\"uploads\\/all.drawio.png\"]', '16px', '#5e55e9'),
(69, 18, 'Tôi đang thử ghi chú', 'Tôi đang thử ghi chú bằng api', '2025-03-11 07:05:15', '2025-03-12 12:36:28', 0, 'test, api', 'demo, test thử', '', '[\"uploads\\/vivo-y100-128gb-(10).jpg\"]', '16px', '#5e55e9');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `note_history`
--

CREATE TABLE `note_history` (
  `id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `note_history`
--

INSERT INTO `note_history` (`id`, `note_id`, `user_id`, `action`, `timestamp`) VALUES
(44, 58, 19, 'Đã tạo mới ghi chú.', '2025-03-10 23:52:55'),
(45, 59, 19, 'Đã tạo mới ghi chú.', '2025-03-10 23:56:29'),
(46, 60, 19, 'Đã tạo mới ghi chú.', '2025-03-10 23:57:04'),
(47, 61, 19, 'Đã tạo mới ghi chú.', '2025-03-10 23:58:02'),
(48, 62, 19, 'Đã tạo mới ghi chú.', '2025-03-10 23:58:22'),
(49, 63, 19, 'Đã tạo mới ghi chú.', '2025-03-10 23:59:15'),
(51, 63, 19, 'Đã chia sẻ ghi chú với quocdat51930@gmail.com', '2025-03-11 00:03:09'),
(52, 64, 18, 'Đã tạo mới ghi chú.', '2025-03-11 00:07:06'),
(55, 65, 18, 'Đã chia sẻ ghi chú với quocdat51930@gmail.com', '2025-03-11 00:25:50'),
(56, 66, 18, 'Đã tạo mới ghi chú.', '2025-03-11 00:40:12'),
(57, 67, 18, 'Đã tạo mới ghi chú.', '2025-03-11 00:40:15'),
(58, 69, 18, 'Đã tạo mới ghi chú.', '2025-03-11 14:05:15'),
(59, 67, 18, 'Đã thay đổi mật khẩu ghi chú cá nhân 67', '2025-03-11 14:28:43'),
(60, 67, 18, 'Đã thay đổi mật khẩu ghi chú 67', '2025-03-11 14:28:43'),
(61, 67, 18, 'Bảo vệ bằng mật khẩu đã được tắt.', '2025-03-11 14:36:01'),
(62, 65, 18, 'Đã chia sẻ ghi chú với quocdat51930@gmail.com', '2025-03-11 15:07:21'),
(63, 65, 18, 'Đã chia sẻ ghi chú với quocdat51930@gmail.com', '2025-03-11 15:11:22'),
(65, 65, 18, 'Đã chỉnh sửa quyền truy cập ghi chú thành read', '2025-03-12 10:16:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `note_tags`
--

CREATE TABLE `note_tags` (
  `note_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `note_tags`
--

INSERT INTO `note_tags` (`note_id`, `tag_id`) VALUES
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 3),
(62, 4),
(63, 3),
(63, 4),
(64, 5),
(64, 6),
(65, 5),
(65, 6),
(66, 5),
(66, 6),
(67, 5),
(67, 6),
(69, 7),
(69, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires`, `created_at`) VALUES
(1, 'quocdat51930@gmail.com', 'f342743c8692373ef1aa100c582c0d76b20042d1b05a8620177febb9007d2ff68256da003fc6a20b67da720608530e157009', '2025-03-12 16:44:37', '2025-03-12 15:29:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shared_notes`
--

CREATE TABLE `shared_notes` (
  `id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `permission` enum('read','edit') NOT NULL,
  `access_password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `shared_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shared_notes`
--

INSERT INTO `shared_notes` (`id`, `note_id`, `recipient_email`, `permission`, `access_password`, `created_at`, `shared_by`) VALUES
(20, 64, 'quocdatforworkv2@gmail.com', 'edit', '69f49a1b4a', '2025-03-11 00:25:46', 17),
(24, 65, 'quocdat51930@gmail.com', 'read', '27051952be', '2025-03-11 15:11:18', 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `user_id`, `name`) VALUES
(1, 19, 'tagggg'),
(2, 19, 'huhi'),
(3, 19, 'omg'),
(4, 19, 'igi'),
(5, 18, 'omg'),
(6, 18, 'igi'),
(7, 18, 'demo'),
(8, 18, 'test thử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(4) DEFAULT 0,
  `activation_token` varchar(255) DEFAULT NULL,
  `preferences` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `image` varchar(255) DEFAULT 'https://cdn-icons-png.flaticon.com/512/9187/9187604.png',
  `theme` enum('light','dark') DEFAULT 'light'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `display_name`, `password`, `is_active`, `activation_token`, `preferences`, `image`, `theme`) VALUES
(17, 'huyv8867@gmail.com', 'Trần Văn Huy', '$2y$10$oSnXWnUOZqsMYP7wsuHio.VW37jRCX0WZVtRrwUsn/wkCCALv04/W', 1, NULL, NULL, 'https://cdn-icons-png.flaticon.com/512/9187/9187604.png', 'light'),
(18, 'quocdatforworkv2@gmail.com', 'Nguyễn Quốc', '$2y$10$1d.lgoB/kZb2H.EdQL4yWuNsC/8KavP04uRTa5e0ZuC2cwfIlxjZ.', 1, NULL, NULL, 'https://cdn-icons-png.flaticon.com/512/9187/9187604.png', 'dark'),
(19, 'mtriet10052005@gmail.com', 'Triet', '$2y$10$1ZvdAlqPBQdThgESyq7.ze5Varcv8ZjLySKpx84GOiBQV..vwEdsW', 1, NULL, NULL, 'https://cdn-icons-png.flaticon.com/512/9187/9187604.png', 'light'),
(21, 'quocdat51930@gmail.com', 'Nguyen Dat', '$2y$10$i6c6cffMjeqWVK8R560Agu9XgBdgZUM.nZvQDye8Ce5L347dxJZ2O', 1, NULL, NULL, 'https://cdn-icons-png.flaticon.com/512/9187/9187604.png', 'light');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_notes` (`user_id`);

--
-- Chỉ mục cho bảng `note_history`
--
ALTER TABLE `note_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `note_id` (`note_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `note_tags`
--
ALTER TABLE `note_tags`
  ADD PRIMARY KEY (`note_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shared_notes`
--
ALTER TABLE `shared_notes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `note_history`
--
ALTER TABLE `note_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shared_notes`
--
ALTER TABLE `shared_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_user_id_notes` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `note_history`
--
ALTER TABLE `note_history`
  ADD CONSTRAINT `note_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `note_tags`
--
ALTER TABLE `note_tags`
  ADD CONSTRAINT `note_tags_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `note_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
