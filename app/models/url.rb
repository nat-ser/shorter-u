class Url < ApplicationRecord
  def short
    "http://localhost:3000/" + id.to_s(36)
  end
end
