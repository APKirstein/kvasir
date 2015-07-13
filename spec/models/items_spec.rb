require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_valid(:user_id).when(1) }
  it { should have_valid(:market_id).when(1095) }
  it { should_not have_valid(:user_id).when(nil) }
  it { should_not have_valid(:market_id).when(nil) }
end
