director default_shield fallback {
    { .backend = ssl_shield_iad_va_us; }
}

director cgh_shield fallback {
    { .backend = ssl_shield_cgh_saopaulo_br; }
    { .backend = ssl_shield_iad_va_us; }
}

director syd_shield fallback {
    { .backend = ssl_shield_sydney_au; }
    { .backend = ssl_shield_iad_va_us; }
}

director lon_shield fallback {
    { .backend = ssl_shield_lon_london_uk; }
    { .backend = ssl_shield_iad_va_us; }
}

director hnd_shield fallback {
    { .backend = ssl_shield_hnd_tokyo_jp; }
    { .backend = ssl_shield_iad_va_us; }
}

director fra_shield fallback {
    { .backend = ssl_shield_frankfurt_de; }
    { .backend = ssl_shield_iad_va_us; }
}