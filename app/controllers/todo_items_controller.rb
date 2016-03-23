class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]
    
    def complete
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to @todo_list, notice: "Todo item completed"
    end
    
    def index
        @todo_item = TodoList.find(params[:todo_list_id]).todo_items.find(params[:id])
    end
    
    def show
    end
    
    def new
        @todo_item = @todo_list.todo_items.new
    end
    
    def create
        @todo_item = @todo_list.todo_items.new(todo_item_params)
        
        respond_to do |format|
            if @todo_item.save
                format.html { redirect_to @todo_list, notice: 'Todo item was successfully created.' }
                format.json { render :show, status: :created, location: @todo_item }
            else
                format.html { render :new }
                format.json { render json: @todo_item.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def update
        @todo_item.todo_list = @todo_list
        respond_to do |format|
            if @todo_item.update(todo_item_params)
                format.html { redirect_to @todo_list, notice: 'Todo item was successfully updated.' }
                format.json { render :show, status: :ok, location: @todo_item }
          else
            format.html { render :edit }
                format.json { render json: @todo_item.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def destroy
        if @todo_item.destroy
            flash[:success] = "Todo List item was deleted."
        else
            flash[:error] = "Todo List item could not be deleted."
        end
        redirect_to @todo_list
    end
    
    
    private
    
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end
    
    def set_todo_item
        @todo_item = @todo_list.todo_items.find(params[:id]) 
    end
    
    def todo_item_params
        params.require(:todo_item).permit(:content)
    end
end
