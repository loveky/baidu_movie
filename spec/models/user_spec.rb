#encoding: utf-8
require "spec_helper"

describe User do
    it { should have_many(:comments) }
    it { should have_many(:movies).through(:play_histories) }

    it { should validate_presence_of(:username).with_message(/不能为空/) }
    it { should validate_presence_of(:password).with_message(/不能为空/) }
    it { should validate_presence_of(:password_confirmation).with_message(/不能为空/) }

    it { should ensure_length_of(:password).is_at_least(6).with_message(/最少为6位/) }

    it { should validate_uniqueness_of(:username).with_message(/再选个名字吧/) }
end