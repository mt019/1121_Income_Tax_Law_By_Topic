# 1121 所得稅法一｜柯格鐘教授課堂筆記與所得稅法重點整理

> 柯格鐘教授 112-1《所得稅法一》完整講義、條文解析、案例評析與實務補充，整合成適合考試衝刺與實務查詢的線上知識庫。

本專案以 R bookdown 製作柯格鐘教授的所得稅法一課堂筆記，涵蓋所得基本觀念、各類所得課稅規範、最新修法動態與裁判選粹。透過 GitBook、PDF 與 EPUB 三種格式，協助台大法律學院修課學生、稅法學習者與實務工作者快速掌握核心觀念與重要關鍵字。

## 快速導覽

- [線上閱讀資源](#線上閱讀資源)
- [內容亮點](#內容亮點)
- [適合對象](#適合對象)
- [教材章節概覽](#教材章節概覽)
- [建置與部署流程](#建置與部署流程)
- [本機預覽與輸出](#本機預覽與輸出)
- [SEO 強化備忘錄](#seo-強化備忘錄)
- [授權與引用](#授權與引用)

## 線上閱讀資源

- GitBook 網站：<https://mt019.github.io/1121_Income_Tax_Law_By_Topic/>
- PDF 版本：GitHub Actions 產出 `1121_Income_Tax_Law_By_Topic.pdf`
- EPUB 版本：GitHub Actions 產出 `1121_Income_Tax_Law_By_Topic.epub`
- 原始資料：`index.Rmd` 與章節 `.Rmd`／`.md` 檔案

## 內容亮點

- **稅法基礎框架**：明確整理所得稅法總則、稅捐主體與課稅要件，協助建立完整結構。
- **各類所得解析**：逐類型拆解營利所得、薪資所得、財產交易等課稅重點，搭配條文與實務見解。
- **案例與實務演練**：蒐集柯格鐘教授課堂案例、裁判與裁罰實務，強化實務應用。
- **修法與趨勢追蹤**：補充近期所得稅法修正與政策走向，掌握最新資訊。
- **多格式輸出**：提供 GitBook 線上閱讀與 PDF／EPUB 離線複習，利於考試衝刺與平時複查。

## 適合對象

- 修習台大法律學院《所得稅法一》的同學
- 需要快速整合所得稅法重點的實務工作者或考試族群
- 想了解柯格鐘教授授課脈絡與案例的稅法愛好者

## 教材章節概覽

| 單元主題 | 關鍵重點 | 關聯關鍵字 |
| --- | --- | --- |
| 課程導覽與總論 | 課程定位、稅法體系、課稅原則 | 所得稅法總則、租稅法律主義 |
| 課稅主體與課稅標的 | 居住者認定、來源所得、免稅規定 | 居住者、來源所得、免稅額 |
| 各類所得課稅 | 營利所得、薪資所得、財產交易所得等 | 營利所得、薪資所得、財產交易 |
| 稅率、扣除與優惠 | 累進稅率、扣除額、投資抵減 | 所得稅率、扣除額、租稅優惠 |
| 申報程序與權利救濟 | 結算申報、稽徵程序、救濟管道 | 所得稅申報、稅捐救濟 |
| 裁判與案例研討 | 行政法院判決、實務評析 | 所得稅實務、課稅爭議 |

> 欲查看完整章節與索引，請於 GitBook 網站使用內建搜尋或目錄功能。

## 建置與部署流程

- 原始教材維持在 `.Rmd`、`.md` 檔案，建置結果輸出至 `docs/`，再由 GitHub Actions 部署到 GitHub Pages。
- `Build and Deploy bookdown` workflow 會：
  1. 復原 TinyTeX 與 R 套件快取，並安裝必要的依賴與 Noto CJK 字型；
  2. 編譯 GitBook／PDF／EPUB 三種格式；
  3. 觸發 `ops/scripts/generate_seo_files.R` 產生 `robots.txt` 與 `sitemap.xml`；
  4. 將整個 `docs/` 發布至 GitHub Pages。
- 首次 fork 或複製專案時，請至 **Settings → Pages** 將 *Build source* 改為 **GitHub Actions**，避免舊的 Jekyll 流程衝突。
- `index.Rmd` 檔名請維持大小寫不變，Linux runner 會區分大小寫，錯誤的檔名會導致建置失敗。

## 本機預覽與輸出

在本機端可以直接使用下列指令預覽 GitBook：

```r
bookdown::render_book("index.Rmd")
```

- HTML 輸出會放在 `docs/`，`.gitignore` 已排除它們，可安心測試。
- 需要 PDF 或 EPUB 時，可參考 `ops/scripts/build.sh` 內的指令或等待 GitHub Actions 產出成品。
- 本機輸出 PDF 建議先安裝完整 Noto CJK 或 Source Han 字型，避免中文顯示成方框。

## SEO 強化備忘錄

- `assets/html/seo_head.html` 注入頁面描述、Open Graph、Twitter Card、結構化資料（Course + WebSite + WebPage）與 Google Search Console 驗證。
- `ops/scripts/generate_seo_files.R` 依據 `docs/` HTML 生成 `robots.txt` 與 `sitemap.xml`，並自動設定 `changefreq`、`lastmod` 等欄位。
- 主要鎖定的關鍵詞為「柯格鐘」、「所得稅法一」、「所得稅法」、「所得稅案例」。若需調整，請同步更新 `index.Rmd` 與 `assets/html/seo_head.html`。
- 更換網站網址時，記得更新 `assets/html/seo_head.html` 的 `base` 變數與 `ops/scripts/generate_seo_files.R` 的 `base_url`，確保 canonical、sitemap 與 Open Graph 指向正確位置。

## 工程維運檔案整理

- `ops/scripts/`：集中建置與部署腳本，例如 `build.sh`、`publish_variants.R`，可直接從專案根目錄執行。`build.sh` 預設輸出三種格式，也可透過 `BUILD_FULL=false` 僅產出 GitBook。
- `ops/notebooks/`：存放調整網站結構或資料清理時使用的 Jupyter 筆記本（`delete_index.ipynb` 等），需要時再打開使用。
- `assets/`：統一收納靜態資產，包含 `bib/`（引用書目）、`css/`（GitBook/EPUB 樣式）、`html/`（head/after_body 片段）、`latex/`（PDF 模板與巨集）。
- `translations/`：Pandoc 會從這裡載入中文介面字串（`zh.yaml`），請保留在根目錄下。
- 仍需放在根目錄的設定檔（如 `_bookdown.yml`、`_output.yml`、`index.Rmd`）維持原位，確保 bookdown 與 GitHub Actions 能正常尋找。

## 授權與引用

- 授權條款：詳見 [`LICENSE`](LICENSE)。
- 引用時請標註「柯格鐘教授《1121 所得稅法一》課堂筆記」並附上 GitBook 網址。
- 若發現錯誤或想補充教材，歡迎提交 Issue 或 Pull Request。
