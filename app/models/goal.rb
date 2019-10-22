class Goal < ApplicationRecord
	validates :users_id,{presence: true}
	validates :date,{presence: true}
end
