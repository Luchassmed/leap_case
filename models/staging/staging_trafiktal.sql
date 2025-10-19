{{ config(materialized='view') }}

with src as (
  select * from {{ source('raw','TRAFIKTAL_RAW') }}
)
select
  -- keys
  T_NR::int as T_NR,
  AAR::int as AAR,

  -- labels
  VEJNAVN::string as VEJNAVN,
  BESKRIVELSE::string as BESKRIVELSE,
  TAELLING_TYPE::string as TAELLING_TYPE,

  -- kerne metrics
  AADT_CYKLER::int as AADT_CYKLER,
  AADT_KORETOJER::int as AADT_KORETOJER,

  -- hverdagstrafik til peakday.
  HVDT_CYKLER::int as PEAKDAY_CYKLER,

  -- flere felter 
  CYKLER_7_19::int as CYKLER_7_19,
  KTJ_7_19::int as KTJ_7_19,
  TUNG_PCT_REAL::float as TUNG_PCT_REAL,
  LADCYKLER_PCT_REAL::float as LADCYKLER_PCT_REAL

from src
-- tællersted + år
where T_NR is not null and AAR is not null
