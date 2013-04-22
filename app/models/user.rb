#encoding: utf-8
class User < ActiveRecord::Base
    attr_accessible :username, :password
    validates :username, :password, :presence => { :message => "不能为空" }
    validates :password, :length => { :minimum => 6, :message => "最少为6位" }
    validates :username, :uniqueness => {:case_sensitive => false, :message => "已被使用，再选个名字吧"}

    has_secure_password
end