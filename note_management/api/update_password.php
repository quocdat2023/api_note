<?php
require 'config.php'; // Kết nối cơ sở dữ liệu
session_start();

// 🔥 Bật CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');

// Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['message' => 'Chưa đăng nhập.']);
    exit;
}

// Lấy user_id từ session
$user_id = $_SESSION['user_id'];

// Chỉ chấp nhận phương thức PUT
if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
    http_response_code(405);
    echo json_encode(['message' => 'Phương thức không hợp lệ.']);
    exit;
}

// Lấy dữ liệu JSON từ request
$data = json_decode(file_get_contents("php://input"), true);

// Kiểm tra dữ liệu đầu vào
if (!isset($data['current_password'], $data['new_password'], $data['confirm_password'])) {
    http_response_code(400);
    echo json_encode(['message' => 'Thiếu thông tin yêu cầu.']);
    exit;
}

$current_password = $data['current_password'];
$new_password = $data['new_password'];
$confirm_password = $data['confirm_password'];

// Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp không
if ($new_password !== $confirm_password) {
    http_response_code(400);
    echo json_encode(['message' => 'Mật khẩu mới và xác nhận mật khẩu không khớp.']);
    exit;
}

try {
    // Lấy mật khẩu cũ từ database
    $stmt = $pdo->prepare("SELECT password FROM users WHERE id = ?");
    $stmt->execute([$user_id]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user || !password_verify($current_password, $user['password'])) {
        http_response_code(400);
        echo json_encode(['message' => 'Mật khẩu hiện tại không đúng.']);
        exit;
    }

    // Băm mật khẩu mới
    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

    // Cập nhật mật khẩu mới vào database
    $stmt = $pdo->prepare("UPDATE users SET password = ? WHERE id = ?");
    if ($stmt->execute([$hashed_password, $user_id])) {
        echo json_encode(['message' => 'Mật khẩu đã được thay đổi thành công.']);
    } else {
        http_response_code(500);
        echo json_encode(['message' => 'Cập nhật mật khẩu thất bại.']);
    }
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['message' => 'Lỗi khi cập nhật dữ liệu: ' . htmlspecialchars($e->getMessage())]);
}
?>
