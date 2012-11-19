class GraphsController < ApplicationController
  # GET /graphs
  # GET /graphs.json
  def index
    @graphs = Graph.all

    respond_to do |format|
      format.html # index.html.erb
      user = current_user
      format.json { render :json => @graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end

  # GET /graphs/1
  # GET /graphs/1.json
  def show
    @graph = Graph.find(params[:id])
    resolution = HoshiMi::Resolution.new(params[:resolution] || 'day')

    morris = HoshiMi::MorrisGraph.new
    morris.data = @graph.logs_by(resolution).map {|time, value|
      {:x => resolution.format(time), :y => value }
    }
    morris.label = @graph.name
    morris.color = @graph.color
    @resolution = resolution.resolution
    @graph_js = morris.to_js

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @graph.as_json(:current_user => current_user) }
    end
  end

  # GET /graphs/new
  # GET /graphs/new.json
  def new
    @graph = Graph.new
    @graph.created_by = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @graph }
    end
  end

  # GET /graphs/1/edit
  def edit
    @graph = Graph.find(params[:id])
  end

  # POST /graphs
  # POST /graphs.json
  def create
    @graph = Graph.new(params[:graph])
    @graph.created_by = current_user

    respond_to do |format|
      if @graph.save
        format.html { redirect_to @graph, :notice => 'Graph was successfully created.' }
        format.json { render :json => @graph, :status => :created, :location => @graph }
      else
        format.html { render :action => "new" }
        format.json { render :json => @graph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /graphs/1
  # PUT /graphs/1.json
  def update
    @graph = Graph.find(params[:id])

    respond_to do |format|
      if @graph.update_attributes(params[:graph])
        format.html { redirect_to @graph, :notice => 'Graph was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @graph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /graphs/1
  # DELETE /graphs/1.json
  def destroy
    @graph = Graph.find(params[:id])
    @graph.destroy

    respond_to do |format|
      format.html { redirect_to graphs_url }
      format.json { head :no_content }
    end
  end

  def service
    @service = params[:service]
    @graphs = Graph.where(:service => @service)

    respond_to do |format|
      format.html # index.html.erb
      user = current_user
      format.json { render :json => @graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end

  def section
    @service = params[:service]
    @section = params[:section]
    @graphs  = Graph.where(:service => @service, :section => @section)

    respond_to do |format|
      format.html # index.html.erb
      user = current_user
      format.json { render :json => @graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end
end
