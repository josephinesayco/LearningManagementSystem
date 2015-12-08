module ApplicationHelper
  def show_flash_messages
    hash = {
      :error   => 'alert alert-danger',
      :alert   => 'alert alert-danger',
      :warning   => 'alert alert-warning',
      :info    => 'alert alert-info',
      :success => 'alert alert-success'
    }

    content_tag :div, class: "container alert-area" do
      hash.keys.each do |flash_type|
        if flash[flash_type]
          safe_concat %{
            <div class='#{hash[flash_type]}'>
              <button class='close' data-dismiss='alert' type='button'>
                <i class='icon-remove'></i>
              </button>
              #{flash[flash_type]}
            </div>
          }
        end
      end
    end unless flash.blank?
  end
end
