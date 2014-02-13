require 'spec_helper'

describe User do
  before do
  	@user = User.new(email: 'rainaldo.crosbourne@time4lime.com')
  end
  subject { @user }
  it { should respond_to(:email) }  
  it { should be_valid } 

  describe "when email is not present" do
  	before { @user.email = " " } 
  	it { should_not be_valid } 
  end
  describe "when email is already taken" do
  	before do
  		user_with_same_name = @user.dup
  		user_with_same_name.email = @user.email.upcase
  		user_with_same_name.save
  	end
  	it { should_not be_valid } 
  end
end
