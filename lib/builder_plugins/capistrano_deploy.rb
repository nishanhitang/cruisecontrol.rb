class CapistranoDeploy
  attr_accessor :server

  # Called when cruisecontrol starts and loads the plugin
  def initialize(project = nil)
    @server = ""
    @project = project
  end

  # Runs when a build is finished (checkout, tests etc;)
  def build_finished(build)
    # If server isn't defined or the build fails
    return if @server.empty? or build.failed?
    # Otherwise run the command to deploy the code to the supplied server.
    # CommandLine.execute "cd #{@project.path}/work && cap deploy"
    CommandLine.execute "pwd"
  rescue Exception
    build.fail!("Couldn't deploy via cruisecontrol")
  end
end

Project.plugin :capistrano_deploy