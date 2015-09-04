if Rails.version < '3.0'
  ActionController::Routing::Routes.draw do |map|
    map.with_options :controller => 'treeissues' do |treeissues|
      treeissues.connect 'projects/:project_id/treeissues', :action => 'index'
      treeissues.connect 'projects/:project_id/treeissues/:action/:parent_id'
      treeissues.connect 'projects/:project_id/treeissues/:action/:parent_id/:indent'
    end
  end
else
  match 'projects/:project_id/treeissues/:action', via: [:get,:post], :controller => 'treeissues'
  match 'projects/:project_id/treeissues/:action/:parent_id(/:indent)', via: [:get,:post], :controller => 'treeissues'
end