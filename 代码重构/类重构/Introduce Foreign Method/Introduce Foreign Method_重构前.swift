//===============Introduce Foreign Method(引入外加函数)=============================================
//现象：想要为类增加新的方法，但是又不能修改该类
//解决方案：在Swift中这种问题就很好解决，使用延展很好解决
//案例
class MyTest{
    static func method1() {
        print("method1")
    }
}
MyTest.method1()