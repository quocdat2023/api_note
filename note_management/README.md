# Tính Năng Tự Động Lưu (Auto Save) trong Ứng Dụng Ghi Chú

Tính năng auto save (tự động lưu) là một phương pháp giúp người dùng lưu lại nội dung mà họ đang làm việc mà không cần phải nhấn nút "Lưu". Dưới đây là mô tả chi tiết về cách hoạt động của tính năng này trong một ứng dụng ghi chú:

## 1. Nguyên Tắc Hoạt Động

- **Theo Dõi Sự Thay Đổi:** Ứng dụng sẽ theo dõi các trường nhập liệu (như tiêu đề và nội dung ghi chú) để xác định khi nào người dùng thực hiện thay đổi. Điều này thường được thực hiện thông qua các sự kiện như `input` hoặc `change` trong JavaScript.

- **Gửi Dữ Liệu Tới Server:** Mỗi khi có sự thay đổi, ứng dụng sẽ gửi một yêu cầu đến API để lưu lại nội dung ghi chú. Yêu cầu này có thể là một yêu cầu `POST` hoặc `PUT`, tùy thuộc vào việc ghi chú đã tồn tại hay chưa.

- **Lưu Dữ Liệu:** Trên server, API sẽ kiểm tra xem ghi chú đã tồn tại hay chưa:
  - Nếu ghi chú đã tồn tại (có ID), API sẽ cập nhật nội dung ghi chú đó.
  - Nếu ghi chú chưa tồn tại (không có ID), API sẽ tạo mới một ghi chú với nội dung đã được nhập.

## 2. Các Bước Cụ Thể

1. **Người Dùng Nhập Dữ Liệu:** Người dùng bắt đầu nhập tiêu đề và nội dung vào các trường nhập liệu.
2. **Sự Kiện Nhập Liệu:** Mỗi khi người dùng nhập hoặc thay đổi nội dung, một sự kiện `input` được kích hoạt.
3. **Gửi Yêu Cầu Tới Server:**
   - Dữ liệu (bao gồm ID ghi chú, tiêu đề, và nội dung) được gửi tới API tự động lưu.
   - Yêu cầu này thường được gửi dưới dạng JSON.
4. **Xử Lý Tại Server:**
   - API nhận dữ liệu và kiểm tra xem ghi chú có tồn tại hay không.
   - Nếu có, API sẽ cập nhật ghi chú; nếu không, API sẽ tạo mới ghi chú.
5. **Phản Hồi từ Server:** Sau khi lưu thành công, server sẽ gửi phản hồi về cho ứng dụng, có thể bao gồm thông báo thành công.
6. **Thông Báo cho Người Dùng:** Ứng dụng có thể hiển thị thông báo cho người dùng rằng nội dung đã được lưu thành công.

## Đoạn Mã JavaScript Tự Động Lưu

```javascript
const noteId = 1; // ID ghi chú (nếu có)

// Hàm tự động lưu
function autoSaveNote() {
    const title = document.getElementById('noteTitle').value;
    const content = document.getElementById('noteContent').value;

    fetch('http://localhost/note_management/api/auto_save_note.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            id: noteId,
            title: title,
            content: content
        }),
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.message); // Thông báo thành công
    })
    .catch(error => {
        console.error('Lỗi:', error);
    });
}

// Lắng nghe sự kiện nhập liệu
document.getElementById('noteTitle').addEventListener('input', autoSaveNote);
document.getElementById('noteContent').addEventListener('input', autoSaveNote);


####### Chọn nhiều ảnh:
<form action="your_script.php" method="POST" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="Tiêu đề" required>
    <textarea name="content" placeholder="Nội dung" required></textarea>
    <input type="file" name="images[]" multiple> <!-- Cho phép chọn nhiều ảnh -->
    <button type="submit">Lưu Ghi Chú</button>
</form>






#######
Seach

<input type="text" id="search" placeholder="Tìm kiếm ghi chú...">
<div id="results"></div>

<script>
let timeout = null;

document.getElementById('search').addEventListener('input', function() {
    clearTimeout(timeout);
    const keyword = this.value;

    // Đặt độ trễ 300ms trước khi thực hiện tìm kiếm
    timeout = setTimeout(() => {
        if (keyword.length > 0) {
            fetch(`api/search_notes.php?keyword=${encodeURIComponent(keyword)}`)
                .then(response => response.json())
                .then(data => {
                    const resultsDiv = document.getElementById('results');
                    resultsDiv.innerHTML = ''; // Xóa kết quả trước đó

                    if (Array.isArray(data) && data.length > 0) {
                        data.forEach(note => {
                            const noteDiv = document.createElement('div');
                            noteDiv.innerHTML = `<strong>${note.title}</strong><p>${note.content}</p>`;
                            resultsDiv.appendChild(noteDiv);
                        });
                    } else {
                        resultsDiv.innerHTML = '<p>Không tìm thấy ghi chú nào.</p>';
                    }
                })
                .catch(error => console.error('Lỗi:', error));
        } else {
            document.getElementById('results').innerHTML = ''; // Xóa kết quả nếu không có từ khóa
        }
    }, 300);
});
</script>







npm init -y
npm install express socket.io axios