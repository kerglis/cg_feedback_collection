require 'rails_helper'

describe Feedback, type: :model do

  it { should validate_presence_of :feedback }

  let!(:feedback_yes) { create :feedback, is_success: true }
  let!(:feedback_no)  { create :feedback, is_success: false }

  specify { expect(feedback_yes.is_success_str).to eq "yes" }
  specify { expect(feedback_no.is_success_str).to eq "no" }

  context "states" do

    it { expect(feedback_yes).to be_unapproved }

    it "approve" do
      feedback_yes.approve
      expect(feedback_yes).to be_approved
    end

    it "swap" do
      feedback_yes.swap
      expect(feedback_yes).to be_approved
      feedback_yes.swap
      expect(feedback_yes).to be_unapproved
    end

  end

  context "default values" do
    it "feedback_type" do
      expect(feedback_yes.feedback_type).to eq(Feedback.feedback_types.first)
    end

    it "feedback_editable_copy" do
      expect(feedback_yes.reload.feedback_editable_copy).to eq(feedback_yes.feedback)
    end
  end

end