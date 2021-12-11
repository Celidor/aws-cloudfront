resource "aws_cloudfront_response_headers_policy" "security_header_policy" {
  name = "security-headers-policy"

  security_headers_config {

    content_security_policy {
      override                = true
      content_security_policy = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"
    }
    content_type_options {
      override = true
    }

    frame_options {
      override     = true
      frame_option = "DENY"
    }

    referrer_policy {
      override        = true
      referrer_policy = "no-referrer"
    }

    strict_transport_security {
      override                   = true
      access_control_max_age_sec = 63072000
      include_subdomains         = true
      preload                    = true
    }

    xss_protection {
      override   = true
      mode_block = true
      protection = true
    }
  }

  custom_headers_config {
    items {
      header   = "permissions-policy"
      override = true
      value    = "accelerometer=(none), ambient-light-sensor=(none), autoplay=(none), camera=(none), encrypted-media=(none), fullscreen=(none), geolocation=(none), gyroscope=(none), magnetometer=(none), microphone=(none), midi=(none), payment=(none), picture-in-picture=(none), speaker=(none), usb=(none), vibrate=(none), vr=(none)"
    }
  }
}