seed AdminUser, { email: 'info@ungleich.ch' },
  password: 'thahph6AuhieLu6j',
  password_confirmation: 'thahph6AuhieLu6j'

seed Campaign, { title: "Data Center Light" },
   claim: "The best hosting in the world",
   description: """You're going to need it, because:
  - It's the best
  - It's the absolute best!
  - Resistance is futile""",
   start_date: 10.days.from_now,
   end_date: 40.days.from_now,
   youtube_url: "https://www.youtube.com/watch?v=ZUgjm-XqKuc",
   goal: 1000

  seed Goody, { title: "Stickers" },
     description: "We also have the best stickers",
     price: 10,
     quantity: 100,
     image: "https://digitalglarus.ch/static/digitalglarus/img/services/network.svg",
     campaign: Campaign.first

  seed Goody, { title: "Gasoline" },
     description: "To remove other peoples stickers so that ours have _more_ space!",
     price: 55,
     quantity: 200,
     image: "https://digitalglarus.ch/static/digitalglarus/img/services/enjoy.svg",
     campaign: Campaign.first

  seed Goody, { title: "Something expensive" },
    description: "Boosting morale!",
    price: 555,
    quantity: 200,
    image: "https://digitalglarus.ch/static/digitalglarus/img/services/beinspired.svg",
    campaign: Campaign.first

  seed Order, { goody: Goody.first },
    agreement: true,
    quantity: 1,
    amount: 10,
    paid: true,
    payment_type: "stripe"
