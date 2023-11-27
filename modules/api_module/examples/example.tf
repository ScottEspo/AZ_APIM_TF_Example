module "api_example_test" {
  source          = "../"
  publisher_email = "email@test.com"

  api = {
    name        = "Scott Test"
    path        = "conference"
    protocols   = ["http"]
    service_url = "http://conferenceapi.azurewebsites.net"
    json        = file("./example.json")
  }

  create_rg      = false
  rg_name        = "1-27201464-playground-sandbox"
  create_product = true
  product_name   = "scott Product"
  create_apim    = true
  apim_name      = "scott APIM"
}