//--------Replace Nested Condition with Guard Clauses(以卫语句取代嵌套的条件)------------
//现象：多个条件进行嵌套，难于理解
//解决方案：使用卫语句表现所有特殊情况
func conditionNest() {
    let keys = [1, 2, 3, 4]
    let numberDictionary = [1: "number1", 2: "number2"]
    let nameDictionary = ["number1": "zelu"]
    let ageDictionary = ["zelu": 18]
    
    for key in keys {
        if let number = numberDictionary[key] {
            if let name = nameDictionary[number] {
                if let age = ageDictionary[name] {
                    print(age)
                }
            }
        }
    }
}

//使用将条件翻转
func conditionNest1() {
    let keys = [1, 2, 3, 4]
    let numberDictionary = [1: "number1", 2: "number2"]
    let nameDictionary = ["number1": "zelu"]
    let ageDictionary = ["zelu": 18]
    
    for key in keys {
        let number = numberDictionary[key]
        if number == nil {
            continue
        }
        
        let name = nameDictionary[number!]
        if name == nil {
            continue
        }
        
        let age = ageDictionary[name!]
        if age == nil {
            continue
        }
        print(age!)
    }
}

//使用guard语句
func conditionNest2() {
    let keys = [1, 2, 3, 4]
    let numberDictionary = [1: "number1", 2: "number2"]
    let nameDictionary = ["number1": "zelu"]
    let ageDictionary = ["zelu": 18]
    
    for key in keys {
        guard let number = numberDictionary[key] else {
            continue
        }
        
        guard let name = nameDictionary[number] else {
            continue
        }
        
        guard let age = ageDictionary[name] else {
            continue
        }
        
        print(age)
    }
}



//conditionNest()
//conditionNest1()
//conditionNest2()
