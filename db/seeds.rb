AdminUser.create! email: 'info@ungleich.ch',
  password: 'thahph6AuhieLu6j',
  password_confirmation: 'thahph6AuhieLu6j'

Campaign.create! title: "Data Center Light",
  claim: "The best hosting in the world",
  description: """You're going to need it, because:

  - It's the best
  - It's the absolute best!
  - Resistance is futile""",
  start_date: 10.days.from_now,
  end_date: 40.days.from_now,
  youtube_url: "https://www.youtube.com/embed/X6rSpJu-tLI"

Goodie.create! title: "Stickers",
  description: "We also have the best stickers",
  price: 10,
  quantity: 100,
  campaign: Campaign.first

Goodie.create! title: "Gasoline",
  description: "To remove other peoples stickers so that ours have _more_ space!",
  price: 55,
  quantity: 200,
  campaign: Campaign.first

Order.create! goodie: Goodie.first,
  quantity: 1,
  amount: 10,
  payment_type: "stripe"
