# frozen_string_literal: true

Product.delete_all
Product.create!(
  title: 'Web Application Testing Book',
  description:
    %(Short introduction to testing Web Applications.),
  image_url: 'book1.jpg',
  price: 29.99,
  prod_type: 'Books'
)
Product.create!(
  title: 'Sunglasses 2AR',
  description:
    %(Stylish wooden sunglasses.),
  image_url: 'sun2.jpg',
  price: 26.00,
  prod_type: 'Sunglasses'
)
Product.create!(
  title: 'B45593 Sunglasses',
  description:
    %(Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua. Elementum facilisis leo vel fringilla est ullamcorper eget.
    In arcu cursus euismod quis viverra nibh cras pulvinar mattis.Interdum velit euismod in
    pellentesque massa placerat duis ultricies lacus. Aliquam nulla facilisi cras fermentum
    odio eu feugiat pretium nibh.),
  image_url: 'sun7.jpg',
  price: 26.00,
  prod_type: 'Sunglasses'
)
Product.create!(
  title: 'Sunglasses B45593',
  description:
    %(Tempus iaculis urna id volutpat lacus laoreet. Sodales ut eu sem integer.),
  image_url: 'sun8.jpg',
  price: 26.00,
  prod_type: 'Sunglasses'
)
