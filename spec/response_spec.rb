require 'spec_helper'

describe CpResponse do
  it "instantiates a response" do
    response = CpResponse.new{'foo'}
    expect(response).not_to be_nil
  end

  it "shows raw" do
    response = CpResponse.new{'foo'}
    response.to_s.should eq('foo')
  end

  it "should render a hash" do
    response = CpResponse.new{"{\"foo\":\"bar\"}"}
    response.to_hash.should eq({'foo' => 'bar'})
  end

  it "can prettify json" do
    response = CpResponse.new {"{\"foo\":\"bar\"}"}
    response.pretty.should eq("{\n  \"foo\": \"bar\"\n}")
  end
end
