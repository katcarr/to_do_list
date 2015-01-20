class Task
  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}');")
  end

  define_singleton_method(:clear) do
    @@all_tasks = []
  end

  define_method(:==) do |task_to_compare|
    description == task_to_compare.description()
  end

end
