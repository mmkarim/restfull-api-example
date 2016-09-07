require "rails_helper"

describe Information do
  subject { information }
  it { should be_valid }

  let!(:information){FactoryGirl.create :information}
end
