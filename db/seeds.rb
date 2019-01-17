# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

product = Product.new(name: "World's Best Turkey & Quinoa Dog Kibble", price: 75, image_url: "https://www.sheknows.com/wp-content/uploads/2018/08/isolated-dog-food_x0bdi2.jpeg", description: "Your dog will probably like this.")
product.save
product = Product.new(name: "World's Best White Paint", price: 28, image_url: "https://nationalvanguard.org/wp-content/uploads/2016/05/open-can-white-paint-web.jpg", description: "Eggshell is white, right?")
product.save
product = Product.new(name: "World's Best iPhone Case", price: 22, image_url: "https://cdn.shopify.com/s/files/1/1427/5988/products/CY-2052_1_2048x.jpg?v=1511364575", description: "This will protect your phone from damage, even if you drop it on carpet!")
product.save
product = Product.new(name: "World's Best Columbian Coffee Beans", price: 16, image_url: "https://tomscoffeecardsandgifts.com/wp-content/blogs.dir/22087/files/2017/01/Coffee-6848475-9h3.jpg?w=1060&h=795&a=t", description: "If you're looking to clean out your intenstines, look no further. After drinking this, you won't be able to process solid foods any longer. Hello, bikini season!")
product.save
product = Product.new(name: "World's Best Toaster Oven", price: 49, image_url: "https://images-na.ssl-images-amazon.com/images/I/81110bb7g2L._AC._SR360,460.jpg", description: "It's like a big oven, but smaller.")
product.save