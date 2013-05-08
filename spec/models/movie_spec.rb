require "spec_helper"

describe Movie do
    it { should have_many(:bdhds) }
    it { should have_many(:sources)}
    it { should have_many(:comments)}
    it { should have_many(:users).through(:play_histories) }
end