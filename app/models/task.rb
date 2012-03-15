class Task < ActiveRecord::Base
    
  belongs_to :list, :class_name => "List", :foreign_key => "list_id"

  validates :name, :presence => true

  def uncheck!
    self.done = false
    self.save
  end
  
  def self.random_task!(list_id)
    if list = List.find_by_id(list_id)
      list.tasks.create(:name => Faker::Company.catch_phrase)
    end
  end
end
