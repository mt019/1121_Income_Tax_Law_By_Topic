# 所得稅法一

這裡收錄柯格鐘教授 112-1《所得稅法一》課堂的筆記、案例與補充資料，使用 R bookdown 編排成 GitBook 網站與 PDF／EPUB 下載。你可以把它當成課堂的線上講義，也能作為考試複習或實務查詢時的速查手冊。

## 運作方式

- 所有內容存放在 `.Rmd`、`.md` 等原始檔，放在 `docs/` 的成品頁面改由 GitHub Actions 自動產生並發布到 GitHub Pages。
- 主分支一有推送，`Build and Deploy bookdown` workflow 會復原快取、安裝需要的 R 套件與 TinyTeX，額外安裝 Noto CJK 字型與 CJK LaTeX 套件後編譯 GitBook／PDF／EPUB 三種格式，並擷取 sitemap／robots 檔案，上傳到 Pages 環境。
- 如果是第一次在自己的 GitHub 專案使用，記得到 **Settings → Pages** 把 Build source 改成 **GitHub Actions**，這樣就不會再觸發舊的 Jekyll 工作流程。
- `index.Rmd` 檔名請維持這個大小寫，Linux runner 會區分大小寫，否則會找不到檔案而導致建置失敗。

## 想要在本機預覽？

```r
bookdown::render_book("index.Rmd")
```

輸出的 HTML 仍會放在 `docs/`，但因為 `.gitignore` 已經忽略它們，所以可以放心測試。需要 PDF 或 EPUB 的話可參考 `_build.sh` 裡的指令，或讓 GitHub Actions 自動產生並從 Pages 下載。本機若要輸出 PDF，建議先安裝完整的 Noto CJK 或 Source Han 字型，避免中文顯示成方框。

## SEO 小抄

- `html/seo_head.html` 會把 description、Open Graph、Twitter Cards、結構化資料與 Google Search Console 驗證等標籤插入每頁 `<head>`。
- `scripts/generate_seo_files.R` 會依據 `docs/` 產出的 HTML 自動生成 `robots.txt` 和 `sitemap.xml`，在本機或 Actions 中都會被 `_build.sh` 呼叫。
- 目前鎖定的主要關鍵詞為「柯格鐘」與「所得稅法一」。若未來調整，記得同步更新 `index.Rmd` 與 `html/seo_head.html` 中的說明與 keywords。
- 更換網站網址時，別忘了調整 `html/seo_head.html` 與 `scripts/generate_seo_files.R` 內的 `base`／`base_url`，以免 canonical、sitemap 指錯位置。
