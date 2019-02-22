require 'rails_helper'

RSpec.describe 'Api V1 Abilities', type: :request do
  let(:api)        { '/api/abilities' }
  let(:valid_ability) { { id: 1 } }
  let(:wrong_ability) { { id: 12010 } }

  describe 'GET /abilitys' do
    before(:each) do
      get "#{api}"
    end

    it 'works!' do
      expect(response).to have_http_status(200)
    end

    it 'get details from json respond' do
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eql('Success')
      records               = json_response['data']
      records_overwatch_ids = records.map { |ability| ability['overwatch_id'] }

      expect(records.count).to be >= 1
      expect(records_overwatch_ids).to include(valid_ability[:id])
    end
  end

  describe 'GET #Ability' do
    it 'will retrieve records based on given id' do
      get "#{api}/#{valid_ability[:id]}"
      record = JSON.parse(response.body)
      ability = record['data']

      expect(ability['overwatch_id']).to eql(valid_ability[:id])
      expect(ability).to include('name')
      expect(ability).to include('description')
      expect(ability).to include('is_ultimate')
    end

    it 'will respond with error' do
      get "#{api}/#{wrong_ability[:id]}"
      record = JSON.parse(response.body)

      expect(record['data']).to eql(nil)
      expect(record['message']).to eql('No Details to Show')
    end
  end
end
