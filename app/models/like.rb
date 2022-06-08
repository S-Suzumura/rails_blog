class Like < ApplicationRecord
    validates :account_id, presence: true
    validates :article_id, presence: true
end
