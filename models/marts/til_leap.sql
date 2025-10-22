with ids as (
  select raekkefoelge, T_NR
  from {{ ref('til_leap_t_nr') }}
)
select
  i.raekkefoelge,
  r.T_NR,
  r.AAR,
  r.AADT_CYKLER,
  r.PEAKDAY_CYKLER,
  r.CYKLER_7_19
from {{ ref('fact_aadt') }} r
join ids i
  on r.T_NR = i.T_NR
order by i.raekkefoelge
