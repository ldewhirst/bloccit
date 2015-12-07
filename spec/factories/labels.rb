include RandomData

FactoryGirl.define do

  factory :label do
    label RandomData.random_sentence
  end
end
