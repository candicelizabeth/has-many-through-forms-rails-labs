class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories)
    categories.values.each do |category|
      if !category[:name].blank?
        self.categories.build(category)
      end
    end
  end

end
