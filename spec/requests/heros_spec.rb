require 'rails_helper'

RSpec.describe 'Api V1 Heros', type: :request do
  let(:api)        { '/api/heros' }
  let(:valid_hero) { { id: 1 } }
  let(:wrong_hero) { { id: 12010 } }

  describe 'GET /heros' do
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
      records_overwatch_ids = records.map { |hero| hero['overwatch_id'] }

      expect(records.count).to be >= 1
      expect(records_overwatch_ids).to include(valid_hero[:id])
    end
  end

  describe 'GET #HERO' do
    it 'will retrieve records based on given id' do
      get "#{api}/#{valid_hero[:id]}"
      record = JSON.parse(response.body)
      hero = record['data']

      expect(hero['overwatch_id']).to eql(valid_hero[:id])
      expect(hero).to include('real_name')
      expect(hero).to include('name')
      expect(hero).to include('armour')
      expect(hero).to include('health')
      expect(hero).to include('shield')
    end

    it 'will respond with error' do
      get "#{api}/#{wrong_hero[:id]}"
      record = JSON.parse(response.body)

      expect(record['data']).to eql(nil)
      expect(record['message']).to eql('No Details to Show')
    end
  end

  describe 'GET #HERO Abilities' do
    it 'will retrieve records based on given id' do
      get "#{api}/#{valid_hero[:id]}/abilities"
      record    = JSON.parse(response.body)
      hero      = record['data']['hero']
      abilities = record['data']['abilities']

      expect(hero['overwatch_id']).to eql(valid_hero[:id])
      expect(hero).to include('real_name')
      expect(hero).to include('name')
      expect(hero).to include('armour')
      expect(hero).to include('health')
      expect(hero).to include('shield')
      expect(abilities).not_to be_empty
      expect(abilities.count).to eql(AbilityHero.count)
    end
  end
end
