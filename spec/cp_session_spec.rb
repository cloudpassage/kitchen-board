require 'spec_helper'

describe session = CpSession.new do

  it "calls get " do
    session.should_receive :get
    session.get(:fim_policies)
  end

  it "calls put " do
    session.should_receive :put
    session.put(:fim_policies, id:1)
  end

  it "calls post " do
    session.should_receive :post
    session.post(:fim_policies, id:1)
  end

  it "calls delete " do
    session.should_receive :delete
    session.delete(:fim_policies, id:1)
  end

end
