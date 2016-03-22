//===Extract Superclass (提炼超类)=============
//现象：某些类中含有相同的方法
//解决方案：将相同的方法提取到超类中
class CustomCustomerBook01 {

    func otherMethod1() {
    }

    func customeCharge() -> Double {
        return 10
    }
}


class VIPCustomerBook01 {

    func customeCharge() -> Double {
        return 10
    }

    func vipCharge() -> Double {            //只有VIP用户在才会调用该方法
        return self.customeCharge() * 0.7
    }
}



//=============重构
class SuperCustomer {
    func customeCharge() -> Double {
        return 10
    }
}

class CustomCustomerBook: SuperCustomer {
    func otherMethod1() {
    }
}


class VIPCustomerBook: SuperCustomer {
    func vipCharge() -> Double {            //只有VIP用户在才会调用该方法
        return self.customeCharge() * 0.7
    }
}



//===Collapse Hierarchy (折叠继承关系)=============
//现象：父类和子类差别不大
//解决方案：将子类与父类进行合并
