class StacksController < ApplicationController
  # GET /stacks
  # GET /stacks.json
  require 'will_paginate/array'
  before_filter :authenticate_user






  def index
    @card = Card.new
   
    
    if params[:tag]
      @stacks =  current_user.stacks.tagged_with(params[:tag]).paginate(:per_page => 10, :page => params[:page])
    else
      @stacks =  current_user.stacks.paginate(:per_page => 10, :page => params[:page])
    end
    if(cookies[:stack_id])
      @selected_stack = Stack.find(cookies[:stack_id].to_i)
          
    end

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @stacks }
    end

  end

  def manage
     @stacks =  current_user.stacks
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
    @stack = Stack.find(params[:id])#.paginate(:per_page => 10, :page => params[:page]) 
    @stack_card = Card.new(:stack_id => @stack.id)
    @cards = @stack.cards.paginate(:per_page => 10, :page => params[:page]) 
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stack }
    end
  end

  # GET /stacks/new
  # GET /stacks/new.json
  def new
    @stack = Stack.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stack }
    end
  end

  # GET /stacks/1/edit
  def edit
    @stack = Stack.find(params[:id])
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = Stack.new(params[:stack])
    @stack.user_id=session[:user_id]



    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.json { render json: @stack, status: :created, location: @stack }
      else
        format.html { render action: "new" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stacks/1
  # PUT /stacks/1.json
  def update
    @stack = Stack.find(params[:id])

    respond_to do |format|
      if @stack.update_attributes(params[:stack])
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy

    respond_to do |format|
      format.html { redirect_to stacks_url }
      format.json { head :no_content }
    end
  end


end
