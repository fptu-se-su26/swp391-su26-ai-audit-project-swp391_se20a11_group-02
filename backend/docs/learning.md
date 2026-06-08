Giờ tôi sẻ xaay dựng phần vào học một course chính là trang http://localhost:5173/dashboard#learning-view

Ở phần này với giao diện hieenj tại thì thông tin tôi muốn hiển thị đó chính là 
+ Tên khóa học
+ Tác giả
+ Phần trăm hoàn thành khóa học
+ Phần navbar curriculum
+ Video
+ Và có phần navbar bên dưới khóa học bao gồm
 - Theory Content
 - Q/A
 - Exercieses
 - Source code
 - Quiz
Và phần này sẻ chia gồm những API như sau
 - API 1: Lấy thông tin khóa học gồm tên, tác giả, phần trăm hoàn thành khóa học, video, theory content
 - API 2: Lấy phần curriculum của khóa học (gồm tên các các chapter, lesson, và trạng thái đã hoàn thành lesson đó hay chưa)
 - API 3: Lấy phần Q/A của lesson
 - API 4: Lấy phần exercises của lesson
 - API 5: Lấy phần source code của lesson
 - API 6: Lấy phần quiz của khóa học
 - API 7: Nút tích để hoàn thành lesson
Thì ở giao diện lúc user click vào 1 khóa học để học thì chỉ gọi 2 API là API 1 và API 2 
để hiển thị thông tin khóa học và phần curriculum của khóa học, còn các phần Q/A, exercises, source code, 
quiz thì sẽ gọi khi user click vào từng phần đó trong navbar bên dưới khóa học.

Hãy đánh giá workflow này, nếu hợp lý thì hãy lên plan để xây dựng API 1 và API 2 cho tôi

Tiếp theo xây dựng cho tôi API Q/A ở lesson trong course đó
API này sẻ trả về danh sách comment trong phần lesson đó gồm
+ avatart
+ tên người comment
+ date
+ nội dung comment
+ và có phần trả lời comment nếu có (cũng gồm avatar, tên người trả lời, date, nội dung trả lời)
+ và có phần nút để user có thể comment vào lesson đó
+ và có phần nút để user có thể trả lời comment đó

Và 1 comment root chỉ có thể có 1 level trả lời, không có trả lời sâu hơn nữa. V
à khi user click vào nút comment hoặc trả lời thì sẻ hiện ra 1 form để user nhập nội dung comment hoặc trả lời,
sau đó khi submit sẻ gọi API để lưu comment hoặc trả lời đó vào database. 
Và sau khi lưu thành công thì sẻ tự động cập nhật lại danh sách comment trên giao diện mà 
không cần phải reload lại trang.

Hãy thiết kế các query một cách tối ưu để lấy được danh sách comment và trả lời của lesson đó, 
và thiết kế API để lưu comment và trả lời đó vào database.

Sẻ gồm 2 API
+ API 1: Lấy danh sách comment 
+ API 2: comment mới hoặc trả lời lại một comment nào đó