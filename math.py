

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

        print(f'Purchase Price {self.purchase_price}')
        print(f'Downpayment {self.downpayment}')
        print(f'Closing Cost {self.closing_cost}')
        print(f'Total DP {self.total_dp}')
        print(f'Monthly {self.monthly}')
        print(f'Amount Financed {self.amount_financed}')


proposal = DefaultProposal()
proposal.calculate(12345)



