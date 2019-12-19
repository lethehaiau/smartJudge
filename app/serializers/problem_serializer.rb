class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :solution_function
end
