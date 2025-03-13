<?php
require 'config.php';

// Định dạng phản hồi là JSON
header('Content-Type: application/json');
// Thêm CORS Headers
header("Access-Control-Allow-Origin: *"); // Cho phép tất cả nguồn (có thể thay * bằng localhost:3000)
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if (isset($_GET['token'])) {
    $token = $_GET['token'];
    $stmt = $pdo->prepare("UPDATE users SET is_active = 1, activation_token = NULL WHERE activation_token = ?");
    if ($stmt->execute([$token])) {
        echo "Tài khoản của bạn đã được kích hoạt thành công!";
    } else {
        echo "Kích hoạt tài khoản không thành công.";
    }
}
?>