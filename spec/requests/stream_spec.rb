require "spec_helper"

RSpec.describe "/stream", type: :request do
  let(:path) { "/stream" }

  it "return proper response" do
    status, headers, body = prepare_request

    expect(status).to eq(200)
    expect(headers).to eq({ "Content-Type" => "text/event" })
    expect(body).to be_kind_of(Enumerable)
  end

  it "have proper body content" do
    status, headers, body = prepare_request

    expect(body.map(&:itself)).to eq(Array.new(10, "Hello\n"))
  end

  def prepare_request
    uri = current_session.send(:parse_uri, path, {})
    env = current_session.send(:env_for, uri, {})

    app.call(env)
  end
end
