require 'rails_helper'

RSpec.describe "SeasonsApi", type: :request do
  describe "GET /seasons" do
    before do
      @seasons = [FactoryBot.create(:season)]
      get seasons_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected season attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response).to eq @seasons.map(&:attributes)
    end
  end

  describe "GET /seasons/:id" do
    before do
      @season = FactoryBot.create(:season)
      get season_path(@season)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected season attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys.map(&:to_sym)).to match_array([:id, :year])
    end
  end
end
