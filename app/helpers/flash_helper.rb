module FlashHelper
  def class_for_alert(flash_type)
    alert_classes = {
        'success' => 'alert-success',
        'error'   => 'alert-danger',
        'alert'   => 'alert-warning',
        'notice'  => 'alert-info',
        'info'    => 'alert-info'
    }

    alert_classes[flash_type] || flash_type.to_s
  end

end