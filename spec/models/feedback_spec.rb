require 'rails_helper'

describe Feedback, type: :model do

  context "validations" do
    it { should validate_presence_of :feedback }
  end

  let!(:feedback_yes) { create :feedback, is_success: true }
  let!(:feedback_no)  { create :feedback, is_success: false }

  specify { expect(feedback_yes.is_success_str).to eq "yes" }
  specify { expect(feedback_no.is_success_str).to eq "no" }

end