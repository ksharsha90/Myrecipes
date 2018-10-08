require 'test_helper'

class RowdieTest < ActiveSupport::TestCase
  
  def setup
    @rowdie = Rowdie.new(rowdyname: "Harsha", email: "harsha@example.com")
  end
  
  test "Should be valid" do
    assert @rowdie.valid?
  end
  
  test "name should be present" do
    @rowdie.rowdyname = " "
    assert_not @rowdie.valid?
  end
  
  test "name shouldn't be lessthan 30 characters" do
    @rowdie.rowdyname = "a" * 31
    assert_not @rowdie.valid?
  end
  
  test "email should be present" do
    @rowdie.email = " "
    assert_not @rowdie.valid?
  end
  
  test "email shouldn't be too long" do
    @rowdie.email = "a" * 245 + "@example.com"
    assert_not @rowdie.valid?
  end
  
  test "email should accept correct format" do
    valid_emails = %w[user@example.com Harsha@gmail.com H.first@yahoo.ca  john+smith@co.uk.org]
    valid_emails.each do |valids|
    @rowdie.email = valids
    assert @rowdie.valid?, "#{valids.inspect} should be valid"
   end
  end
  
  test "should reject invalid address" do
    invalid_emails = %w[harsha@example harsha@example,com harsha.name@gmail.]
    invalid_emails.each do |invalids|
      @rowdie.email =invalids
      assert_not @rowdie.valid?, "#{invalids.inspect} should be invalid"
    end
  end
  
  test "email should be unique and case insensitive" do
    duplicate_rowdie = @rowdie.dup
    duplicate_rowdie.email = @rowdie.email.upcase
    @rowdie.save
    assert_not duplicate_rowdie.valid?
  end
  
  test "email should be lower case before hitting db" do
    mixed_email = "harsha@example.com"
    @rowdie.email = mixed_email
    @rowdie.save
    assert_equal mixed_email.downcase, @rowdie.reload.email
  end
  
end