class TodosController < ApplicationController
	# => set layout for all view
	layout "todos"

	# => defined construct
	def initialize
		super
	end

	# get list todos
	def index
		@title = "List"
		@todos = Todo.order(id: :desc).paginate(:page => params[:page], :per_page => 5)
	end

	# creating todo item
	def create
		@title = "Create"
		@action = 'create'

		if request.get?
			@todo = Todo.new
		end

		if request.post?
			@todo = Todo.new(todo_params)
			if @todo.save
				flash[:notice] = "Creating todo successfully!"
				redirect_to todos_path(@todo)
			end
		end
	end

	# updating todo item
	def update
		@title = "Update with id = " + params[:id]
		@action = 'update'
		@todo = Todo.find(params[:id])

		if request.put?
			if @todo.update(todo_params)
				flash[:notice] = "Update todo successfully!"
				redirect_to todos_path(@todo)
			else
				render 'create'
			end
		else
			render 'create'
		end
	end

	# delete todo item
	def delete
		Todo.find(params[:id]).destroy
		flash[:notice] = "Deleting todo successfully!"
		redirect_to todos_path(@todo)
	end

	private
		# create todo params
		def todo_params
			params.require(:todo).permit(:title)
		end
end
