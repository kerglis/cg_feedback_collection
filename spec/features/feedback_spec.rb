require 'rails_helper'

feature "Feedback", type: :feature do

  scenario "bad link" do
    visit "/"

    expect(page).to have_content "Please use link sent from CodeGuard"
    expect(page).to_not have_field("feedback")
  end

  scenario "complete form with :is_success false" do
    visit prepared_feedback_link

    expect(page).to have_field("feedback")

    choose "feedback_is_success_false"
    fill_in "feedback_feedback", with: "Some feedback text"
    click_on "Create Feedback"

    @feedback = Feedback.last

    expect(@feedback).to_not be_is_success
    expect(@feedback.feedback).to eq "Some feedback text"
    expect(page).to have_content I18n.t("feedback.thank_you")
    expect(page).to_not have_field("feedback_website_url")
  end

  scenario "complete form with :is_success true" do
    visit prepared_feedback_link

    choose "feedback_is_success_true"
    fill_in "feedback_feedback", with: "Some other feedback text"
    click_on "Create Feedback"

    @feedback = Feedback.last

    expect(@feedback).to be_is_success
    expect(@feedback.feedback).to eq "Some other feedback text"
    expect(page).to_not have_content I18n.t("feedback.thank_you")
    expect(page).to have_field("feedback_website_url")
    expect(page).to have_field("feedback_image")

    fill_in "feedback_website_url", with: "http://example.com"
    attach_file 'feedback_image', "spec/fixtures/gordon_freeman.jpg"

    click_on "Update Feedback"

    expect(page).to have_content I18n.t("feedback.thank_you")

    @feedback.reload

    expect(@feedback.website_url).to eq "http://example.com"
    expect(@feedback.image.name).to eq "gordon_freeman.jpg"
  end

  scenario "form with out required fields" do
    visit prepared_feedback_link

    choose "feedback_is_success_true"
    click_on "Create Feedback"

    within ".control-group.feedback_feedback" do
      expect(page).to have_content "can't be blank"
    end

  end
end
