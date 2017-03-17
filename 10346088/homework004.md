# 作業 004

請設計一個名為 `is_leap_year?` 的方法，可以判斷是不是閏年?

```
def is_leap_year?(num)
  if num % 4 != 0
    false
  elsif num % 100 != 0
    true
  elsif	num % 400 != 0
    false
  else
    true
  end
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
```

請新增檔案 `homework004.md` 到個人資料夾中，並發 PR 至 `homework/004` 分支。

## 繳交期限：2017/3/23 23:59 前
