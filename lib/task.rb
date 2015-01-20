class Task
  attr_reader(:description, :list_id, :due_date)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @due_date = attributes.fetch(:due_date)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      due_date = task.fetch("due_date")
      list_id = task.fetch("list_id").to_i()
      tasks.push(Task.new({:description => description, :list_id =>list_id, :due_date => due_date}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
  end

  define_method(:==) do |task_to_compare|
    (description == task_to_compare.description()) && (list_id == task_to_compare.list_id()) && (due_date == task_to_compare.due_date())
  end

end
