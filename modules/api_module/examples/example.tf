module "api_example_test" {
  source          = "../"
  publisher_email = "email@test.com"

  api = {
    name        = "ScottTest"
    path        = "conference"
    protocols   = ["http"]
    service_url = "https://productsespo.azurewebsites.net/api/HttpExample?code=cCzUkhsrxW5gLSAvwE6bMAVDC5dQFtB1XX8zMbYQZCLvAzFu9_Ae1Q=="
    json        = file("./example.json")
    # json = "http://conferenceapi.azurewebsites.net/?format=json"
  }

  create_rg      = false
  rg_name        = "1-fc2cba9d-playground-sandbox"
  create_product = true
  product_name   = "scott Product"
  create_apim    = true
  apim_name      = "scott APIM"
}