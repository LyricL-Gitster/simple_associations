puts "Clearing Tables"
Order.delete_all
Customer.delete_all
Item.delete_all

print "Creating Customers"
customer1 = Customer.create(name:"Big Company", phone:"5554443333", contact:"Betty Sue")
print "."
customer2 = Customer.create(name:"Small Corp.", phone:"123-456-7890", contact:"Jake Smith")
print "."
customer3 = Customer.create(name:"Goldilocks LLC", phone:"987-654-3210", contact:"Some Bears")
puts "."

print "Creating Items"
item1 = Item.create(name:"House Slippers", cost:0.99)
print "."
item2 = Item.create(name:"Broken Keyboard", cost:0.99)
print "."
item3 = Item.create(name:"Moccasins", cost:31)
print "."
item4 = Item.create(name:"Brown Leather Jacket", cost:55.77)
print "."
item5 = Item.create(name:"Velour Jumpsuit", cost:10.01)
print "."
item6 = Item.create(name:"Kneeboard", cost:199.99)
print "."
item7 = Item.create(name:"Velcro Pro Wings", cost:0.99)
print "."
item8 = Item.create(name:"Flannel Zebra Pajamas", cost:0.99)
puts "."

print "Creating Orders"
print "."
Order.create(customer_id:customer1.id, item_id:item1.id, quantity:10)
print "."
Order.create(customer_id:customer2.id, item_id:item2.id, quantity:2)
print "."
Order.create(customer_id:customer3.id, item_id:item3.id, quantity:1)
print "."
Order.create(customer_id:customer1.id, item_id:item4.id, quantity:99)
print "."
Order.create(customer_id:customer2.id, item_id:item5.id, quantity:4)
print "."
Order.create(customer_id:customer3.id, item_id:item6.id, quantity:64)
print "."
Order.create(customer_id:customer1.id, item_id:item7.id, quantity:8)
print "."
Order.create(customer_id:customer2.id, item_id:item8.id, quantity:73)
print "."
Order.create(customer_id:customer3.id, item_id:item8.id, quantity:37)
print "."
Order.create(customer_id:customer1.id, item_id:item7.id, quantity:12)
print "."
Order.create(customer_id:customer2.id, item_id:item6.id, quantity:21)
print "."
Order.create(customer_id:customer3.id, item_id:item4.id, quantity:11)
print "."
Order.create(customer_id:customer1.id, item_id:item5.id, quantity:100)
puts "."
puts "Finished!"