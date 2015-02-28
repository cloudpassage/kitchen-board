require 'spec_helper'

describe CpResponse do
  it "instantiates a response" do
    response = CpResponse.new{'foo'}
    expect(response).not_to be_nil
  end

  it "shows error handled " do
    response = CpResponse.new{ raise "Foo" }
    expect(response).not_to be_nil
  end

  it "should render a hash" do
    response = CpResponse.new{"{\"foo\":\"bar\"}"}
  end

  it "can prettify json" do
    response = CpResponse.new {"{\"foo\":\"bar\"}"}
    response.pretty
  end
end
