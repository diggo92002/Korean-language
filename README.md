# 韓文闖關學習系統

靜態網站，將本目錄放在 GitHub Pages 等靜態主機即可使用。入口為 `index.html`，不需要建置。

第四階段可手動更新韓文例句，並每 20 分鐘自動嘗試從 [Tatoeba](https://tatoeba.org/) 載入韓中對照句。連線失敗時會顯示內建範例。外部例句由 Tatoeba 社群提供，請參照卡片中的原句連結核對內容。

學習進度與錯題儲存在目前瀏覽器的 `localStorage`，換裝置或清除瀏覽資料後不會同步。字型、圖示與 Tailwind 樣式使用 CDN，首次載入需要網路。

PNG 圖示已包含在版本庫；如需重新產生，請在 Windows PowerShell 執行 `./generate-icons.ps1`。
