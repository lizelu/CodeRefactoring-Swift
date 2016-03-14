//==========Replace Magic Number with Synbolic Constant(以字面常量取代魔法数)============
//现象：你有一个字面数值，带有特别含义
//解决方案：将该字面值存入到一个使用其功能命名的常量中，并将该字面量替换成该常量

func test(height: Double) -> Double {
    return 3.141592654 * height
}

//替换
let PI = 3.141592654
func test1(height: Double) -> Double {
    return PI * height
}
