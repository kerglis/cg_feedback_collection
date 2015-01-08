require 'rails_helper'

describe Feedback, type: :model do

  it { should validate_presence_of :feedback }

  let!(:feedback_yes) { create :feedback, is_success: true }
  let!(:feedback_no)  { create :feedback, is_success: false }

  specify { expect(feedback_yes.is_success_str).to eq "yes" }
  specify { expect(feedback_no.is_success_str).to eq "no" }

  context "states" do
    specify { expect(feedback_yes).to be_unapproved }

    context "approve" do
      before { feedback_yes.approve }
      specify { expect(feedback_yes).to be_approved }
    end

  end

  context "default values" do
    it "feedback_type" do
      expect(feedback_yes.feedback_type).to eq(Feedback.feedback_types.first)
    end

  end

end