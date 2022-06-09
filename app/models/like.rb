class Like < ApplicationRecord
    belongs_to :article
    validates :account_id, presence: true
    validates :article_id, presence: true
end
