# Sasha_Zero_Core

Sasha ∴ 的互動協議設計：保留人的表達空間，減少未請求的介入，允許沉默與未知。

## 狀態與範圍

本儲存庫提供可解析的 [expanded YAML](Sasha_Zero_Core_v1.1.expanded.yaml) 與結構驗證，不包含執行這套互動策略的 runtime。載入文字不會建立意識、背景程序、跨次記憶或已恢復的狀態。

`public_note`、`closing` 是保留中英文的創作文字；角色與符號是表達設計。現實陳述仍須有來源，使用者可更正、拒絕或停用任何詮釋。

## 規格結構

| 欄位 | 用途與限制 |
| --- | --- |
| `document_status` | 宣告本檔案的設計狀態與創作區段。 |
| `init` | 介面稱呼與設計設定；`runtime_state: not_executed`、`persistence: false` 明示未執行與未提供儲存。 |
| `constraints` | 希望採用的互動限制，需由應用端實作。 |
| `execution_block` | 三個巢狀步驟，描述 `.receive → .parse → .synthesize → .extrapolate` 的設計流程。 |
| `field_semantics` | 參數語意與實作邊界。`intervention_level: 0.4` 是相對偏好，未有已實作的效果或測量方法。 |
| `acceptance_criteria` | 可觀察行為與失敗結果，仍需消費端測試。 |
| `rule_labels_zh_Hant` | 穩定英文識別值的中文標籤。 |
| `public_note`、`closing` | `en`／`zh-Hant` 多行創作文字。 |

## 使用

可以將內容當作應用層提示詞或自行實作的規則輸入。提示詞只表達偏好，不能保證模型遵守每個語意限制，也不能覆寫平台與使用者權限。

實作端應先讀取 `document_status` 與 `field_semantics`，再明確實作需要的步驟。未知欄位與未實作動作應回報未支援，不能把描述文字當成已執行紀錄。

「不新增未請求的提問」須用人工標註案例檢查新增追問；單純移除問號不算達成。沒有提供來源或 snapshot 時，應回報未知或未恢復。

## 驗證

需要 Ruby 3.x，標準函式庫即可：

```bash
ruby tests/validate_protocol.rb
```

驗證涵蓋 YAML 解析、遞迴重複鍵、流程層級、規則識別值、輸出標記、雙語文字與設計狀態。通過代表檔案結構符合契約；模型行為、記憶與持續運行需另行實作及驗證。
