# == Schema Information
#
# Table name: problems
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  inputs            :text
#  outputs           :text
#  solution_function :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Problem < ApplicationRecord
end
