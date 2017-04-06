# 作業 006

1. 在作業 003 中曾經請大家解釋 MVC 的運作原理，現在請再次用你自己的話，說明 Rails 裡的 MVC 大概是怎麼運作的? (若使用英文作答可另外加分)

   * 當使用者連上網站的時候，Rails 根據 config/routes.rb 的內容，比對網址及參數，依照分析結果，去找該負責處理的 Controller ，以及其中負責的哪個 Action 做動作。

   * Controller 是控制流程用的，Controller/Action 決定做甚麼事，需要的資料就向 Model 要資料，由 model 定義所需資料的資料表，取得資料後會傳給 Controller。

   * Controller 向 View 要頁面或表單的畫面，將資料依所設計的樣子顯示出來。

## 注意事項：

1. 請新增檔案 `homework006.md` 到個人資料夾中，並發 PR 至 `homework/006` 分支。
2. 請詳閱首頁的作業繳交注意事項。

## 繳交期限：2017/4/6 23:59 前
