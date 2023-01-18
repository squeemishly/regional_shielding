table site_shield BACKEND {
  "SYD": syd_shield,
  "LON": lon_shield,
  "HND": hnd_shield,
  "FRA": fra_shield,
  "CGH": cgh_shield,
  "IAD": default_shield,
}

table region_shielding {
  "SA-North"     : "CGH",
  "SA-South"     : "CGH",
  "SA-East"      : "CGH",
  "APAC"         : "SYD",
  "EU-West"      : "LON",
  "EU-East"      : "FRA",
  "EU-Central"   : "FRA",
  "South-Africa" : "LON",
  "AF-West"      : "LON",
  "Asia-South"   : "HND",
  "Asia"         : "HND",
}