class InsufficientAmount(Exception):
    pass
class Wallet():
    def __init__(self,amound = 0):
        self.balance = amound
    def spend(self,amound):
        if amound > self.balance:
            raise InsufficientAmount
        self.balance -= amound
    def add(self,amound):
        self.balance += amound