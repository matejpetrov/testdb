class Article < ActiveRecord::Base
    #needs to be automatically added
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5, maximum: 20 }

end
