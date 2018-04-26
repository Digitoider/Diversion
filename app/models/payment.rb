class Payment < ApplicationRecord
  belongs_to :user

  def get_formatted_starts_at
    get_formatted_date starts_at
  end

  def get_formatted_ends_at
    get_formatted_date ends_at
  end

  private

  def get_formatted_date(date)
    date.strftime("%b %e, %Y")
  end
end
