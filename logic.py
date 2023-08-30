
import os 
import math

os.system('clear')


class DefaultProposal:
    def __init__(self):
        self.years_financed = 10
        self.dp = 10
        self.annual_rate = 17.99

        self.purchase_price = None
        self.downpayment = None
        self.closing_cost = None
        self.exchange_dues = 109;
        self.total_dp = None

        self.amount_financed = None
        self.monthly = None

        self.years = 'Whole'
        self.mortgage_protection = 'Single'


  
    def calculate(self, purchase_price_input):
        self.purchase_price = purchase_price_input
        self.downpayment = self.purchase_price * self.dp / 100
        self.closing_cost = (self.purchase_price * 0.03) + 51
        self.total_dp = self.downpayment + self.closing_cost + self.exchange_dues
        self.amount_financed = self.purchase_price - self.total_dp
        self.monthly = self.amount_financed * self.annual_rate / 100 / 12

        print(f'Purchase Price {math.ceil(self.purchase_price)}')
        print(f'Downpayment {math.ceil(self.downpayment)}')
        print(f'Closing Cost {math.ceil(self.closing_cost)}')
        print(f'Exchange Dues {math.ceil(self.exchange_dues)}')
        print(f'Total DP {math.ceil(self.total_dp)}')
        print(f'Monthly {math.ceil(self.monthly)}')
        print(f'Amount Financed {math.ceil(self.amount_financed)}')


proposal = DefaultProposal()

print()
proposal.calculate(12345)
print()



