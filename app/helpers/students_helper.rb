module StudentsHelper
  def radiolabel_tag(name_const,label_name)
    return radio_button_tag("student[year]", name_const, nil, :id => "student_year_#{name_const}")\
    +label_tag("student_year_#{name_const}", label_name, :style => "display: inline;")
  end
end
