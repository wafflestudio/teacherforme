module TeachersHelper
  def checklabel_tag(name_const,label_name)
    return check_box_tag("teacher[year][]", name_const, nil, :id => "teacher_year_#{name_const}")\
    +label_tag("teacher_year_#{name_const}", label_name, :style => "display: inline;")
  end
end
