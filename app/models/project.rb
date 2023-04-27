class Project < ApplicationRecord
    # require title and description
    validates_presence_of :title, :description, :one, :two
    has_many :projects
end

class Graph < ApplicationRecord
    belongs_to :project
end