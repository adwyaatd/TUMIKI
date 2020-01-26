class Goal < ApplicationRecord
	validates :user_id,:date,:purpose,:date,{presence: true}
end
