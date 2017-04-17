require 'rails_helper'

RSpec.describe Search, type: :model do
  it { validate_presence_of :zip }
end
