func testRemoveControlFlag1() {
    var flag: Bool = true
    for var i: Int = 0; i < 100; i++ {
        if flag {
            if i == 20 {
                flag = false
            } else {
                print("*")
            }
        } 
    }
}

//重构后
func testRemoveControlFlag() {
    for var i: Int = 0; i < 100; i++ {
        if i == 20 {
            break
        }
        print("*")
    }
}
