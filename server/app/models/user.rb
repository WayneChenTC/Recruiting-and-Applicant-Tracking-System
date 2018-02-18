class User < ApplicationRecord
    has_many :applications, :optional => true
end
