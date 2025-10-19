{{ config(materialized='table') }}

with ranked as (
  select
    T_NR, VEJNAVN, BESKRIVELSE, AAR,
    row_number() over (partition by T_NR order by AAR desc) as rn
  from {{ ref('staging_trafiktal') }}
)
select
  T_NR as T_NR,
  any_value(VEJNAVN) as VEJNAVN,
  any_value(BESKRIVELSE) as BESKRIVELSE
from ranked
where rn = 1
group by T_NR
