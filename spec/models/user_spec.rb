require 'rails_helper'

RSpec.describe User, type: :model do
  it { have_many :teachers }
  it { validate_presence_of :first_name }
  it { validate_presence_of :last_name }
end
