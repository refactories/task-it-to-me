require "spec_helper"

RSpec.describe App do
  it "gets input in a loop until it gets a 'q' message for quit" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return("ls\n", "q\n")

    app.run
  end

  it "prints out a welcome message" do
    stdout = StringIO.new("")
    stdin = double(gets: "q\n")
    app = App.new(stdout, stdin)

    app.run

    expect(normalized_output(stdout)).to include("Welcome to Taskitome!")
  end

  it "prints out a menu of commands" do
    stdout = StringIO.new("")
    stdin = double(gets: "q\n")
    app = App.new(stdout, stdin)

    app.run

    output = normalized_output(stdout)
    expect(output).to include("a   Add a new project")
    expect(output).to include("ls  List all project")
    expect(output).to include("d   Delete a project")
    expect(output).to include("e   Edit a project")
    expect(output).to include("q   Quit the app")
  end

  it "'ls' command to list projects returns an error message when there are no projects" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return("ls\n", "q\n")

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No projects created")
  end

  it "'a' command creates a project and confirms creation" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return("a\n", "Cat Husbandry\n", "q\n")

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Enter a project name")
    expect(output).to include("Created project: 'Cat Husbandry'")
  end

  it "'ls' command after creating projects lists the all" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "Cat Servitude\n", "a\n", "House work\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Listing projects:\n  Cat Servitude\n  House work")
  end

  it "'d' command when there are no projects prints an error message" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "d\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No projects created")
    expect(output).to include("Can't delete a project")
  end

  it "'d' command will delete a project by name" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "d\n", "House work\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Deleting project: 'House work'")

    last_section = output.split("Listing projects").last
    expect(last_section).to_not include("House work")
    expect(last_section).to include("No projects created")
  end

  it "returns an error message when trying to delete with command 'd' a project that doesn't exist" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "d\n", "House Work\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to_not include("Deleting project: 'House Work'")
    expect(output).to include("Project doesn't exist: 'House Work'")
  end

  it "cannot edit a project with command 'e' when there are none" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "e\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No projects created")
    expect(output).to include("Can't edit any projects")
  end

  it "cannot edit a project with the command 'e' that does not exist" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House Work\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to_not include("Editing project: 'House Work'")
    expect(output).to include("Project doesn't exist: 'House Work'")
  end

  it "displays the edit project menu when all goes well" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("c   Change the project name")
    expect(output).to include("a   Add a new task")
    expect(output).to include("ls  List all tasks")
    expect(output).to include("d   Delete a task")
    expect(output).to include("e   Edit a task")
    expect(output).to include("f   Finish a task")
    expect(output).to include("b   Back to Projects menu")
  end

  it "allows changing the project name via 'c' in the project menus" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n", "c\n", "Chores\n",
      "b\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include(
      "Changed project name from 'House work' to 'Chores'"
    )

    last_section = output.split("Listing projects").last
    expect(last_section).not_to include("House work")
    expect(last_section).to include("Chores")
  end

  it "allows adding a task with 'a' from the project menu" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n", "a\n",
      "clean out the freezer\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Enter a task name")
    expect(output).to include("Created task: 'clean out the freezer'")
  end

  it "shows an error message when listing tasks in a project that has none" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No tasks created in 'House work'")
  end

  it "lists the tasks in a project with 'ls' in the project menu, when there are tasks" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n", "a\n",
      "clean out the freezer\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    last_section = output.split("Listing tasks").last
    expect(last_section).to include("clean out the freezer")
  end

  it "shows an error message when trying to edit that does not exist" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n", "e\n",
      "clean out the freezer\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Task doesn't exist: 'clean out the freezer'")
  end

  it "allows editing a task name" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "a\n", "clean out the freezer\n", "e\n", "clean out the freezer\n",
      "clean out fridge\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include(
      "Changed task name from 'clean out the freezer' to 'clean out fridge'"
    )

    last_section = output.split("Listing tasks").last
    expect(last_section).to_not include("clean out the freezer")
    expect(last_section).to include("clean out fridge")
  end

  it "shows an error message when deleting a task when there are no tasks" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "d\n", "clean out the freezer\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No tasks created in 'House work'")
  end

  it "shows an error message when deleting a task that does not exist" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "a\n", "clean out the freezer\n",
      "d\n", "eat defrosting food\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Task doesn't exist: 'eat defrosting food'")
  end

  it "allows deleting a task task that exists" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "a\n", "clean out the freezer\n",
      "d\n", "clean out the freezer\n", "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No tasks created in 'House work'")
    expect(output).to include("Deleted task: 'clean out the freezer'")
  end

  it "shows an error message when trying to finish a task, and there are no tasks" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "f\n", "clean out the freezer\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("No tasks created in 'House work'")
  end

  it "shows an error when trying to finish a task that doesn't exist" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "a\n", "clean out the freezer\n",
      "f\n", "eat defrosting food\n",
      "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Task doesn't exist: 'eat defrosting food'")
  end

  it "allows finishing a task" do
    stdout = StringIO.new("")
    stdin = StringIO.new("")
    app = App.new(stdout, stdin)

    allow(stdin).to receive(:gets).and_return(
      "a\n", "House work\n", "e\n", "House work\n",
      "a\n", "clean out the freezer\n",
      "f\n", "clean out the freezer\n",
      "ls\n", "q\n"
    )

    app.run

    output = normalized_output(stdout)
    expect(output).to include("Finished task: 'clean out the freezer'")
    expect(output).to include("No tasks created in 'House work'")
  end
end
