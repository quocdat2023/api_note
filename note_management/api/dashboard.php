<?php 
require 'config.php'; // Kết nối cơ sở dữ liệu
session_start();


// 🔥 Thêm header để bật CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Trả về JSON
header('Content-Type: application/json');


if (isset($_SESSION['user_id'])) {
    $stmt = $pdo->prepare("SELECT is_active FROM users WHERE id = ?");
    $stmt->execute([$_SESSION['user_id']]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && !$user['is_active']) {
        echo 'Tài khoản chưa được xác minh. Vui lòng kiểm tra email để hoàn tất quá trình kích hoạt.';
    }else{
        echo 'Tài khoản đã được xác minh';
    }
}