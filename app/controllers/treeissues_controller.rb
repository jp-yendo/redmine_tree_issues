class TreeissuesController < ApplicationController
  before_filter :find_project

  def index
  end

  def children
    render :layout => false unless params[:parent_id].nil?
  end

  def find_project
    @project = Project.find(params[:project_id])
   
    @issues = @project.issues.where(:parent_id => params[:parent_id])
    @arIssues = []
    @issues.map {|issue|
      pid=issue.id
      children = @project.issues.where(:parent_id => pid)
      item = {}
      item['children'] = children.size
      item['issue'] = issue;
      @arIssues << item
    }
    @arIssues.sort!{|a,b|b['children']<=>a['children']}
  end
end
