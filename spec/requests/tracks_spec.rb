require 'rails_helper'

RSpec.describe 'Tracks API', type: :request do
  it 'returns all user tracks' do
    get 'http://localhost:3001/api/v1/tracks'

    expect(response).to have_http_status(:success)
  end
end