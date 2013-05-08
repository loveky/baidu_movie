require "spec_helper"

describe Bdhd do 
    it { should belong_to(:movie)}
    it { should have_many(:users).through(:play_histories) }
end