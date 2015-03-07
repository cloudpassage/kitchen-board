require 'spec_helper'

describe CpResponse do
  it "instantiates a response" do
    response = CpResponse.new { 'foo' }
    expect(response).not_to be_nil
  end

  it "shows error handled " do
    response = CpResponse.new { OpenStruct.new(:status => 400) }
    expect(response.result.status).to eq( 400 )
  end

  it "should render a hash" do
    response = CpResponse.new { OpenStruct.new(:body => "{\"foo\":\"bar\"}") }
    expect(response.to_hash).to eq({"foo"=>"bar"})
  end

  it "can prettify json" do
    response = CpResponse.new { OpenStruct.new(:status=> 200, :body => "{\"foo\":\"bar\"}")  }
    expect(response.pretty)

  end
end
