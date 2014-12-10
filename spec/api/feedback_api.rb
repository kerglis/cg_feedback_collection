require 'rails_helper'

describe "FeedbackAPI", type: :request do

  let!(:base_url) { "/api/v1/feedback" }
  let!(:params_yes) do
    {
      name: "Full Name",
      email: "email@example.com",
      is_success: true,
      feedback: "Positive feedback"
    }
  end
  let!(:params_no) do
    {
      name: "Other Name",
      email: "email@other.com",
      is_success: false,
      feedback: "Neutral feedback"
    }
  end

  describe "GET to /api/v1/feedback/list" do
    before do
      Feedback.destroy_all
      5.times { FactoryGirl.create(:feedback, is_success: true) }
      3.times { FactoryGirl.create(:feedback, is_success: false) }
    end

    it 'all feedbacks' do
      get "#{base_url}/list"
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json.size).to eq 8
    end

    it 'successful feedbacks' do
      get "#{base_url}/list?filter=successful"
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json.size).to eq 5
      get "#{base_url}/list?limit=2&filter=unsuccessful"
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json.size).to eq 2
    end

    it 'unsuccessful feedbacks' do
      get "#{base_url}/list?filter=unsuccessful"
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json.size).to eq 3

      get "#{base_url}/list?filter=unsuccessful&limit=1"
      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json.size).to eq 1
    end
  end

  describe "POST to /api/v1/feedbacks" do
    it 'successful post' do
      post base_url, params_yes
      expect(response.status).to eq(201)
      @feedback = Feedback.last
      expect(@feedback.name).to eq "Full Name"
      expect(@feedback).to be_is_success
    end

    it 'unsucessful post' do
      post base_url, params_no
      expect(response.status).to eq(201)
      @feedback = Feedback.last
      expect(@feedback.email).to eq "email@other.com"
      expect(@feedback).to_not be_is_success
    end
  end

end