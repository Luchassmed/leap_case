# København Trafiktal - Snowflake + dbt

## Formål

Lille analyse pipeline for københavnsk cykeltrafik, plus en personlig pendler tabel

## Modeller

- `staging_trafiktal` (view): Indtastet og omdøbt, fra RAW
- `fact_aadt` (table): Metrics såsom, AADT_CYKLER, PEAKDAY_CYKLER og CYKLER_7_19
- `dim_counter` (table): Attributter per T_NR
- `til_leap` (table): En seed liste over udvalgte T_NR + join fact_aadt, sat i rækkefølge efter RAEKKEFOELGE

## Tests

- Keys `not_null`
- `dbt_utils.unique_combination_of_columns` på (T_NR, AAR)
- `dbt_utils.accepted_range`

## Opsætning (dbt Core)

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
dbt deps
dbt build          # kører seeds + models + tests
dbt docs generate && dbt docs serve --port 8080
```
