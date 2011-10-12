require 'spec_helper'

describe User do
    
    before(:each) do
        @attr = {:name => "Example User", :email => "user@example.com"}
    end
    
    it "should create a new instance given valid attributes" do
        User.create!(@attr)
    end
    
    it "Should require a name" do
        no_name_user = User.new(@attr.merge(:name => ""))
        no_name_user.should_not be_valid
    end
    
    it "should require an email address" do
        no_email_user = User.new(@attr.merge(:email => ""))
        no_email_user.should_not be_valid
    end

    it "should reject names that are too long" do
        long_name = "a" * 51
        long_name_user = User.new(@attr.merge(:name => long_name))
        long_name_user.should_not be_valid
    end
    
    it "should accept valid email addresses" do
        addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
        addresses.each do |address|
            valid_email_user = User.new(@attr.merge(:email => address))
            valid_email_user.should be_valid
        end
    end
    
    it "should reject bad emails" do
        addresses = %w[user@foo,com user_at_foo_.org example.user@foo.]
        addresses.each do |address|
            invalid_email_user = User.new(@attr.merge(:email => address))
            invalid_email_user.should_not be_valid
        end
    end
    
    it "should reject duplicate email addresses" do
        #puts a user with a given email address into the database
        User.create!(@attr)
        user_with_dup_email = User.new(@attr)
        user_with_dup_email.should_not be_valid
    end
    
    it "should reject duplicate emails and is case sesitive" do
        upcased_email = @attr[:email].upcase
        User.create!(@attr.merge(:email => upcased_email))
        user_with_dup_email = User.new(@attr)
        user_with_dup_email.should_not be_valid
    end
    
end