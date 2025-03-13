<?php
require 'config.php'; // Kết nối cơ sở dữ liệu
session_start();

// 🔥 Thêm header để bật CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Trả về JSON
header('Content-Type: application/json');

// Kiểm tra phiên đăng nhập
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['message' => 'Chưa đăng nhập.']);
    exit;
}

// Lấy user_id từ session
$user_id = $_SESSION['user_id'];

// Kiểm tra phương thức yêu cầu
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Truy vấn để lấy đường dẫn ảnh hiện tại
    $stmt = $pdo->prepare("SELECT image FROM users WHERE id = ?");
    $stmt->execute([$user_id]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && $user['image']) {
        // Xóa tệp ảnh
        if (unlink($user['image'])) {
            $stmt = $pdo->prepare("UPDATE users SET image = NULL WHERE id = ?");
            if ($stmt->execute([$user_id])) {
                echo json_encode(['message' => 'Ảnh đã được xóa.']);
            } else {
                echo json_encode(['message' => 'Không thể cập nhật thông tin người dùng.']);
            }
        } else {
            echo json_encode(['message' => 'Không thể xóa ảnh.']);
        }
    } else {
        echo json_encode(['message' => 'Không tìm thấy ảnh để xóa.']);
    }
} else {
    echo json_encode(['message' => 'Phương thức không hợp lệ.']);
}
?>