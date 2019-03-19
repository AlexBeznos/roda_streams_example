require "spec_helper"

RSpec.describe "/ping", type: :request do
  let(:path) { "/ping" }

  it "return status 200 with body 'pong'" do
    get path

    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("pong")
  end
end
