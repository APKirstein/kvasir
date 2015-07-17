require 'rails_helper'

RSpec.describe TrackedItem, type: :model do
  it { should have_valid(:user_id).when(1) }
  it { should have_valid(:item_id).when(1095) }
  it { should_not have_valid(:user_id).when(nil) }
  it { should_not have_valid(:item_id).when(nil) }
end
