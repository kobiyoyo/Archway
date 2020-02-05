require 'faker'

FactoryBot.define do

  factory :user do
    first_name { 'chubi' }
    last_name { 'adama' }
    gender { 'male' }
    date_of_birth { '10/10/1997' }
    email { 'adama@gmail.com' }
    password { 'scerette' }
    password_confirmation { 'scerette' }
  end

  factory :user_two, class: User do
    first_name { 'charles' }
    last_name { 'adama' }
    gender { 'male' }
    date_of_birth { '10/10/1997' }
    email { Faker::Internet.email }
    password { 'scerette' }
    password_confirmation { 'scerette' }
  end

end