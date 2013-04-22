#encoding: utf-8
class User < ActiveRecord::Base
    attr_accessible :username, :password, :password_confirmation
    validates :username, :password, :password_confirmation, :presence => { :message => "不能为空" }
    validates :password, :length => { :minimum => 6, :message => "最少为6位" }, :unless => Proc.new { |a| a.password.blank? }
    validates :password, :confirmation => {:message => "两次密码输入不一致"}, :unless => Proc.new { |a| a.password.blank? || a.password_confirmation.blank? }
    validates :username, :uniqueness => {:case_sensitive => false, :message => "已被使用，再选个名字吧"}

    has_secure_password
end