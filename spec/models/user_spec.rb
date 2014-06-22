require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
	before { @user.name = "a" * (50 + 1) }
	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
  			foo@bar_baz.com foo@bar+baz.com foo@bar..com]

  		# Iterate through invalid addresses
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when email address is already taken" do
  	before do
  		duplicate_user = @user.dup
  		duplicate_user.email = @user.email.upcase
  		duplicate_user.save
  	end

  	it { should_not be_valid }
  end
end