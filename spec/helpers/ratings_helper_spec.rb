require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RatingsHelper. For example:
#
# describe RatingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RatingsHelper, type: :helper do
  describe "ratings_to_buttons" do
    it "turns ratings into HTML buttons" do
      PG = Rating.create!(severity: :PG)
      PG13 = Rating.create!(severity: :PG13)
      R = Rating.create!(severity: :R)
      expected_html = '<a class="btn-xs btn-primary" href="/ratings/PG">PG</a> <a class="btn-xs btn-primary" href="/ratings/PG13">PG13</a> <a class="btn-xs btn-primary" href="/ratings/R">R</a>'
      expect(ratings_to_buttons([PG, PG13, R])).to eq expected_html
    end
  end
end
