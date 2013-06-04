
FactoryGirl.define do
  factory :contact_type, :class => Refinery::ContactTypes::ContactType do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

