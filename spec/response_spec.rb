require 'spec_helper'

describe CpResponse do
  it "instantiates a response" do
    response = CpResponse.new 'foo'
    expect(response).not_to be_nil
  end
end
