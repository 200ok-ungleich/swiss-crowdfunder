# -*- coding: utf-8 -*-
seed AdminUser, { email: 'info@ungleich.ch' },
  password: 'thahph6AuhieLu6j',
  password_confirmation: 'thahph6AuhieLu6j'

seed Campaign, { title: "ungleich glarus AG" },
   claim: "Wir digitalisieren Glarus",
   description: """### Ein neues Datacenter für den Kanton Glarus

   Wir machen Crowdfunding, damit wir unser erfolgreiches Geschäft
   weiter ausbauen können. Wir bauen digitale Businesses in Glarus
   auf:

  - Symmetrisches Internet
  - Data Center Light
  - Coworking

  Mit dem Funding für diese Kampagne starten wir einen neuen Coworking-Space in Braunwald.""",

   order_description: """## Bezahlung

   Bitte bezahlen Sie per Überweisung auf das folgende Konto:

   IBAN: CH93 0076 2011 6238 5295 7

   BIC: POFICHBEXXX""",

   start_date: 2.days.before,
   end_date: 40.days.from_now,
   youtube_url: "https://www.youtube.com/watch?v=ZUgjm-XqKuc",
   twitter_url: "https://twitter.com/digitalglarus",
   facebook_url: "https://www.facebook.com/ungleich.ch/",
   goal: 50000,
   email: "seed1@example.com"

 seed Goody, { title: "Aufkleber" },
   description: "Digtal Glarus Aufkleber",
   price: 10,
   quantity: 100,
   campaign: Campaign.first

 seed Goody, { title: "T-Shirts" },
   description: "Passt super und hält warm",
   price: 55,
   quantity: 200,
   campaign: Campaign.first

 seed Goody, { title: "Mitgliedschaft" },
   description: "Erlebe sonniges Arbeiten in Braundwald!",
   price: 555,
   quantity: 200,
   campaign: Campaign.first


 seed Order, { goody: Goody.first },
   agreement: true,
   quantity: 1,
   amount: 10,
   paid: true,
   payment_type: "stripe",
   supporter: FactoryBot.build(:supporter)
