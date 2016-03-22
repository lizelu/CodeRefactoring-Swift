//===Extract Subclass (提炼子类)=============
//现象：类中的某个方法只有某些实例才可以用到
//解决方案：提炼出一个子类，将该方法放到子类中

class CustomerBookOld {
    
    func otherSameMethod() {
    }
    
    func customeCharge() -> Double {
        return 10
    }
    
    func vipCharge() -> Double {            //只有VIP用户在才会调用该方法
        return self.customeCharge() * 0.7
    }
}


//==========重构===============
class CustomerBook {
    
    func otherSameMethod() {
    }
    
    func customeCharge() -> Double {
        return 10
    }
}


class VIPCustomerBook: CustomerBook {
    func vipCharge() -> Double {            //只有VIP用户在才会调用该方法
        return self.customeCharge() * 0.7
    }
}
