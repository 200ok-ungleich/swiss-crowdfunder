if Rails.env.development?
  AdminUser.create! email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
end
