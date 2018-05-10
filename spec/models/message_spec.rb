require 'rails_helper'
RSpec.describe Message, type: :model do
    it "message should be longer than ten characters" do 
      expect(build(:message)).to be_invalid #factory girl has short default string thats why it fails
    end
    it "should not post a message without a user" do
      @message = Message.create(post:"This is longer than ten characters")
      expect(@message).to be_valid
    end

end