class User < ActiveRecord::Base
  filter_for :status
  filter_for :state
end
