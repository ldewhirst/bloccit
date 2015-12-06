require 'rails_helper'

RSpec.describe Rateable, type: :model do
  it { should belong_to :rate }
  
end
