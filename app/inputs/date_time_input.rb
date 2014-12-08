class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input(wrapper_options)
    input_html_options[:value] = object.send(attribute_name) # Form builder was ignoring the set time zone.
    input_html_options[:class] << "datetime-input"
    input_html_options['data-format'] = 'dd.MM.yyyy hh:mm'

    template.content_tag :div, id: 'datepicker', class: 'datetimepicker input-append date' do

      @builder.text_field(attribute_name, input_html_options) +

      template.capture_haml do

        template.haml_tag :span, class: 'add-on' do
          template.haml_tag :i, 'data-time-icon' => 'fa fa-clock-o', 'data-date-icon' => 'fa fa-calendar'
        end
      end
    end
  end
end