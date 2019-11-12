class Goal < ApplicationRecord
	validates :users_id,:date,:purpose,:date,{presence: true}
end
