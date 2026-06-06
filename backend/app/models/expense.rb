class Expense < ApplicationRecord
  belongs_to :category

  # prevent user from adding future date
  validate :date_cannot_be_in_future

  private

  # check if selected date is beyond today
  def date_cannot_be_in_future
    if date.present? && date > Date.today
      errors.add(:date, "cannot be in the future")
    end
  end

end