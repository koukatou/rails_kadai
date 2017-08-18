class Report < ApplicationRecord
    belongs_to :user
    belongs_to :division
    
    validates :entry_date, length: {is: 10 , message:'は、半角数字８文字で'}
    validates :user_id, presence:  {message:'は、必須項目です'}
    # validates :entry_date && :user_id, uniqueness: {message:'すでに同じ日付の日報が存在しています'}
    validates :user_id, uniqueness: {scope: :entry_date, message:'すでに同じ日付の日報が存在しています'}
    
end
