require "minitest/unit"
require "minitest/autorun"
require "minitest/pride"
require_relative "../models/task"

class TaskTest < MiniTest::Unit::TestCase
  def setup
    @task = Todo::Task.new "Walk the Pug"
  end

  def test_task_creation
    assert @task, "No task was created."
  end

  def test_task_has_name
    assert_equal "Walk the Pug", @task.name
  end

  def test_task_defaults_to_incomplete
    refute @task.completed?, "Task already marked complete."
  end

  def test_mark_test_complete
    refute @task.completed?, "Task already marked complete."

    @task.complete!
    assert @task.completed?, "Task not marked complete."
  end

  def test_mark_test_incomplete
    @task.complete!
    assert @task.completed?, "Task not marked complete."

    @task.uncomplete!
    refute @task.completed?, "Task marked complete."
  end
end
