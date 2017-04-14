class Profile < ActiveRecord::Base
  belongs_to :user

  validate :not_both_null
  validates :gender, inclusion: ["male", "female"]
  validate :male_not_sue

  def not_both_null
  	if first_name.nil? && last_name.nil?
  		errors.add(:base, "You must at least have a first_name or last_name!")
  	end
  end

  def male_not_sue
  	if gender.eql?("male") && first_name.eql?("Sue")
  		errors.add(:base, "cannot have first_name as sue")
  	end
  end

  def self.get_all_profiles(min, max)
  	Profile.where("birth_year BETWEEN :min AND :max", min: min, max: max).order(birth_year: :asc)
  end
end
