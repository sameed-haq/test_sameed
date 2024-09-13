terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}
provider "harness" {
  endpoint         = "https://qa.harness.io/gateway"
  account_id       = "Ws0xvw71Sm2YmpSC7A8z4g"
  platform_api_key = "pat.Ws0xvw71Sm2YmpSC7A8z4g.66a71532fc4a487bcbcbecb6.Q3NobVGcy0OkNQ2pa6Pq"
}
