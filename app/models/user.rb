class User < ActiveRecord::Base
  has_one :surfer, dependent: :destroy, :foreign_key => :surfer_id
end
