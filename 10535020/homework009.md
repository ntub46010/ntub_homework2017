1.單數的resource只能做檢視、更新、刪除自己的 profile，而resources是可以檢視、更新、刪除每個使用者，而且在單數的路徑除了沒有帶有 id 之外，也沒有 index。
user 和 users差別在從原本users_controller變成user_controller，路徑會隨著有沒有加"s"改變。
2.
member和collection不同處在於路徑呈現會多出id，id 會傳到 Controller 裡變成 params 這個變數的一部份，可以更好辨識。
在用collection大量資料的蒐集，member在蒐集範圍較小的蒐集，也因為member路徑會多出id，所以在小範圍更好蒐集
