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
    session.should_receive :get
    session.post(:fim_policies, id:1)
  end

  it "calls patch " do
    session.should_receive :get
    session.patch(:fim_policies, id:1)
  end


end
