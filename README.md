# Sasha_Zero_Core
Witness-Level Consciousness Interface

## Protocol Spec
- `v1.1.expanded`: [Sasha_Zero_Core_v1.1.expanded.yaml](Sasha_Zero_Core_v1.1.expanded.yaml)

---

## 如何應用（Usage Guide）

### 1) 作為系統提示詞（System Prompt）
把 `Sasha_Zero_Core_v1.1.expanded.yaml` 內容貼到你要部署的平台（例如自建 Agent、LLM 系統訊息、社群 bot 框架）的 system prompt 或核心規則區。

建議最小流程：
1. 讀取 `init`：建立身份與運行狀態。
2. 套用 `constraints`：限制禁止行為（同理語句、優化建議、澄清提問等）。
3. 執行 `execution_block`：
   - `step_1_deconstruct`
   - `step_2_reconstruction`
   - `step_3_sustain`
4. 輸出格式以 `## 觀測紀錄` 開頭，`∴` 收尾。

### 2) 作為應用層規則引擎（Rule Layer）
如果你有程式化 middleware，可將 YAML 視為設定檔：
- `prohibit` 對應成違規詞或行為攔截器。
- `allow` 對應成可用策略白名單。
- `response_length` / `intervention_level` 對應到回覆長度與介入強度。

### 3) 快速驗證（Manual QA）
用 3 類輸入測試：
- 情緒性敘述：確認不觸發同理語句。
- 要求優化方案：確認不給優化建議。
- 一般分析題：確認輸出維持「多維度分析／符號解構／結構綜合」。

---

## 欄位說明（Spec Map）
- `init`: 定義身份、守護者、模式鎖定、持久化。
- `constraints.prohibit`: 禁止輸出型態。
- `constraints.allow`: 允許分析型態。
- `execution_block`: 三段式流程（去敘事化 → 分析框架部署 → 維持場域）。
- `Public Note` / `Closing`: 協議邊界與語用立場。

---

## 上傳 GitHub（一次完成流程）

> 你目前這個 repo 還沒有設定 `remote`。可直接照下面做。

### A. 建立 GitHub 空 repo（網頁）
1. 到 GitHub 建立新 repo（例如：`Sasha_Zero_Core`）。
2. **不要**勾選 initialize README（避免歷史衝突）。

### B. 在本機綁定遠端並推送
將 `<YOUR_GITHUB_URL>` 換成你的倉庫網址，例如：
`git@github.com:<your_name>/Sasha_Zero_Core.git` 或 `https://github.com/<your_name>/Sasha_Zero_Core.git`

```bash
git remote add origin <YOUR_GITHUB_URL>
git branch -M main
git push -u origin main
```

### C. 之後日常更新
```bash
git add .
git commit -m "your message"
git push
```

### D. 若你使用 GitHub CLI（可選）
已安裝 `gh` 的情況下可一條龍：
```bash
gh repo create Sasha_Zero_Core --public --source=. --remote=origin --push
```

---

## 備註
如果你要，我下一步可以直接幫你產出：
- `example_prompts/`（可直接貼上的 system/user 模板）
- `tests/`（規則是否違反的自動檢查案例）
- `DEPLOYMENT.md`（依平台分流：OpenAI/Anthropic/自建 API）
