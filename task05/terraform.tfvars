resource_groups = {
  rg1 = {
    name     = "cmaz-6bbc5609-mod5-rg-01"
    location = "westeurope"
  }
  rg2 = {
    name     = "cmaz-6bbc5609-mod5-rg-02"
    location = "eastus"
  }
  rg3 = {
    name     = "cmaz-6bbc5609-mod5-rg-03"
    location = "northeurope"
  }
}

app_service_plans = {
  asp1 = {
    name           = "cmaz-6bbc5609-mod5-asp-01"
    resource_group = "cmaz-6bbc5609-mod5-rg-01"
    location       = "westeurope"
    sku_name       = "P0v3"
    worker_count   = 2
  }
  asp2 = {
    name           = "cmaz-6bbc5609-mod5-asp-02"
    resource_group = "cmaz-6bbc5609-mod5-rg-02"
    location       = "eastus"
    sku_name       = "P1v3"
    worker_count   = 1
  }
}

web_apps = {
  app1 = {
    name           = "cmaz-6bbc5609-mod5-app-01"
    resource_group = "cmaz-6bbc5609-mod5-rg-01"
    location       = "westeurope"
    plan_key       = "asp1"
  }
  app2 = {
    name           = "cmaz-6bbc5609-mod5-app-02"
    resource_group = "cmaz-6bbc5609-mod5-rg-02"
    location       = "eastus"
    plan_key       = "asp2"
  }
}

traffic_manager = {
  name           = "cmaz-6bbc5609-mod5-traf"
  location       = "global"
  resource_group = "cmaz-6bbc5609-mod5-rg-03"
  routing_method = "Performance"
  endpoints = {
    app1 = {
      location = "westeurope"
    }
    app2 = {
      location = "eastus"
    }
  }
}

verification_ip = "18.153.146.156"

tags = {
  Creator = "milosz_markowski@epam.com"
}

allow_ip = "18.153.146.156"
allow_tm = "AzureTrafficManager"
