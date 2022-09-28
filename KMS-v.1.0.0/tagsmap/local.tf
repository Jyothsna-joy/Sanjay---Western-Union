locals {
  business_unit_code = {
    CMT               = "C"
    Compliance        = "M"
    Corporate         = "I"
    CustomHouse       = "H"
    DataAndAnalytics  = "A"
    Digital           = "D"
    Domain            = "X"
    OrlandiValuta     = "O"
    Paymap            = "P"
    Speedpay          = "S"
    Vigo              = "V"
    WUBS              = "B"
    WesternUnion      = "W"
  }

  aws_region_code = {
    ap-southeast-1    = "SG"
    eu-central-1      = "FR"
    us-east-1         = "NV"
    us-east-2         = "OH"
    us-west-1         = "IR"
    us-west-2         = "OR"
  }

  aws_account_code = {
    "677930457167" = "SBC" # ccoe-sandbox
    "497960940940" = "CNP" # cmt-non-production
    "186103555612" = "CPN" # cmt-production
    "644370806612" = "CMN" # compliance-non-production
    "899085411723" = "CMP" # compliance-production
    "417044663462" = "INP" # corporate-non-production
    "831494737001" = "IPN" # corporate-production
    "451210606940" = "CT1" # cttest1
    "673745506036" = "CT2" # cttest2
    "481548857036" = "DNA" # dataanalytics-non-production
    "682347870277" = "DPA" # dataanalytics-production
    "646148042470" = "DNP" # digital-non-production
    "238651177297" = "DPN" # digital-production
    "545672846314" = "ENP" # enterprisebus-non-production
    "929572413282" = "EPN" # enterprisebus-production
    "857726694254" = "SBG" # green-sandbox
    "006602859727" = "LAB" # lab
    "446025321593" = "LOG" # log-archive
    "183270399954" = "1NP" # oneplatform-non-production
    "907001299226" = "1PN" # oneplatform-production
    "080118055312" = "1QA" # oneplatform-qa
    "538686830857" = "1UA" # oneplatform-uat
    "271539850766" = "SAN" # saas-non-production
    "517949891193" = "SAP" # saas-production
    "757997098770" = "SEC" # security
    "794393546049" = "SHS" # shared-services
    "231986907715" = "WSP" # workspace-production
    "976608772652" = "WBN" # wubanking-non-production
    "452848208586" = "WBP" # wubanking-production
    "591011737028" = "WBT" # wubanking-tools
    "183974019318" = "WNP" # wubs-non-production
    "084737737105" = "WPN" # wubs-production
    "233425133219" = "TEST" # test
  }

  production_level_code = {
    Development         = "0"
    QA                  = "1"
    UAT                 = "2"
    Performance         = "3"
    PreProd             = "4"
    Demo                = "5"
    Spare               = "6"
    ProductionNextDay   = "7"
    Production4hoursfix = "8"
    MissionCritical     = "9"
  }

  common_tags = {
    ApplicationName     = var.application_name
    ApplicationCode     = var.application_code
    ApplicationOwner    = var.application_owner
    CostCenter          = var.cost_center
    Domain              = var.domain
    Environment         = var.environment
    PatchGroup          = var.patch_group
    ProductTower        = var.product_tower
    RequestID           = var.request_id
    SecurityPosture     = var.security_posture
    SupportContact      = var.support_contact
  }

  # Naming prefix in Upper Case
  naming_prefix_upper = format("%sA%s-%s-%s", local.business_unit_code[var.business_unit], local.aws_region_code[var.aws_region], local.aws_account_code[data.aws_caller_identity.current.account_id], local.production_level_code[var.production_level_code])

  # Naming prefix in Lower Case
  naming_prefix_lower = lower(local.naming_prefix_upper)
}