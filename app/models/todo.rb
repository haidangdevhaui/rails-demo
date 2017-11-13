class Todo < ApplicationRecord
	self.table_name = "todos"

	self.primary_key = "id"

	validates :title, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: true
end
