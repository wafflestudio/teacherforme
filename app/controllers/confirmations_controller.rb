class ConfirmationsController < Devise::ConfirmationsController
  after_filter :confirm_things, :only => [:show]
  def show
    super
  end

  private
  def confirm_things
    self.resource.teachers.each do |t|
      t.update_attribute(:confirmed, true)
    end
    self.resource.students.each do |s|
      s.update_attribute(:confirmed, true)
    end
  end
end
