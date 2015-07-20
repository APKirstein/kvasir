require 'rails_helper'
require 'pry-byebug'

RSpec.describe Item, type: :model do
  it { should have_valid(:name).when('plagioclase') }
  it { should have_valid(:region).when(100034) }
  it { should have_valid(:eve_type).when(97845) }
  it { should have_valid(:buy_price).when(100.97) }
  it { should have_valid(:sell_price).when(110) }
  it { should have_valid(:info_date).when("2015-07-16 10:49:22 UTC") }
  it { should_not have_valid(:name).when(nil) }
  it { should_not have_valid(:region).when(nil) }
  it { should_not have_valid(:eve_type).when(nil) }
  it { should_not have_valid(:buy_price).when(nil) }
  it { should_not have_valid(:sell_price).when(nil) }
  it { should_not have_valid(:info_date).when(nil) }

  describe "searching" do
    it 'matches by id' do
      5.times { FactoryGirl.create(:item) }

      results = Item.search(Item.last.name)
      expect(results).to include(Item.last)
    end
  end
end
