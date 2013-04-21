class User < ActiveRecord::Base
    attr_accessible :username, :password
    validates :username, :password, :presence => true
    validates :password, :length => { :minimum => 6 }


    has_secure_password
end