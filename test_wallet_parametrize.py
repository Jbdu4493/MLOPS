from wallet import Wallet, InsufficientAmount
import pytest

@pytest.mark.parametrize("earned,spent,expected",
                         [(30, 10, 20),
                          (20, 2, 18),
                          (0,0,0),
                          (10,0,10),
                          (10,10,0)])
def test_transactions(earned, spent, expected):
    my_wallet = Wallet()
    my_wallet.add_cash(earned)
    my_wallet.spend_cash(spent)
    assert my_wallet.balance == expected

@pytest.mark.parametrize("amount, spend",
                         [(2,4),
                          (0,3)])
def test_raise_exception(amount,spend):
        w = Wallet(amount)
        with pytest.raises(InsufficientAmount):
                w.spend_cash(spend)
                