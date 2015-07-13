require 'rails_helper'

RSpec.describe Market, type: :model do
  it { should have_valid(:sale_type).when('s') }
  it { should have_valid(:name).when('plagioclase') }
  it { should have_valid(:regionid).when(100034) }
  it { should have_valid(:typeid).when(97845) }
  it { should have_valid(:price).when(100.97) }
  it { should have_valid(:info_date).when(10.24/2015) }
  it { should_not have_valid(:sale_type).when(nil) }
  it { should_not have_valid(:name).when(nil) }
  it { should_not have_valid(:regionid).when(nil) }
  it { should_not have_valid(:typeid).when(nil) }
  it { should_not have_valid(:price).when(nil) }
  it { should_not have_valid(:info_date).when(nil) }
  it { should_not have_valid(:sale_type).when('l') }
end
