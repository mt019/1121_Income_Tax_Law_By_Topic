# Ops Folder

This folder groups the operational assets that keep the book reproducible without scattering helper scripts in the project root.

- `scripts/` — shell與R腳本，用來建置或部署專案。腳本會先定位到專案根目錄，所以可在任何路徑呼叫。
- `notebooks/` — 需要時才用的 Jupyter 筆記本，協助批次清理或重構資料；並非日常建置流程的一部分。

若未來新增工程工具，請優先放在 `ops/` 底下維持整潔。
