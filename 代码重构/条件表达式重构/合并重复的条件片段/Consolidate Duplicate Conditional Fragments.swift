//--------Consolidate Duplicate Conditional Fragments(合并重复的条件片段)------------
//现象：在条件表达式的每个分支上有着相同的片段
//解决方案：这段重复的代码移动到表达式之外

func totalMoney1(price: Double) {
    let total: Double
    if price > 1000 {
        total = price * 0.8
        print(total)
    } else {
        total = price * 0.7
        print(total)
    }
}

//重构后

func totalMoney(price: Double) {
    let total: Double
    
    if price > 1000 {
        total = price * 0.8
    } else {
        total = price * 0.7
    }
    
    print(total)
}
