require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { belong_to :school }
end
