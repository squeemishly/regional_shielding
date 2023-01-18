terraform {
  required_providers {
    fastly = {
      source = "fastly/fastly"
      version = "3.0.4"
    }
  }
}

resource "fastly_service_vcl" "region-shielding-test" {
  name = "shielding by region"

  domain {
    name    = "squee-region-routing-test.global.ssl.fastly.net"
    comment = "Terraform Demo"
  }

  backend {
    address = "httpbin.org"
    name    = "HTTPbin"
    port    = 443
  }

  # dummy backends to get shielding setups
  backend {
    name             = "dummy_iad"
    address          = "192.0.2.0"
    port             = 443
    use_ssl          = true
    shield           = "iad-va-us"
    ssl_check_cert   = false
    auto_loadbalance = false
  }

  backend {
    name             = "dummy_cgh"
    address          = "192.0.2.0"
    port             = 443
    use_ssl          = true
    shield           = "cgh-saopaulo-br"
    ssl_check_cert   = false
    auto_loadbalance = false
  }

  backend {
    name             = "dummy_syd"
    address          = "192.0.2.0"
    port             = 443
    use_ssl          = true
    shield           = "sydney-au"
    ssl_check_cert   = false
    auto_loadbalance = false
  }

  backend {
    name             = "dummy_lhr"
    address          = "192.0.2.0"
    port             = 443
    use_ssl          = true
    shield           = "lon-london-uk"
    ssl_check_cert   = false
    auto_loadbalance = false
  }

  backend {
    name             = "dummy_hnd"
    address          = "192.0.2.0"
    port             = 443
    use_ssl          = true
    shield           = "hnd-tokyo-jp"
    ssl_check_cert   = false
    auto_loadbalance = false
  }

  backend {
    name             = "dummy_fra"
    address          = "192.0.2.0"
    port             = 443
    use_ssl          = true
    shield           = "frankfurt-de"
    ssl_check_cert   = false
    auto_loadbalance = false
  }

  vcl {
    name = "main"
    main = true
    content = "${file("vcls/main.vcl")}"
  }

  vcl {
    name    = "shielding"
    content = file("vcls/shielding.vcl")
    main    = false
  }

  vcl {
    name    = "directors"
    content = file("vcls/directors.vcl")
    main    = false
  }
}
