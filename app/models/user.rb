class User < ApplicationRecord
        belongs_to :division
        has_many :report
        
    validates :name, presence: { message: 'は必須項目です。'}
    validates :kana, presence: { message: 'は必須項目です。'}
    validates :memo, presence: { message: 'は必須項目です。'}
end