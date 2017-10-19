# -*- coding: utf-8 -*-
seed AdminUser, { email: 'info@ungleich.ch' },
  password: 'thahph6AuhieLu6j',
  password_confirmation: 'thahph6AuhieLu6j'

seed Campaign, { title: "Ungleich Glarus AG" },
   claim: "Wir digitalisieren Glarus",
   description: """Wir machen Crowdfunding, damit wir unser erfolgreiches Geschäft weiter ausbauen können.
   Wir bauen digitale Businesses in Glarus auf:

  - Symmetrisches Internet
  - Data Center Light
  - Coworking

  Mit dem Funding für diese Kampagne starten wir einen neuen Coworking-Space in Braunwald.""",
   start_date: 2.days.before,
   end_date: 40.days.from_now,
   youtube_url: "https://www.youtube.com/watch?v=ZUgjm-XqKuc",
   goal: 50000

 seed Goody, { title: "Aufkleber" },
   description: "Digtal Glarus Aufkleber",
   price: 10,
   quantity: 100,
   image: "https://digitalglarus.ch/static/digitalglarus/img/services/network.svg",
   campaign: Campaign.first

 seed Goody, { title: "T-Shirts" },
   description: "Passt super und hält warm",
   price: 55,
   quantity: 200,
   image: "https://digitalglarus.ch/static/digitalglarus/img/services/enjoy.svg",
   campaign: Campaign.first

 seed Goody, { title: "Mitgliedschaft" },
   description: "Erlebe sonniges Arbeiten in Braundwald!",
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
