require 'rails_helper'
RSpec.describe User, type: :model do
  before (:each) do
   @user = User.create(first_name:'Bailey', last_name:'Anderson', email:'bailey@gmail.com', username:'iamusername')
  end
  it "should not register username if the username is not unique" do
    expect(build(:user)).to be_invalid
  end
  it "should not register username if less than five characters" do
    expect(build(:user)).to be_invalid
  end

end