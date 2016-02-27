//===============Split Temporary Variable(分解临时变量)===================
//现象：在程序中一个临时变量被多次赋值。
//解决方案：针对每次赋值，创造一个独立、对应的临时变量
func splitTemp() {
    var temp:String = "AAA"
    print(temp)
    
    temp = "BBB"
    print(temp)
}

