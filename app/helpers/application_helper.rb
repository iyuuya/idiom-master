module ApplicationHelper
  def active?(name)
    controller_name == name
  end
end
