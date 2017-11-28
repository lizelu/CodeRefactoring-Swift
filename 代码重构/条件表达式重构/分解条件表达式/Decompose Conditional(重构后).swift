class Commission {
    
    func fetchCommission(money: Double, day: Int) -> Double {
        if isALotOfMoney(money: money, day: day)  {
            return aLotOfMoney(money: money, day: day)
        } else {
            return littleMoney(money: money)
        }
    }
    
    private func isALotOfMoney(money: Double, day: Int) -> Bool {
        return money > 10_000  && day > 30
    }
    
    private func aLotOfMoney(money: Double, day: Int) -> Double {
        return money * Double(day) / 365 * 0.2
    }
    
    private func littleMoney(money: Double) -> Double {
        return money * 30.0  / 365 * 0.1
    }
}
