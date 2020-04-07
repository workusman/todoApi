json.array!(@todos) do |todo|
  json.id todo.id
  json.todo todo.name
  todo.completed todo.completed
end