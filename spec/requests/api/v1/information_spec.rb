require "rails_helper"

describe "Informations API" do
  describe "Get #list" do
    let!(:information){ FactoryGirl.create :information }

    it "should return a array of informations" do
      get "/api/v1/informations/list"
      expect_json_types "*", url: :string, content: :string
    end

    it "should contain correct info" do
      get "/api/v1/informations/list"
      expect_json "*", url: information.url, content: information.content
    end

    it "should return [] if no information exists" do
      Information.destroy_all
      get "/api/v1/informations/list"
      expect_json []
    end
  end

  describe "Post #grab_content" do
    it "should return url and information with valid url" do
      post "/api/v1/informations/grab_content", params: { url: "https://en.wikipedia.org/" }
      expect_json_types url: :string, content: :string
    end

    it "should create a information record with valid url" do
      post "/api/v1/informations/grab_content", params: { url: "https://en.wikipedia.org/" }
      expect(Information.count).to eq 1
    end

    it "should return error status if url not valid" do
      post "/api/v1/informations/grab_content", params: { url: "something.org/" }
      expect_status :bad_request
    end

    it "should return error status if param missing" do
      post "/api/v1/informations/grab_content"
      expect_status :bad_request
    end
  end
end
