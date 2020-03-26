class Goal < ApplicationRecord
	validates :user_id,:goal,:purpose,:date,{presence: true}
end
