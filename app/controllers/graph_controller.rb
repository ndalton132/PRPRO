class GraphsController < ApplicationController
    # ...
  
    def create
      @project = Project.find(params[:project_id])
      @graph = @project.graphs.create(graph_params)
      redirect_to project_path(@project)
    end
  
    private
      def graph_params
        params.require(:graph).permit(:description, :priority)
      end
  end



