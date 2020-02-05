require 'rails_helper'

RSpec.describe User, type: :model do
   describe 'validations' do
  	it 'requires email' do 
      user = User.new(email:' ',password:'chubiyojo',password_confirmation:'chubiyojo') 
      expect(user.valid?).to be_falsy
  	end
  	it 'requires password' do 
      user = User.new(email:'yabmas@gmail.com',password:'',password_confirmation:'') 
      expect(user.valid?).to be_falsy
  	end
  	it 'requires password_confirmation' do 
      user = User.new(email:'yabmas@gmail.com',password:'chubiyojo',password_confirmation:'') 
      expect(user.valid?).to be_falsy
  	end
  	it { should have_many(:posts) }
  end
end
