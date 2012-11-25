class ServiceController < ApplicationController
  def index
    @graphs = Graph.all + ComplexGraph.all

    respond_to do |format|
      format.html # index.html.erb
      user = current_user
      format.json { render :json => @graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end

  def service
    @service = params[:service]
    @graphs = graph_where(:service => @service)

    respond_to do |format|
      format.html # index.html.erb
      user = current_user
      format.json { render :json => @graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end

  def section
    @service = params[:service]
    @section = params[:section]
    @graphs  = graph_where(:service => @service, :section => @section)

    respond_to do |format|
      format.html # index.html.erb
      user = current_user
      format.json { render :json => @graphs.map{|g| g.as_json(:current_user => user)} }
    end
  end

  private
  def graph_where(cond)
    Graph.where(cond) + ComplexGraph.where(cond)
  end
end
