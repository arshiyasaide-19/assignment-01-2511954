## ETL Decisions

### Decision 1 — Standardized date format
Problem: The raw file had dates written in different formats such as `29/08/2023`, `12-12-2023`, and `2023-02-05`.
Resolution: I converted all dates into one standard format: `YYYY-MM-DD`. This made the date data consistent and easier to use in the date dimension table.

### Decision 2 — Fixed category names
Problem: The category column was not consistent. Some rows had `electronics` while others had `Electronics`, and some had `Grocery` while others had `Groceries`.
Resolution: I standardized the category values into common names. I used `Electronics`, `Clothing`, and `Grocery` so that the same category would not appear as separate values in reports.

### Decision 3 — Filled missing store city values
Problem: Some rows had NULL or missing values in the `store_city` column even though the store name was available.
Resolution: I filled the missing city values by using the matching store name from other rows. For example, `Mumbai Central` was mapped to `Mumbai`, `Chennai Anna` to `Chennai`, `Delhi South` to `Delhi`, and `Pune FC Road` to `Pune`.
