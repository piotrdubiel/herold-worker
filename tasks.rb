require "tasks/computer_tasks"

def find_task_for(message)
  classname = "#{message["object"].capitalize}#{message["action"].capitalize}Task"
  Module.const_get(classname)
end
