require_relative '../lib/halo_api_console/cp_config.rb'
require_relative '../lib/halo_api_console/cp_session.rb'

describe session = CpSession do
  before :each do
    CpSession.any_instance.stub(:get_authorized).and_return({})
  end

  it "calls get " do
    expect(session).to receive :get
    session.get(:fim_policies)
  end

  it "calls put " do
    expect(session).to receive :put
    session.put(:fim_policies, id:1)
  end

  it "calls post " do
    expect(session).to receive :post
    session.post(:fim_policies, id:1)
  end

  it "calls delete " do
    expect(session).to receive :delete
    session.delete(:fim_policies, id:1)
  end

end
