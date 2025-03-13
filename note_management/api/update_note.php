<?php
require 'config.php';
session_start();


// 🔥 Thêm header để bật CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Trả về JSON
header('Content-Type: application/json');

// Debug: Ghi log dữ liệu nhận được
error_log('📥 Dữ liệu thô nhận được: ' . file_get_contents("php://input"));

// Nhận dữ liệu từ JSON body hoặc POST
$data = json_decode(file_get_contents("php://input"), true) ?? $_POST;

// Ghi log dữ liệu đã xử lý
error_log('📥 Dữ liệu sau xử lý: ' . json_encode($data));

// Kiểm tra xem người dùng đã đăng nhập hay chưa
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Chưa đăng nhập.']);
    exit;
}

$user_id = $_SESSION['user_id']; // Lấy user_id từ session

// Lấy dữ liệu từ request
$note_id = $data['note_id'] ?? null;

// Kiểm tra nếu note_id không hợp lệ
if (empty($note_id)) {
    echo json_encode(['success' => false, 'message' => 'Vui lòng cung cấp note_id hợp lệ.']);
    exit;
}

// Khởi tạo mảng để cập nhật các trường
$fields = [];
$params = [];

// Các trường có thể cập nhật
$updateFields = [
    'title', 'content', 'is_pinned', 'category', 'tags', 
    'password', 'image', 'font_size', 'note_color'
];

foreach ($updateFields as $field) {
    if (!empty($data[$field])) {
        $fields[] = "$field = ?";
        $params[] = $data[$field];
    }
}

// Nếu không có gì để cập nhật
if (empty($fields)) {
    echo json_encode(['success' => false, 'message' => 'Không có dữ liệu cập nhật.']);
    exit;
}

// Cập nhật thời gian sửa đổi
$fields[] = "modified_at = ?";
$params[] = date("Y-m-d H:i:s");

// Điều kiện WHERE
$params[] = $note_id;
$params[] = $user_id;

// Tạo truy vấn SQL
$sql = "UPDATE notes SET " . implode(", ", $fields) . " WHERE id = ? AND user_id = ?";

// Ghi log truy vấn để debug
error_log("🛠 SQL Query: $sql");
error_log("🔢 Parameters: " . json_encode($params));

try {
    $stmt = $pdo->prepare($sql);
    if ($stmt->execute($params)) {
        echo json_encode(['success' => true, 'message' => 'Ghi chú đã được cập nhật thành công.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Cập nhật ghi chú không thành công.']);
    }
} catch (PDOException $e) {
    error_log("❌ Lỗi SQL: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Lỗi khi cập nhật dữ liệu: ' . $e->getMessage()]);
}
?>
