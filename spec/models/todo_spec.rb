require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "is valid with valid attributes" do
    todo = Todo.new(task: "test task")
    expect(todo).to be_valid
  end

  it "is not valid" do
    todo = Todo.new(task: nil)
    expect(todo).to_not be_valid
  end
end
