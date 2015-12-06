include RandomData

FactoryGirl define.do
  value = [-1, 1]
  factory :vote do
    value
    post
    user
  end

end
