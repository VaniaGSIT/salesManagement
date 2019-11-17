# Creating users
User.create name: 'Joseph', status: :active, kind: :salesman, email: 'salesman@test.com', password: 123456
User.create name: 'Manuel', status: :active, kind: :salesman, email: 'salesman2@test.com', password: 123456
User.create name: 'Marcos', status: :active, kind: :manager, email: 'manager@test.com', password: 123456
User.create name: 'Vania', status: :active, kind: :manager, email: 'vaniateacher@hotmai.com', password: 123456

# Creating some products for sale
Product.create name: 'Smartphone', description:'A new Smartphone...', status: :active, price: 10
Product.create name: 'Tablet', description:'A new tablet ...', status: :active, price: 20
Product.create name: 'Laptop', description:'A new Laptop ...', status: :active, price: 20

# Discount Templates
Discount.create name: 'Bank Holiday discount', description: 'Apply this discount when Bank Holidays are on.', value: '10', kind: :percent, status: :active
Discount.create name: 'Easter Discount', description: 'Apply this discount when Easter season is on', value: '10', kind: :money, status: :active
Discount.create name: 'Christmas Discount', description: 'Apply this discount when Christmas season is on', value: '10', kind: :money, status: :active

# Creating a client
Client.create name: 'Paul', company_name: 'Google', document: '1234', email: 'paulo@google.com', user: User.first
Client.create name: 'Julia', company_name: 'Pwc', document: 'abcd', email: 'julia@google.com', user: User.first
Client.create name: 'Marcia', company_name: 'Facebook', document: 'abcd', email: 'marcia@google.com', user: User.first