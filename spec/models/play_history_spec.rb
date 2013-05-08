require "spec_helper"

describe PlayHistory do 
  it { should belong_to(:user) }
  it { should belong_to(:movie) }
end