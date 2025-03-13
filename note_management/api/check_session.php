<?php
session_start();

// 🔥 Thêm header để bật CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Trả về JSON
header('Content-Type: application/json');

if (isset($_SESSION['user_id'])) {
    echo json_encode(['logged_in' => true, 'user_id' => $_SESSION['user_id']]);
} else {
    echo json_encode(['logged_in' => false]);
}
?>
