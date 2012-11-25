class ComplexGraphsController < ApplicationController
  # GET /complex_graphs
  # GET /complex_graphs.json
  def index
    @complex_graphs = ComplexGraph.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @complex_graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end

  # GET /complex_graphs/1
  # GET /complex_graphs/1.json
  def show
    @complex_graph = ComplexGraph.find(params[:id])
    resolution = HoshiMi::Resolution.new(params[:resolution] || 'day')
    morris = HoshiMi::MorrisGraph.new
    morris.data = @complex_graph.logs_by(resolution).map {|time, values|
      values.
        map{|graph, value| { graph.name => value } }.
        reduce(:merge).
        merge(:x => resolution.format(time))
    }
    morris.labels = @complex_graph.graphs.map{|item| item.name }
    morris.colors = @complex_graph.graphs.map{|item| item.color }
    @resolution = resolution.resolution
    @graph_js = morris.to_js

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @complex_graph }
    end
  end

  # GET /complex_graphs/new
  # GET /complex_graphs/new.json
  def new
    @complex_graph = ComplexGraph.new
    @graphs = Graph.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @complex_graph }
    end
  end

  # GET /complex_graphs/1/edit
  def edit
    @complex_graph = ComplexGraph.find(params[:id])
    @graphs = Graph.all
  end

  # POST /complex_graphs
  # POST /complex_graphs.json
  def create
    @complex_graph = ComplexGraph.new(params[:complex_graph])
    @complex_graph.created_by = current_user

    respond_to do |format|
      if @complex_graph.save
        format.html { redirect_to @complex_graph, :notice => 'Complex graph was successfully created.' }
        format.json { render :json => @complex_graph, :status => :created, :location => @complex_graph }
      else
        format.html { render :action => "new" }
        format.json { render :json => @complex_graph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /complex_graphs/1
  # PUT /complex_graphs/1.json
  def update
    @complex_graph = ComplexGraph.find(params[:id])
    @complex_graph.graphs = Graph.where(:id => params[:graph].map{|id,_| id })

    respond_to do |format|
      if @complex_graph.update_attributes(params[:complex_graph])
        format.html { redirect_to @complex_graph, :notice => 'Complex graph was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render(:action => "edit") }
        format.json { render(:json => @complex_graph.errors, :status => :unprocessable_entity) }
      end
    end
  end

  # DELETE /complex_graphs/1
  # DELETE /complex_graphs/1.json
  def destroy
    @complex_graph = ComplexGraph.find(params[:id])
    @complex_graph.destroy

    respond_to do |format|
      format.html { redirect_to complex_graphs_url }
      format.json { head :no_content }
    end
  end
end
