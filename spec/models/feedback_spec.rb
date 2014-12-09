require 'rails_helper'

describe Feedback, type: :model do

  context "validations" do
    it { should validate_presence_of :feedback }
  end

end