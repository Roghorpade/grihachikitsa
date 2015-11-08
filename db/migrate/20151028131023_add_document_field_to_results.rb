class AddDocumentFieldToResults < ActiveRecord::Migration
  def up
    add_attachment :results, :document
  end

  def down
    remove_attachment :results, :document
  end
end
