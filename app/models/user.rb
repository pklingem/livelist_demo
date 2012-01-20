class User < ActiveRecord::Base
  filters :status, :state
end
