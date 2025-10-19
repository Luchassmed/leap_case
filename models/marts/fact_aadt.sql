{{ config(materialized='table') }}

-- nogle steder har flere rækker per år så bliver nødt til at aggregerer til en række per (T_NR, AAR)
select
  T_NR,
  AAR,
  max(AADT_CYKLER) as AADT_CYKLER,
  max(AADT_KORETOJER) as AADT_KORETOJER,
  max(PEAKDAY_CYKLER) as PEAKDAY_CYKLER,
  max(CYKLER_7_19) as CYKLER_7_19,
  max(KTJ_7_19) as KTJ_7_19,
  max(TUNG_PCT_REAL) as TUNG_PCT_REAL,
  max(LADCYKLER_PCT_REAL) as LADCYKLER_PCT_REAL
from {{ ref('staging_trafiktal') }}
group by 1,2
