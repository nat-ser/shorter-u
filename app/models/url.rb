class Url < ApplicationRecord
  def short
    id.to_s(36)
  end
end
