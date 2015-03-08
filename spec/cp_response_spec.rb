require 'spec_helper'

describe CpResponse do
  before :all do
    @client_response = OpenStruct.new(status: 200, body: "{\"foo\":\"bar\"}")
  end

  it "instantiates a response" do
    response = CpResponse.new { @client_response }
    expect(response).not_to be_nil
  end

  it "shows error handled " do
    response = CpResponse.new { OpenStruct.new(status: 400, body: "") }
    expect(response.status).to eq(400)
  end

  it "shows 422 error handled " do
    response = CpResponse.new { OpenStruct.new(status: 422, body: @client_response.body) }
    expect(response.status).to eq(422)
    expect(response.to_hash).to eq({"foo" => "bar"})
  end

  it "should render a hash" do
    response = CpResponse.new { @client_response }
    expect(response.to_hash).to eq({"foo" => "bar"})
  end

  it "can prettify json" do
    response = CpResponse.new { @client_response }
    expect(response.pretty)

  end
end
